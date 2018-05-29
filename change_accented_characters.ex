defmodule ChangeAccentedName do
  @doc """
    Changing spanish accented characters to valid english characters to given name and returning same no accented characters found.
    Accented characters(Valid for naming): áéíóúüñÁÉÍÓÚÜÑ
    data = %{
      name: "ÑítüñÁÉésh",
      surname: "Mishra"
    }

    iex> ChangeAccentedName.replace_accented_characters(data)
    %{name: "NitunAEesh", surname: "Mishra"}

  """
  def replace_accented_characters(data) do
    [name, surname] = Enum.map([data.name, data.surname], fn(name) ->
      verify_accented_characters(name) |> replace_characters(name)
    end)

    %{data | name: name, surname: surname}
  end

  defp verify_accented_characters(name) do
    Regex.match?(~r/([á|é|í|ó|ú|ü|ñ|Á|É|Í|Ó|Ú|Ü|Ñ ])/, name)
  end

  defp replace_characters(false, name) do
    name
  end

  defp replace_characters(true, name) do
    name
      |> String.normalize(:nfd)
      |> String.replace(~r/[^A-z\s]/u, "")
  end
end
