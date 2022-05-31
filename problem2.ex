list = IO.gets("list: ")

list = list |> String.replace("\n", "") |> String.split(" ", trim: true)

result = Enum.reduce(list, %{

number: [],

odd_number: [],

even_number: [],

text: []

}, fn value, acc ->

case Integer.parse(value) do

{int_value, ""} when rem(int_value, 2) == 1 ->

Map.merge(acc, %{

number: acc.number ++ [value],

odd_number: acc.odd_number ++ [value]

})

{int_value, ""} when rem(int_value, 2) == 0 ->

Map.merge(acc, %{

number: acc.number ++ [value],

even_number: acc.even_number ++ [value]

})

{_int_value, _} ->

Map.put(acc, :text, acc.text ++ [value])

:error ->

Map.put(acc, :text, acc.text ++ [value])

end

end

)

IO.inspect result




search = IO.gets("Search Index: ")

search = String.replace(search,"\n","")

index = Enum.find_index(list, fn x -> x == search end)

IO.puts("Index = #{index}")
