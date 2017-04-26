defmodule ProteinTranslation do
  @codons %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }
  defp _of_rna([], acc), do: {:ok, acc}
  defp _of_rna([_head | []], _acc), do: {:error, "invalid RNA"}
  defp _of_rna([_head | [_head2 | []]], _acc), do: {:error, "invalid RNA"}
  defp _of_rna([head | [ head2 | [ head3 | tail]]], acc) do
    codon = head <> head2 <> head3
    {_result, protein} = of_codon(codon)
    case protein do
      "invalid codon" ->
        {:error, "invalid RNA"}
      "STOP" ->
        {:ok , acc}
      _ ->
        _of_rna(tail, (acc ++ [protein]))
    end
  end

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    rna
      |> String.split("", trim: true)
      |> _of_rna([])

  end

  defp _of_codon(nil), do: { :error , "invalid codon"}
  defp _of_codon(protein), do: { :ok, protein}

  @doc """
  Given a codon, return the corresponding protein
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
     _of_codon(Map.get @codons, codon)
  end

end
