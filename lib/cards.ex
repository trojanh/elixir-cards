defmodule Cards do
  def create_deck do
   values = ["ACE", "KING", "ONE", "TWO", "THREE", "FOUR", "FIVE"]
   suits = ["SPADES", "CLUBS", "HEARTS", "DIAMONDS"]

   for suit <- suits, value <- values do
    "#{value} of #{suit}"
   end
  end

  def deal(deck, hands) do
    Enum.split(deck, hands)
  end

  def shuffle_deck(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck, filename) do
    file = :erlang.term_to_binary(deck)
    File.write(filename, file)
  end

  def create_hand(hands) do
    Cards.create_deck()
    |> Cards.shuffle_deck
    |> Cards.deal(hands)
  end

  def open(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File Not Found"
    end
  end
end
