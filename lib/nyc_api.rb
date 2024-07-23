require 'net/http'
require 'open-uri'
require 'json'

class GetTypes
  URL = "https://pokeapi.co/api/v2/pokemon/3/"

  def get_pokemon
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def pokemon_types
    pokemon = JSON.parse(self.get_pokemon)
    pokemon["types"].map do |type|
      type["type"]["name"]
    end
  end
end

pokemon = GetTypes.new
pp pokemon.pokemon_types
