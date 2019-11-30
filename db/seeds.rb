require 'json'
require 'open-uri'

URL = "https://raw.githubusercontent.com/maltyeva/iba-cocktails/master/recipes.json".freeze

Cocktail.delete_all if Rails.env.development?

cocktails = JSON.parse(open(URL).read)
cocktails.each do |cocktail|
  Cocktail.create!(
    name: cocktail["name"],
    glass: cocktail["glass"],
    preparation: cocktail["preparation"],
  )
end
