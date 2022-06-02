defmodule ExprojectWeb.TransporterView do
  use ExprojectWeb, :view
  alias ExprojectWeb.TransporterView

  def render("index.json", %{transporter: transporter}) do
    %{data: render_many(transporter, TransporterView, "transporter.json")}
  end

  def render("show.json", %{transporter: transporter}) do
    %{data: render_one(transporter, TransporterView, "transporter.json")}
  end

  def render("transporter.json", %{transporter: transporter}) do
    %{
      id: transporter.id,
      name: transporter.name,
      phone_number: transporter.phone_number,
      npwp: transporter.npwp,
      status: transporter.status
    }
  end
end
