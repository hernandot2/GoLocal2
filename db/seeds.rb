# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users

User.destroy_all

users = {
  user1: {
    email: "test@example.com",
    password: "password123"
  }
}

users.each do |key, user_data|
  User.create!(user_data)
end

# Cities
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

created_cities = {}
cities.each do |key, city_data|
  created_cities[key] = City.create!(city_data)
end

# Neighborhoods
neighborhoods = {
  neighborhood1: {
    name: "Vila Indio",
    city_id: created_cities[:city1].id
  }
}

created_neighborhoods = {}
neighborhoods.each do |key, neighborhood_data|
  created_neighborhoods[key] = Neighborhood.create!(neighborhood_data)
end

# Locations
# Locations
locations = {
  location1: {
    name: "Bar Pavão Azul ",
    address: "Rua Hilário de Gouvêia, 71, Copacabana, Rio de Janeiro,RJ",
    description: "Um restaurante tradicional carioca com pratos típicos.",
    neighborhood_id: created_neighborhoods[:neighborhood1].id,
    user_id: User.first.id
  },

  location2: {
    name: "Bip Bip",
    address: "R. Alm. Gonçalves, 50,Copacabana, Rio de Janeiro,RJ",
    description: "Um tradicional bar carioca conhecido por suas rodas de samba.",
    neighborhood_id: created_neighborhoods[:neighborhood1].id,
    user_id: User.first.id
  },

  location3: {
    name: "Casa Carandaí",
    address: "R. Lopes Quintas, 165, Jardim Botânico, Rio de Janeiro,RJ",
    description: "A Casa Carandaí é sempre uma excelente opção e é prima pela qualidade tanto dos itens do mercadinho à frente, como da padaria e do restaurante.",
    neighborhood_id: created_neighborhoods[:neighborhood1].id,
    user_id: User.first.id
  }
}



created_locations = {}
locations.each do |key, location_data|
  created_locations[key] = Location.create!(location_data)
end

# Events
events = {
  event1: {
    title: "Carnaval Carioca",
    date: Date.new(2024, 2, 25),
    description: "O mais famoso carnaval do mundo, com desfiles de escolas de samba e festas por toda a cidade.",
    location_id: created_locations[:location1].id,
    user_id: User.first.id
  },
  event2: {
    title: "samba Maria",
    date: Date.new(2024, 2, 25),
    description: "Desde que lançou o álbum 'Samba Meu', em 2003, Maria Rita transita com imensa desenvoltura no universo do samba e hoje está consolidada como uma das grandes artistas do gênero.",
    location_id: created_locations[:location1].id,  # Usando location1 porque location2 não foi definido
    user_id: User.last.id
  }
}

events.each do |key, event_data|
  Event.create!(event_data)
end
