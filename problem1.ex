import IO

name = IO.gets("name :")
name  = String.replace(name,"\n","")

puts("Hello, #{name}!")
