# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users

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
    name: "Vila Indigena",
    city_id: created_cities[:city1].id
  },
  neighborhood2: {
    name: "Vila Mar",
    city_id: created_cities[:city2].id
  },
  neighborhood3: {
    name: "Morro do Pão de Queijo",
    city_id: created_cities[:city3].id
  }
}

created_neighborhoods = {}
5.times do ||
  neighborhoods.each do |key, neighborhood_data|
    created_neighborhoods[key] = Neighborhood.create!(neighborhood_data)
  end
end

# Locations
locations = {
  location1: {
    name: "Restaurante Sabor Carioca",
    address: "Rua das Palmeiras, 100, Rio de Janeiro",
    description: "Um restaurante tradicional carioca com pratos típicos.",
    neighborhood_id: created_neighborhoods[:neighborhood1].id,
    user_id: User.first.id
  },
  location2: {
    name: "Restaurante Sabor Carioca",
    address: "Rua das Palmeiras, 100, Rio de Janeiro",
    description: "Um restaurante tradicional carioca com pratos típicos.",
    neighborhood_id: created_neighborhoods[:neighborhood2].id,
    user_id: User.first.id
  },
  location3: {
    name: "Restaurante Sabor Carioca",
    address: "Rua das Palmeiras, 100, Rio de Janeiro",
    description: "Um restaurante tradicional carioca com pratos típicos.",
    neighborhood_id: created_neighborhoods[:neighborhood3].id,
    user_id: User.first.id
  },
  location4: {
    name: "Restaurante Sabor Carioca",
    address: "Rua das Palmeiras, 100, Rio de Janeiro",
    description: "Um restaurante tradicional carioca com pratos típicos.",
    neighborhood_id: created_neighborhoods[:neighborhood1].id,
    user_id: User.first.id
  },
  location5: {
    name: "Restaurante Sabor Carioca",
    address: "Rua das Palmeiras, 100, Rio de Janeiro",
    description: "Um restaurante tradicional carioca com pratos típicos.",
    neighborhood_id: created_neighborhoods[:neighborhood2].id,
    user_id: User.first.id
  },
  location6: {
    name: "Restaurante Sabor Carioca",
    address: "Rua das Palmeiras, 100, Rio de Janeiro",
    description: "Um restaurante tradicional carioca com pratos típicos.",
    neighborhood_id: created_neighborhoods[:neighborhood3].id,
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
    location_id: created_locations[:location2].id,  # Usando location1 porque location2 não foi definido
    user_id: User.first.id
  },
  event3: {
    title: "samba Maria",
    date: Date.new(2024, 2, 25),
    description: "Desde que lançou o álbum 'Samba Meu', em 2003, Maria Rita transita com imensa desenvoltura no universo do samba e hoje está consolidada como uma das grandes artistas do gênero.",
    location_id: created_locations[:location3].id,  # Usando location1 porque location2 não foi definido
    user_id: User.first.id
  }
}

5.times do ||
  events.each do |key, event_data|
    Event.create!(event_data)
  end
end
