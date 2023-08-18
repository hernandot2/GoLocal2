# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cities = {
  city1: {
    name: "Rio de Janeiro",
    description: "É considerada uma cidade global. Possui clima Tropical úmido e relevo formado por planícies, serras e morros. Uma das suas feições características é o morro do Pão de Açúcar. Conta com 6.747.815 habitantes, sendo a segunda cidade mais populosa do Brasil."
  },
  city2: {
    name: "São Paulo",
    description: "É considerada uma cidade global. Possui clima Tropical úmido e relevo formado por planícies, serras e morros. Uma das suas feições características é o morro do Pão de Açúcar. Conta com 6.747.815 habitantes, sendo a segunda cidade mais populosa do Brasil."
  },
  city3: {
    name: "Belo Horizonte",
    description: "É considerada uma cidade global. Possui clima Tropical úmido e relevo formado por planícies, serras e morros. Uma das suas feições características é o morro do Pão de Açúcar. Conta com 6.747.815 habitantes, sendo a segunda cidade mais populosa do Brasil."
  }
}

cities.each do |city, info|
  city = City.new(name: info[:name], description: info[:description])
  city.save!
end
