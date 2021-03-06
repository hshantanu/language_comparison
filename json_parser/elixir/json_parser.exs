defmodule JSONParser do
  use Benchfella
  Benchfella.start

  def parse do
    {_, data} = File.read(Path.absname("json_parser/jsonData.json"))

    {_, json} = JSON.decode(data)

    max = Enum.max(Enum.map(json, fn(x) -> Map.get(x,"price") end))
    # IO.puts "max #{max}"

    max
  end

  bench "JSON Parser" do
    JSONParser.parse
  end
end