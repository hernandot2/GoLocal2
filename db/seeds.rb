require "open-uri"

# Users

User.destroy_all

users = {
  user1: {
    name: "Usuário simples",
    email: "test@example.com",
    password: "123123",
    admin: false
  },
  user2: {
    name: "Usuário admin",
    email: "admin@example.com",
    password: "123123",
    admin: true
  }
}

users.each do |key, user_data|
  unless User.exists?(email: user_data[:email])
    User.create!(user_data)
  end
end

# Cities
cities = {
  city1: {
    name: "Rio de Janeiro",
    description: "O Rio de Janeiro, famoso como a 'Cidade Maravilhosa', é uma joia costeira que encanta com sua beleza natural deslumbrante e seu estilo de vida descontraído. Com suas icônicas praias, como Copacabana e Ipanema, cercadas por montanhas exuberantes, incluindo o Pão de Açúcar e o Corcovado com a estátua do Cristo Redentor, a cidade oferece um cenário único onde a natureza e a urbanidade se encontram em perfeita harmonia. Além de sua paisagem deslumbrante, o Rio de Janeiro é um caldeirão cultural do Brasil. A cidade abriga uma rica mistura de influências, manifestando-se em sua música animada, como o samba e a bossa nova, bem como em celebrações vibrantes, incluindo o famoso Carnaval. Os bairros históricos, como Santa Teresa, refletem a herança colonial, enquanto a cena contemporânea de arte, moda e gastronomia atesta a vitalidade cultural em constante evolução da cidade. No entanto, o Rio também enfrenta desafios sociais e de segurança, o que cria uma complexidade adicional nesse quadro cativante.",
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960004/city/rio_pg4tde.jpg",
    state: "Rio de Janeiro"
  },
  city2: {
    name: "São Paulo",
    description: "São Paulo, a maior cidade do Brasil e uma das maiores do mundo, é uma metrópole pulsante e diversificada, que representa a rica complexidade da cultura brasileira. Localizada no sudeste do país, é um centro econômico, cultural e político de destaque na América Latina. A cidade é conhecida por sua arquitetura impressionante, abrangendo desde prédios modernos e arranha-céus até bairros históricos que preservam a herança colonial. As avenidas movimentadas, como a Avenida Paulista, são emblemáticas da agitação constante, enquanto os parques, como o Parque Ibirapuera, proporcionam refúgios verdes em meio à urbanidade.",
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960004/city/sp_hysj9j.jpg",
    state: "São Paulo"
  },
  city3: {
    name: "Belo Horizonte",
    description: "Belo Horizonte, a capital do estado de Minas Gerais, é uma cidade que combina charme urbano com um ritmo de vida mais tranquilo. Conhecida por sua arquitetura planejada e ruas amplas, a cidade oferece uma atmosfera acolhedora e descontraída. Rodeada pelas montanhas da Serra do Curral, a paisagem natural emoldura a cidade, proporcionando belas vistas e oportunidades para atividades ao ar livre. A gastronomia é um dos destaques de Belo Horizonte, com a culinária mineira sendo um verdadeiro tesouro. Pratos tradicionais como o feijão tropeiro, o tutu à mineira e o pão de queijo são sabores autênticos da região que podem ser apreciados em mercados, bares e restaurantes locais. Além disso, a cidade possui uma cena cultural crescente, com teatros, museus e festivais que celebram a rica herança cultural do estado.",
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960004/city/bh_uvihbh.jpg",
    state: "Minas Gerais"
  }
}


cities.each do |key, city_data|
  file = URI.open(city_data[:photo_url])

  city = City.create(name: city_data[:name], description: city_data[:description], state: city_data[:state])
  city.photo.attach(io: file, filename: "#{city_data[:name]}.jpg", content_type: "image/jpg")
  city.save!
end

# Neighborhoods
neighborhoods = {
  neighborhood1: {
    name: "Copacabana",
    city_id: City.find(1).id,
    description: "Copacabana é um bairro icônico à beira-mar no Rio de Janeiro. Suas areias douradas, calçadão animado e pores do sol deslumbrantes o tornam um destino favorito tanto para os locais quanto para os turistas."
  },
  neighborhood2: {
    name: "Ipanema",
    city_id: City.find(1).id,
    description: "Ipanema é um bairro sofisticado e elegante conhecido pela atmosfera sofisticada, boutiques de designers e bares modernos. A bela Praia de Ipanema é um centro para banhistas e socialização."
  },
  neighborhood3: {
    name: "Lapa",
    city_id: City.find(1).id,
    description: "Lapa é um bairro histórico no Rio de Janeiro, famoso por sua arquitetura colonial, vida noturna animada e pelos famosos Arcos da Lapa, uma obra-prima arquitetônica."
  },
  neighborhood4: {
    name: "Santa Teresa",
    city_id: City.find(1).id,
    description: "Santa Teresa é um bairro artístico e boêmio, conhecido por suas vielas pitorescas, ateliês de artistas e atmosfera cultural única."
  },
  neighborhood5: {
    name: "Flamengo",
    city_id: City.find(1).id,
    description: "Flamengo é um bairro tranquilo e arborizado, com belos parques à beira-mar e uma atmosfera relaxante, perfeito para passeios e momentos de lazer."
  },
  neighborhood6: {
    name: "Botafogo",
    city_id: City.find(1).id,
    description: "Botafogo é um bairro dinâmico e moderno, conhecido por sua cena gastronômica diversificada, lojas descoladas e vista panorâmica da Enseada de Botafogo."
  },
  neighborhood7: {
    name: "Laranjeiras",
    city_id: City.find(1).id,
    description: "Laranjeiras é um bairro residencial charmoso e tradicional, com ruas arborizadas, casarões antigos e um clima de tranquilidade."
  },
  neighborhood8: {
    name: "Gávea",
    city_id: City.find(1).id,
    description: "Gávea é um bairro elegante, conhecido pela prestigiada Universidade PUC-Rio, pelo Jockey Club Brasileiro e pelo Parque da Cidade, um local de lazer e eventos culturais."
  },
  neighborhood9: {
    name: "Leblon",
    city_id: City.find(1).id,
    description: "Leblon é um bairro exclusivo e sofisticado, com praias deslumbrantes, alta gastronomia e uma atmosfera de luxo discreto."
  },
  neighborhood10: {
    name: "Glória",
    city_id: City.find(1).id,
    description: "Glória é um bairro histórico e central, com fácil acesso ao transporte público, museus importantes e uma vista deslumbrante do Pão de Açúcar."
  },

  # Bairros de São Paulo
  neighborhood11: {
    name: "Vila Madalena",
    city_id: City.find(2).id,
    description: "Vila Madalena é um bairro boêmio em São Paulo, famoso por sua arte de rua vibrante, vida noturna eclética e comunidade artística. Suas ruas charmosas são repletas de cafés, galerias e estúdios.",
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960227/neighborhood/vila-madalena_khtppk.jpg"
  },
  neighborhood12: {
    name: "Jardins",
    city_id: City.find(2).id,
    description: "Jardins é um bairro residencial de luxo conhecido por suas boutiques de alto padrão, restaurantes sofisticados e ruas arborizadas. É um símbolo da riqueza e do estilo cosmopolita de São Paulo.",
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960226/neighborhood/jardins_ucptp1.jpg"
  },
  neighborhood13: {
    name: "Pinheiros",
    city_id: City.find(2).id,
    description: "Pinheiros é um bairro moderno e eclético em São Paulo, famoso por sua cena cultural diversa, espaços de arte e restaurantes contemporâneos.",
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960227/neighborhood/pinheiros_ixwx6m.webp"
  },
  neighborhood14: {
    name: "Bela Vista",
    city_id: City.find(2).id,
    description: "Bela Vista é um bairro histórico e vibrante, conhecido por seu teatro, vida noturna agitada e pela famosa Feira da Liberdade, que celebra a cultura asiática.",
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960225/neighborhood/bela-vista_y6iq2y.jpg"
  },
  neighborhood15: {
    name: "Moema",
    city_id: City.find(2).id,
    description: "Moema é um bairro elegante e residencial, com ruas arborizadas, lojas de grife e uma atmosfera sofisticada. É um destino popular para compras e gastronomia de alta qualidade.",
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960226/neighborhood/moema_cujvhc.jpg"
  },
  neighborhood16: {
    name: "Itaim Bibi",
    city_id: City.find(2).id,
    description: "Itaim Bibi é um bairro moderno e movimentado, conhecido por sua vida noturna agitada, restaurantes descolados e pela presença de empresas e startups."
  },
  neighborhood17: {
    name: "Liberdade",
    city_id: City.find(2).id,
    description: "Liberdade é um bairro culturalmente rico em São Paulo, famoso por sua influência japonesa, lojas de produtos orientais e festivais tradicionais."
  },
  neighborhood18: {
    name: "Santana",
    city_id: City.find(2).id,
    description: "Santana é um bairro tradicional em São Paulo, conhecido por sua atmosfera acolhedora, feiras de rua e pelo Parque da Juventude, um local de lazer e eventos culturais."
  },
  neighborhood19: {
    name: "Vila Olímpia",
    city_id: City.find(2).id,
    description: "Vila Olímpia é um bairro moderno e comercial em São Paulo, famoso por suas opções de entretenimento, centros empresariais e vida noturna animada."
  },
  neighborhood20: {
    name: "Cambuci",
    city_id: City.find(2).id,
    description: "Cambuci é um bairro residencial tranquilo em São Paulo, com ruas arborizadas, praças charmosas e uma sensação de comunidade."
  },

  # Bairros de Belo Horizonte
  neighborhood21: {
    name: "Savassi",
    city_id: City.find(3).id,
    description: "Savassi é um bairro elegante e agitado de Belo Horizonte, conhecido por suas ruas movimentadas, bares charmosos, e a vida noturna vibrante que atrai moradores e visitantes."
  },
  neighborhood22: {
    name: "Funcionários",
    city_id: City.find(3).id,
    description: "Funcionários é um bairro residencial e comercial de Belo Horizonte, com uma mistura de prédios comerciais, lojas locais, e um ambiente acolhedor que reflete o estilo de vida da cidade."
  },
  neighborhood23: {
    name: "Lourdes",
    city_id: City.find(3).id,
    description: "Lourdes é um bairro sofisticado e moderno em Belo Horizonte, conhecido por seus restaurantes gourmet, hotéis luxuosos, e uma atmosfera elegante que atrai a alta sociedade."
  },
  neighborhood24: {
    name: "Santa Tereza",
    city_id: City.find(3).id,
    description: "Santa Tereza é um bairro cultural e histórico de Belo Horizonte, famoso por suas ruas estreitas, casarões antigos, e a atmosfera boêmia que atrai artistas e intelectuais."
  },
  neighborhood25: {
    name: "Pampulha",
    city_id: City.find(3).id,
    description: "Pampulha é um bairro icônico de Belo Horizonte, conhecido por sua lagoa, a arquitetura de Oscar Niemeyer, e os espaços de lazer que atraem famílias e turistas."
  },
  neighborhood26: {
    name: "Barro Preto",
    city_id: City.find(3).id,
    description: "Barro Preto é um bairro comercial e industrial de Belo Horizonte, famoso por suas lojas de roupas, confecções, e pela movimentada Feira Hippie aos domingos."
  },
  neighborhood27: {
    name: "Cidade Jardim",
    city_id: City.find(3).id,
    description: "Cidade Jardim é um bairro residencial arborizado de Belo Horizonte, conhecido por suas casas elegantes, áreas verdes, e pela qualidade de vida que oferece aos moradores."
  },
  neighborhood28: {
    name: "Gutierrez",
    city_id: City.find(3).id,
    description: "Gutierrez é um bairro tradicional e familiar de Belo Horizonte, com uma atmosfera tranquila, escolas renomadas, e uma sensação de comunidade que atrai famílias."
  },
  neighborhood29: {
    name: "Floresta",
    city_id: City.find(3).id,
    description: "Floresta é um bairro histórico de Belo Horizonte, conhecido por suas construções antigas, praças arborizadas, e a preservação do patrimônio cultural da cidade."
  },
  neighborhood30: {
    name: "Buritis",
    city_id: City.find(3).id,
    description: "Buritis é um bairro residencial moderno de Belo Horizonte, famoso por sua infraestrutura completa, áreas de lazer, e por ser uma opção atrativa para moradores de todas as idades."
  }
}

neighborhoods.each do |key, neighborhood_data|
  neighborhood = Neighborhood.create(name: neighborhood_data[:name], city_id: neighborhood_data[:city_id], description: neighborhood_data[:description])
  if neighborhood_data[:photo_url]
    file = URI.open(neighborhood_data[:photo_url])
    neighborhood.photo.attach(io: file, filename: "#{neighborhood_data[:name]}.jpg", content_type: "image/jpg")
  end
  neighborhood.save!
end

# Locations
locations = {
  # rio de janeiro

  # são paulo--------------------------

  locationsp1: {
    name: "3 Corações Vila Madalena",
    address: "Rua Aspicuelta, 249, Vila Madalena, São Paulo, SP",
    description: "Um café tradicional brasileiro com uma variedade de bebidas e comidas.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Café",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/3coracoes-vila-madalena.jpg"
  },
  locationsp2: {
    name: "Bar do Juarez",
    address: "Rua Aspicuelta, 554, Vila Madalena, São Paulo, SP",
    description: "O Bar do Juarez é um estabelecimento icônico e querido localizado na cidade de São Paulo, Brasil.
    Com uma história que remonta a várias décadas, este bar conquistou um lugar especial no coração dos paulistanos e dos visitantes que desejam experimentar a autêntica cultura de boteco brasileira.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Bar",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/bar-do-juarez.jpg"
  },
  locationsp3: {
    name: "Bar Brahma",
    address: "Rua Aspicuelta, 227, Vila Madalena, São Paulo, SP",
    description: "Um dos bares mais famosos de São Paulo, com uma variedade de pratos e bebidas.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Bar",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/bar-brahma.jpg"
  },
  locationsp4: {
    name: "Museu da Casa Brasileira",
    address: "Av. Brigadeiro Faria Lima, 2705, Jardim Paulistano, São Paulo, SP",
    description: "Um museu que abriga uma coleção de casas brasileiras de diferentes períodos.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Museu",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/museu-da-casa-brasileira.jpg"
  },
  locationsp5: {
    name: "Livraria da Vila",
    address: "Rua Fradique Coutinho, 913, Vila Madalena, São Paulo, SP",
    description: "Uma livraria independente com uma seleção de livros novos e usados.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Loja",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/livraria-da-vila-1.jpg"
  },
  locationsp6: {
    name: "Parque da Aclimação",
    address: "Rua Muniz de Sousa, 1.119, Aclimação, São Paulo, SP",
    description: "Um parque público com uma variedade de árvores, flores e animais.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Parque",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/parque-aclimacao.jpg"
  },
  locationsp7: {
    name: "Beco do Batman",
    address: "Rua Medeiros de Albuquerque, 154, Jardim das Bandeiras, São Paulo, SP",
    description: "Um beco colorido com grafites e esculturas.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Parque",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/beco-do-batman.jpg"
  },
  locationsp8: {
    name: "Starbucks Vila Madalena",
    address: "Av. Brigadeiro Faria Lima, 1194, Jardim Paulistano, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de bebidas e comidas.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Café",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/starbucks-vila-madalena.jpg"
  },
  locationsp9: {
    name: "Bar Bossa Lounge",
    address: "Av. Ipiranga, 200, Vila Madalena, São Paulo, SP",
    description: "Um bar tradicional da Vila Madalena com uma atmosfera sofisticada.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Bar",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/bar-da-onca.jpg"
  },
  locationsp10: {
    name: "Jojo Maronez",
    address: "Rua Aspicuelta, 529, São Paulo, SP",
    description: "Um restaurante especializado em comida brasileira com uma atmosfera informal.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Restaurante",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/jojo-maronez.jpg"
  },
  locationsp11: {
    name: "Starbucks Jardins",
    address: "Av. Paulista, 1499, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de bebidas e comidas.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Café",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/starbucks-jardins.jpg"
  },
  locationsp12: {
    name: "Bar do Pirata",
    address: "Av. Paulista, 2899, São Paulo, SP",
    description: "Um bar tradicional da Vila Madalena com uma atmosfera descontraída.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Bar",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/bar-do-pirata.jpg"
  },
  locationsp13: {
    name: "Fasano",
    address: "Av. Paulista, 1357, São Paulo, SP",
    description: "Um dos hotéis mais luxuosos de São Paulo, com uma variedade de restaurantes e bares.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Restaurante",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/hotel-fasano.jpg"
  },
  locationsp14: {
    name: "MASP",
    address: "Av. Paulista, 1578, São Paulo, SP",
    description: "Um museu de arte moderna com uma coleção de obras de arte de todo o mundo.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Museu",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/masp.jpg"
  },
  locationsp15: {
    name: "Shopping Cidade Jardim, São Paulo, SP",
    address: "Av. Magalhães de Castro, 12000",
    description: "Um shopping de luxo com uma variedade de lojas e restaurantes.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Loja",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/shopping-cidade-jardim.jpg"
  },
  locationsp16: {
    name: "Parque Trianon",
    address: "Av. Paulista, 1700, São Paulo, SP",
    description: "Um parque público com uma variedade de árvores, flores e animais.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Parque",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/parque-trianon.jpg"
  },
  locationsp17: {
    name: "Passeio de bicicleta pela Avenida Paulista",
    address: "Av. Paulista, São Paulo, SP",
    description: "Um passeio pela avenida mais famosa de São Paulo, com uma vista de tirar o fôlego.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Parque",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/bike-av-paulista.jpg"
  },
  locationsp18: {
    name: "Le Pain Quotidien Jardins",
    address: "Rua Haddock Lobo, 1382, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de pães, bolos e refeições.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Café",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/le-pain-jardins.jpg"
  },
  locationsp19: {
    name: "Bar Brahma Jardins",
    address: "Av. Paulista, 227, São Paulo, SP",
    description: "Um dos bares mais famosos de São Paulo, com uma variedade de pratos e bebidas.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Bar",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/bar-brahma.jpg"
  },
  locationsp20: {
    name: "Paris 6 Jardins",
    address: "Rua Augusta, 1502, São Paulo, SP",
    description: "Um restaurante francês com um ambiente elegante e sofisticado.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Restaurante",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/paris6-jardins.jpg"
  },
  locationsp21: {
    name: "Starbucks Moema",
    address: "Av. Ibirapuera, 2927, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de bebidas e comidas.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Café",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/starbucks-moema.jpg"
  },
  locationsp22: {
    name: "Bar do Juarez Moema",
    address: "Av. Ibirapuera, 2181, São Paulo, SP",
    description: "Um bar tradicional da Vila Madalena com uma atmosfera descontraída.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Bar",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/bar-do-juarez.jpg"
  },
  locationsp23: {
    name: "Coco Bambu",
    address: "Av. Ibirapuera, 3727, São Paulo, SP",
    description: "Um restaurante especializado em frutos do mar com um ambiente elegante.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Restaurante",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/coco-bambu.jpg"
  },
  locationsp24: {
    name: "Museu de Arte Contemporânea de São Paulo",
    address: "Av. Pedro Álvares Cabral, 1301, São Paulo, SP",
    description: "Um museu de arte contemporânea com uma coleção de obras de arte de todo o mundo.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Museu",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/mac-sp.jpg"
  },
  locationsp25: {
    name: "Shopping Ibirapuera",
    address: "Av. Ibirapuera, 3900, São Paulo, SP",
    description: "Um shopping center com uma variedade de lojas e restaurantes.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Loja",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/shopping-ibirapuera.jpg"
  },
  locationsp26: {
    name: "Parque Ibirapuera",
    address: "Av. Pedro Álvares Cabral, São Paulo, SP",
    description: "Um parque público com uma variedade de atrações, incluindo o Museu de Arte Contemporânea de São Paulo, o Pavilhão Japonês e o Obelisco.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Parque",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/parque-ibirapuera.jpg"
  },
  locationsp27: {
    name: "Stand up paddle no Lago do Parque Ibirapuera",
    address: "Av. Pedro Álvares Cabral, São Paulo, SP",
    description: "Uma atividade ao ar livre para se divertir e praticar exercícios no lago do Parque Ibirapuera.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Parque",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/standup-ibirapuera.jpg"
  },
  locationsp28: {
    name: "Le Pain Quotidien Moema",
    address: "Av. Ibirapuera, 2, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de pães, bolos e refeições.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Café",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/le-pain-moema.jpg"
  },
  locationsp29: {
    name: "Starbucks Pinheiros",
    address: "Rua dos Pinheiros, 248, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de bebidas e comidas.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Café",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/starbucks-vila-madalena.jpg"
  },
  locationsp30: {
    name: "Bar Brahma Pinheiros",
    address: "Rua dos Pinheiros, 145, São Paulo, SP",
    description: "Um dos bares mais famosos de São Paulo, com uma variedade de pratos e bebidas.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Bar",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/bar-brahma.jpg"
  },
  locationsp31: {
    name: "Mocotó",
    address: "Rua Aspicuelta, 542, São Paulo, SP",
    description: "Um restaurante especializado em comida brasileira com um ambiente informal.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Restaurante",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/mocoto.jpg"
  },
  locationsp32: {
    name: "Pinacoteca do Estado de São Paulo",
    address: "Av. Tiradentes, 615, São Paulo, SP",
    description: "Um museu de arte com uma coleção de obras de arte de todo o mundo.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Museu",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/pinacoteca.jpg"
  },
  locationsp33: {
    name: "Shopping Villa Lobos",
    address: "Av. das Nações Unidas, 4777, São Paulo, SP",
    description: "Um shopping center com uma variedade de lojas e restaurantes.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Loja",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/shopping-villa-lobos.jpg"
  },
  locationsp34: {
    name: "Parque Villa Lobos",
    address: "Av. das Nações Unidas, 7161, São Paulo, SP",
    description: "Um parque público com uma variedade de atrações, incluindo o Auditório Ibirapuera, o Museu de Arte Moderna e o Museu de Arte Contemporânea de São Paulo.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Parque",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/parque-villa-lobos.jpg"
  },
  locationsp35: {
    name: "Stand up paddle no Lago do Parque Villa Lobos",
    address: "Av. das Nações Unidas, 716, São Paulo, SP",
    description: "Uma atividade ao ar livre para se divertir e praticar exercícios no lago do Parque Villa Lobos.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Parque",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/standup-ibirapuera.jpg"
  },
  locationsp36: {
    name: "Le Pain Quotidien Pinheiros",
    address: "Rua dos Pinheiros, 326, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de pães, bolos e refeições.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Café",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/le-pain-pinheiros.jpg"
  },
  locationsp37: {
    name: "Bar da Esquina",
    address: "Rua dos Pinheiros, 340, São Paulo, SP",
    description: "Um bar tradicional da Vila Madalena com uma atmosfera descontraída.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Bar",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/bar-da-esquina.jpg"
  },
  locationsp38: {
    name: "Jiquitaia",
    address: "Rua dos Pinheiros, 274, São Paulo, SP",
    description: "Um restaurante especializado em comida brasileira com um ambiente sofisticado.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Restaurante",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/jiquitaia.jpg"
  },
  locationsp39: {
    name: "Starbucks Bela Vista",
    address: "Rua Augusta, 1059, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de bebidas e comidas.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Café",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/starbucks-bela-vista.jpg"
  },
  locationsp40: {
    name: "Bar do Luiz",
    address: "Rua Augusta, 1246, São Paulo, SP",
    description: "Um bar tradicional da Bela Vista com uma atmosfera descontraída.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Bar",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/bar-do-luiz.jpg"
  },
  locationsp41: {
    name: "San Gennaro",
    address: "Rua Treze de Maio, 171, São Paulo, SP",
    description: "Um restaurante italiano com um ambiente familiar.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Restaurante",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/san-gennaro.jpg"
  },
  locationsp42: {
    name: "Edifício Itália",
    address: "Av. Ipiranga, 344, São Paulo, SP",
    description: "Um edifício de 36 andares com uma vista panorâmica da cidade.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Museu",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/edificio-italia.jpg"
  },
  locationsp43: {
    name: "Shopping Pátio Paulista",
    address: "Rua Augusta, 1261, São Paulo, SP",
    description: "Um shopping center com uma variedade de lojas e restaurantes.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Loja",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/shopping-patio-paulista.jpg"
  },
#  locationsp44: {
#  #  name: "Parque Augusta",
#  #  address: "Rua Augusta, 1500, São Paulo, SP",
#  #  description: "Um parque público com uma variedade de árvores, flores e animais.",
#  #  neighborhood_id: Neighborhood.find(15).id,
#  #  category: "Parque",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/parque-augusta.jpg"
#  },
#  locationsp45: {
#  #  name: "Corrida no Parque Augusta",
#  #  address: "Rua Augusta, 1500, São Paulo, SP",
#  #  description: "Uma atividade ao ar livre para se exercitar e aproveitar a natureza no Parque Augusta.",
#  #  neighborhood_id: Neighborhood.find(15).id,
#  #  category: "Parque",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/corrida-parque-augusta.jpg"
#  },
  locationsp46: {
    name: "Le Pain Quotidien Bela Vista",
    address: "Rua Augusta, 1875, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de pães, bolos e refeições.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Café",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/le-pain-bela-vista.jpg"
  },
  locationsp47: {
    name: "Bar Brahma Bela Vista",
    address: "Av. Ipiranga, 344, São Paulo, SP",
    description: "Um dos bares mais famosos de São Paulo, com uma variedade de pratos e bebidas.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Bar",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/bar-brahma.jpg"
  },
  locationsp48: {
    name: "Bráz Trattoria",
    address: "Rua Treze de Maio, 112, São Paulo, SP",
    description: "Uma trattoria italiana com um ambiente elegante.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Restaurante",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/braz-trattoria.jpg"
  },
  locationsp49: {
    name: "Le Pain Quotidien",
    address: "Rua Jerônimo da Veiga, 149, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de pães, bolos e refeições.",
    neighborhood_id: Neighborhood.find(16).id,
    category: "Café",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/le-pain-quotidien-2.jpg"
  },
  locationsp50: {
    name: "SubAstor",
    address: "Rua Oscar Freire, 414, São Paulo, SP",
    description: "Um bar e restaurante com uma variedade de pratos e bebidas.",
    neighborhood_id: Neighborhood.find(16).id,
    category: "Bar",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/subastor.jpg"
  },
  locationsp51: {
    name: "D.O.M.",
    address: "Rua Barão de Capanema, 549, São Paulo, SP",
    description: "Um restaurante especializado em comida brasileira com um ambiente sofisticado.",
    neighborhood_id: Neighborhood.find(16).id,
    category: "Restaurante",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/dom.jpg"
  },
  locationsp52: {
    name: "Museu de Arte de São Paulo (MASP)",
    address: "Avenida Paulista, 1578, São Paulo, SP",
    description: "Um museu de arte com uma coleção de obras de arte de todo o mundo.",
    neighborhood_id: Neighborhood.find(16).id,
    category: "Museu",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/masp1.jpg"
  },
  locationsp53: {
    name: "Daslu",
    address: "Rua Oscar Freire, 855, São Paulo, SP",
    description: "Um shopping center de luxo com uma variedade de lojas e restaurantes.",
    neighborhood_id: Neighborhood.find(16).id,
    category: "Loja",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/daslu.jpg"
  },
  locationsp54: {
    name: "Parque do Ibirapuera",
    address: "Avenida Pedro Álvares Cabral, São Paulo, SP",
    description: "Um parque público com uma variedade de atrações, incluindo o Museu de Arte Contemporânea de São Paulo, o Pavilhão Japonês e o Obelisco.",
    neighborhood_id: Neighborhood.find(16).id,
    category: "Parque",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/parque-ibirapuera.jpg"
  },
  locationsp55: {
    name: "Parque Burle Marx",
    address: "Rua Medeiros de Albuquerque, 450, São Paulo, SP",
    description: "Um parque público com uma variedade de jardins e esculturas.",
    neighborhood_id: Neighborhood.find(16).id,
    category: "Parque",
    user_id: User.first.id,
    photo_url: "app/assets/images/locations/parque-burle-marx.jpg"
  },
#  locationsp56: {
#  #  name: "Café Floresta",
#  #  address: "Rua Galvão Bueno, 848, São Paulo, SP",
#  #  description: "Um café tradicional com uma variedade de bebidas e comidas.",
#  #  neighborhood_id: Neighborhood.find(17).id,
#  #  category: "Café",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/cefe-floresta.jpg"
#  },
#  locationsp57: {
#  #  name: "Bar do Tatu",
#  #  address: "Rua Galvão Bueno, 786, São Paulo, SP",
#  #  description: "Um bar tradicional com uma variedade de pratos e bebidas.",
#  #  neighborhood_id: Neighborhood.find(17).id,
#  #  category: "Bar",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/bar-tatu.jpg"
#  },
#  locationsp58: {
#  #  name: "Liberdade 99",
#  #  address: "Rua Liberdade, 99, São Paulo, SP",
#  #  description: "Um restaurante especializado em comida japonesa.",
#  #  neighborhood_id: Neighborhood.find(17).id,
#  #  category: "Restaurante",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/liberdade-99.jpg"
#  },
#  locationsp59: {
#  #  name: "Museu da Imigração Japonesa do Brasil",
#  #  address: "Rua Galvão Bueno, 522, São Paulo, SP ",
#  #  description: "Um museu dedicado à história da imigração japonesa no Brasil.",
#  #  neighborhood_id: Neighborhood.find(17).id,
#  #  category: "Museu",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/museu-da-imigracao.jpg"
#  },
#  locationsp60: {
#  #  name: "Loja Daiso",
#  #  address: "Rua Galvão Bueno, 1068, São Paulo, SP",
#  #  description: "Uma loja de departamento com uma variedade de produtos japoneses.",
#  #  neighborhood_id: Neighborhood.find(17).id,
#  #  category: "Loja",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/loja-daiso.jpg"
#  },
#  locationsp61: {
#  #  name: "Praça da Liberdade",
#  #  address: "Rua Liberdade, 120, São Paulo, SP",
#  #  description: "Uma praça pública com uma variedade de lojas e restaurantes.",
#  #  neighborhood_id: Neighborhood.find(17).id,
#  #  category: "Parque",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/praca-da-liberdade.jpg"
#  },
#  locationsp68: {
#  #  name: "Starbucks",
#  #  address: "Rua Oscar Freire, 1479, São Paulo, SP",
#  #  description: "Uma cafeteria internacional com uma variedade de bebidas e comidas.",
#  #  neighborhood_id: Neighborhood.find(19).id,
#  #  category: "Café",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/starbucks-oscar-freire.jpg"
#  },
#  locationsp69: {
#  #  name: "Bar Brahma",
#  #  address: "Rua São Luís, 183, São Paulo, SP",
#  #  description: "Um dos bares mais famosos de São Paulo, com uma variedade de pratos e bebidas.",
#  #  neighborhood_id: Neighborhood.find(19).id,
#  #  category: "Bar",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/bar-brahma.jpg"
#  },
#  locationsp70: {
#  #  name: "Aprazível",
#  #  address: "Rua Horácio Lafer, 129, São Paulo, SP",
#  #  description: "Um restaurante com uma vista panorâmica da cidade.",
#  #  neighborhood_id: Neighborhood.find(19).id,
#  #  category: "Restaurante",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/aprazivel.jpg"
#  },
#  locationsp71: {
#  #  name: "Museu de Arte Contemporânea de São Paulo (MAC)",
#  #  address: "Avenida Paulista, 1500, São Paulo, SP",
#  #  description: "Um museu de arte contemporânea com uma coleção de obras de todo o mundo.",
#  #  neighborhood_id: Neighborhood.find(19).id,
#  #  category: "Museu",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/mac-usp.jpg"
#  },
#  locationsp72: {
#  #  name: "Shopping JK Iguatemi",
#  #  address: "Avenida Juscelino Kubitschek, 2041, São Paulo, SP",
#  #  description: "Um shopping center de luxo com uma variedade de lojas e restaurantes.",
#  #  neighborhood_id: Neighborhood.find(19).id,
#  #  category: "Loja",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/shopping-jk.jpg"
#  },
#  locationsp73: {
#  #  name: "Parque Ibirapuera",
#  #  address: "Avenida Pedro Álvares Cabral, São Paulo, SP",
#  #  description: "Um parque público com uma variedade de atrações, incluindo o Museu de Arte Contemporânea de São Paulo, o Pavilhão Japonês e o Obelisco.",
#  #  neighborhood_id: Neighborhood.find(19).id,
#  #  category: "Parque",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/parque-ibirapuera-2"
#  },
#  locationsp74: {
#  #  name: "Ioga no Parque Ibirapuera",
#  #  address: "Avenida Pedro Álvares Cabral, São Paulo, SP",
#  #  description: "Uma atividade ao ar livre para relaxar e se exercitar no Parque Ibirapuera.",
#  #  neighborhood_id: Neighborhood.find(19).id,
#  #  category: "Parque",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/ioga-parque.jpg"
#  },
#  locationsp82: {
#  #  name: "Café Santa Clara",
#  #  address: "Rua Conselheiro Moreira de Barros, 1823, São Paulo, SP",
#  #  description: "Um café tradicional com uma variedade de bebidas e comidas.",
#  #  neighborhood_id: Neighborhood.find(18).id,
#  #  category: "Café",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/cafe-santa-clara.jpg"
#  },
#  locationsp83: {
#  #  name: "Bar São Bento",
#  #  address: "Rua São Bento, 416, São Paulo, SP",
#  #  description: "Um bar tradicional com uma variedade de pratos e bebidas.",
#  #  neighborhood_id: Neighborhood.find(18).id,
#  #  category: "Bar",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/bar-sao-bento.jpg"
#  },
#  locationsp84: {
#  #  name: "Empório Santa Maria",
#  #  address: "Rua Conselheiro Moreira de Barros, 2424, São Paulo, SP",
#  #  description: "Um restaurante especializado em comida brasileira.",
#  #  neighborhood_id: Neighborhood.find(18).id,
#  #  category: "Restaurante",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/emporio-santa-maria.jpg"
#  },
#  locationsp85: {
#  #  name: "Pinacoteca de São Paulo",
#  #  address: "Praça da Luz, 2, São Paulo, SP",
#  #  description: "Um museu de arte com uma coleção de obras de arte brasileiras.",
#  #  neighborhood_id: Neighborhood.find(18).id,
#  #  category: "Museu",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/pinacoteca1.jpg"
#  },
#  locationsp86: {
#  #  name: "Rua 25 de Março",
#  #  address: "Rua 25 de Março, São Paulo, SP",
#  #  description: "Uma rua comercial com uma variedade de lojas e vendedores ambulantes.",
#  #  neighborhood_id: Neighborhood.find(18).id,
#  #  category: "Loja",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/rua-25-de-marco.jpg"
#  },
#  locationsp87: {
#  #  name: "Parque da Luz",
#  #  address: "Praça da Luz, São Paulo, SP",
#  #  description: "Um parque público com uma variedade de atrações, incluindo a Pinacoteca de São Paulo e o Museu da Língua Portuguesa.",
#  #  neighborhood_id: Neighborhood.find(18).id,
#  #  category: "Parque",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/parque-da-luz"
#  },
#  locationsp88: {
#  #  name: "Passeio de bicicleta pelo Parque da Luz",
#  #  address: "Praça da Luz, São Paulo, SP",
#  #  description: "Uma atividade ao ar livre para explorar o Parque da Luz.",
#  #  neighborhood_id: Neighborhood.find(18).id,
#  #  category: "Parque",
#  #  user_id: User.first.id,
#  #  photo_url: "app/assets/images/locations/passeio-bike-parque-da-luz.jpg"
#  }
}

locations.each do |key, location_data|

  location = Location.create(
    name: location_data[:name],
    description: location_data[:description],
    address: location_data[:address],
    category: location_data[:category],
    neighborhood_id: location_data[:neighborhood_id],
    user_id: location_data[:user_id]
  )
  if location_data[:photo_url]
    file = URI.open(location_data[:photo_url])
    location.photo.attach(io: file, filename: "#{location_data[:name]}.jpg", content_type: "image/jpg")
  end

  location.save!
end

# Events
events = {
  event1: {
    title: "Festival de Arte Urbana Vila Colorida",
    date: Date.new(2023, 9, 9),
    description: "Um festival de arte urbana que transformará as ruas da Vila Madalena em uma galeria a céu aberto. Artistas locais e internacionais criarão murais incríveis.",
    location_id: Location.find(7).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/festival-arte-urbana.jpg"
  },
  event2: {
    title: "Concerto ao Pôr do Sol no Parque da Aclimação",
    date: Date.new(2023, 9, 9),
    description: "Uma noite mágica de música clássica no belo Parque das Artes. Traga seu piquenique e desfrute de um concerto inesquecível.",
    location_id: Location.find(6).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/concerto-por-do-sol.jpg"
  },
  event3: {
    title: "Feira de Artesanato da Vila",
    date: Date.new(2023, 9, 9),
    description: "Descubra o talento artesanal local nesta feira, onde você encontrará joias, roupas e objetos de decoração únicos.",
    location_id: Location.find(7).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/feira-artesanato.jpg"
  },
  event4: {
    title: "Exposição de Fotografia Cenas Urbanas",
    date: Date.new(2023, 9, 9),
    description: "Uma exposição cativante de fotografias que capturam a essência da vida urbana em São Paulo.",
    location_id: Location.find(14).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/exposicao-fotografica.jpg"
  },
  event5: {
    title: "Noite de Comédia Stand-up no Bar do Juarez",
    date: Date.new(2023, 9, 9),
    description: "Risos garantidos com os comediantes mais engraçados da cidade. Uma noite repleta de humor.",
    location_id: Location.find(2).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/standup-comedy.jpg"
  },
  event6: {
    title: "Workshop de Yoga ao Ar Livre",
    date: Date.new(2023, 9, 9),
    description: "Sinta a paz e a harmonia enquanto pratica yoga em meio à natureza no Parque da Vila.",
    location_id: Location.find(6).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/yoga-ar-livre.jpg"
  },
  event7: {
    title: "Exposição de Arte Contemporânea Visões Abstratas",
    date: Date.new(2023, 9, 9),
    description: "Explore as mentes criativas dos artistas contemporâneos em uma exposição que desafia a forma e a cor.",
    location_id: Location.find(14).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/arte-contemporanea.jpg"
  },
  event8: {
    title: "Festa da Cultura Brasileira",
    date: Date.new(2023, 9, 9),
    description: "Celebre a riqueza da cultura brasileira com música ao vivo, dança e pratos típicos.",
    location_id: Location.find(12).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/festa-cultura-brasileira.jpg"
  },
  event9: {
    title: "Passeio de Bicicleta pela Vila Madalena",
    date: Date.new(2023, 9, 9),
    description: "Explore os encantos da Vila de bicicleta com um passeio guiado pelas ruas pitorescas.",
    location_id: Location.find(7).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/passeio-bike.jpg"
  },
  event10: {
    title: "Noite de Jazz no Café Harmonia",
    date: Date.new(2023, 9, 9),
    description: "Relaxe ao som suave do jazz em um dos cafés mais aconchegantes da Vila.",
    location_id: Location.find(9).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/noite-jazz.jpg"
  },
  event11: {
    title: "Noite de Karaokê no Bar do Juarez",
    date: Date.new(2023, 9, 10),
    description: "Solte sua voz e divirta-se cantando seus hits favoritos com amigos.",
    location_id: Location.find(2).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/noite-karaoke.jpg"
  },
  event12: {
    title: "Exposição de Esculturas no Espaço Criativo",
    date: Date.new(2023, 9, 9),
    description: "Admire esculturas impressionantes criadas por artistas locais.",
    location_id: Location.find(14).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/exposicao-esculturas.jpg"
  },
  event13: {
    title: "Festival de Food Trucks na Rua Medeiros",
    date: Date.new(2023, 9, 9),
    description: "Experimente uma variedade de pratos de food trucks com música ao vivo.",
    location_id: Location.find(7).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/festival-foodtruck.jpg"
  },
  event14: {
    title: "Festival de Jazz no Parque Trianon",
    date: Date.new(2023, 9, 9),
    description: "Desfrute de uma noite mágica de jazz ao ar livre, com músicos talentosos e comida de rua deliciosa.",
    location_id: Location.find(16).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/festival-jazz.jpg"
  },
  event15: {
    title: "Noite de MPB no Bar do Pirata",
    date: Date.new(2023, 9, 9),
    description: "Uma noite de música popular brasileira ao vivo com drinks especiais e petiscos.",
    location_id: Location.find(12).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/noite-mpb1.jpg"
  },
  event16: {
    title: "Sessão de Cinema ao Ar Livre no Ibirapuera",
    date: Date.new(2023, 9, 9),
    description: "Traga sua cadeira de praia e aproveite um filme sob as estrelas.",
    location_id: Location.find(26).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/cinema-arlivre.jpg"
  },
  event17: {
    title: "Feira Gastronômica na Praça da Vila Madalena",
    date: Date.new(2023, 9, 9),
    description: "Saboreie pratos deliciosos de diferentes culturas em um evento gastronômico diversificado.",
    location_id: Location.find(7).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/feira-gastronomica.jpg"
  },
  event18: {
    title: "Degustação de Cerveja Artesanal no Bar Bossa Lounge",
    date: Date.new(2023, 9, 9),
    description: "Experimente cervejas artesanais locais com especialistas em cerveja.",
    location_id: Location.find(9).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/cerveja-artesanal.jpg"
  },
  event19: {
    title: "Noite de Bossa Nova no Bossa Lounge",
    date: Date.new(2023, 9, 10),
    description: "Desfrute de uma atmosfera sofisticada com músicas de bossa nova e coquetéis exclusivos.",
    location_id: Location.find(9).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/noite-bossa-nova.jpg"
  },
  event20: {
    title: "Noite de Samba no Bar Brahma",
    date: Date.new(2023, 9, 9),
    description: "O melhor do samba ao vivo com deliciosos petiscos brasileiros e caipirinhas especiais.",
    location_id: Location.find(3).id,
    user_id: User.first.id,
    photo_url: "app/assets/images/events/noite-samba.jpg"
  }
}

events.each do |key, event_data|

  event = Event.create(
    title: event_data[:title],
    description: event_data[:description],
    date: event_data[:date],
    location_id: event_data[:location_id],
    neighborhood_id: event_data[:neighborhood_id],
    user_id: event_data[:user_id]
  )
  if event_data[:photo_url]
    file = URI.open(event_data[:photo_url])
    event.photo.attach(io: file, filename: "#{event_data[:title]}.jpg", content_type: "image/jpg")
  end

  event.save!
end
