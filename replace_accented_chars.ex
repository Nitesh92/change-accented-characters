defmodule ReplaceAccentedCharacters do
  @doc """
    Changing spanish accented characters to valid english characters to given string and returning same incase of no accented characters found.
    Accented characters(Valid for naming): áéíóúüñÁÉÍÓÚÜÑ
    name = "NitáéíóúüñÁÉsh"

    iex> ReplaceAccentedCharacters.replace_characters(data)
    "NitaeiouunAEsh"

    String.normalize(string, form): Converts all characters in string to Unicode normalization form identified by form.

    Form: :nfd - Normalization Form Canonical Decomposition. Characters are
    decomposed by canonical equivalence, and multiple combining characters are
    arranged in a specific order. Eg:

    iex> String.normalize("yêṩ", :nfd)
    "yêṩ"
  """

  def replace_characters(name) do
    name
      |> String.normalize(:nfd)
      |> String.replace(~r/[^A-z\s]/u, "")
  end
end

