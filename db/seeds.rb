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
    name: "Admin",
    email: "admin@gmail.com",
    password: "123123",
    admin: true
  },
  user3: {
    name: "Lisa Mansilha",
    email: "lisa@gmail.com",
    password: "123123",
    admin: false
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
  neighborhood11: {
    name: "Urca",
    city_id: City.find(1).id,
    description: "A Urca é um charmoso bairro localizado na cidade do Rio de Janeiro, Brasil. Situada na zona sul da cidade, a Urca é conhecida por sua beleza natural, tranquilidade e história rica."
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
    name: "Coffee Lab",
    address: "Rua Fradique Coutinho, 1340, Vila Madalena, São Paulo, SP",
    description: "O Coffee Lab, localizado na Rua Fradique Coutinho, em São Paulo, é reconhecido como o melhor lugar para apreciar café na cidade. Sob a orientação de Isabella Raposeiras e sua equipe especializada em barismo,
    você terá a oportunidade de aprofundar seu conhecimento sobre café, independentemente de preferir com ou sem açúcar.
    Eles pacientemente ensinam sobre métodos de preparo, moagem e torrefação dos grãos. Além disso, oferecem deliciosos quitutes, como queijo quente e bolos caseiros.
    Embora seja um pouco mais caro do que outros lugares, a atenção aos detalhes justifica o preço.
    A única ressalva são os horários de pico durante o almoço e nos fins de semana.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Café",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694007300/locations/coffee-lab_wqbwqe.jpg"
  },
  locationsp2: {
    name: "Bar do Beco",
    address: "Rua Aspicuelta, 17, Vila Madalena, São Paulo, SP",
    description: "O Bar do Beco é um lugar único situado na icônica viela do Beco do Batman, na Vila Madalena. Com suas mesas ao ar livre, um amplo quintal cercado por árvores frutíferas e paredes grafitadas,
    este bar oferece um descontraído happy hour, com uma variedade de sanduíches no cardápio, cervejas especiais e coquetéis. Além disso, o Bar do Beco se destaca como um centro cultural no bairro, com diversas exposições e projeções.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694029637/locations/bar9_sudbmb.jpg"
  },
  locationsp3: {
    name: "Pracinha do Seu Justino",
    address: "Rua Harmonia, 117, Vila Madalena, São Paulo, SP",
    description: "A Pracinha do Seu Justino é o mais recente espaço gastronômico da Vila Madalena, pertencente aos mesmos proprietários do Bar Vila Seu Justino. Este ambiente ao ar livre oferece um ambiente descontraído, com mesas de boteco,
    jardins verticais, uma fonte de desejos e uma barraca com opções de petiscos e bebidas. O local abre para o happy hour de terça a sexta-feira e a partir do meio-dia nos fins de semana, com entrada gratuita.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694029649/locations/bar_rqdldb.jpg"
  },
  locationsp4: {
    name: "Museu da Casa Brasileira",
    address: "Av. Brigadeiro Faria Lima, 2705, Jardim Paulistano, São Paulo, SP",
    description: "Um museu que abriga uma coleção de casas brasileiras de diferentes períodos.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Museu",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960171/locations/museu-da-casa-brasileira_kvm54v.jpg"
  },
  locationsp5: {
    name: "Livraria da Vila",
    address: "Rua Fradique Coutinho, 913, Vila Madalena, São Paulo, SP",
    description: "Uma livraria independente com uma seleção de livros novos e usados.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Loja",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960160/locations/livraria-da-vila-1_zdndh1.jpg"
  },
  locationsp6: {
    name: "Parque da Aclimação",
    address: "Rua Muniz de Sousa, 1.119, Aclimação, São Paulo, SP",
    description: "Um parque público com uma variedade de árvores, flores e animais.",
    neighborhood_id: Neighborhood.find(16).id,
    category: "Parque",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960173/locations/parque-aclimacao_k0psll.jpg"
  },
  locationsp7: {
    name: "Beco do Batman",
    address: "Rua Medeiros de Albuquerque, 154, Jardim das Bandeiras, São Paulo, SP",
    description: "Um beco colorido com grafites e esculturas.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Parque",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960133/locations/beco-do-batman_x7elez.jpg"
  },
  locationsp8: {
    name: "Olívio Bar",
    address: "Rua Delfina, 196, Vila Madalena, São Paulo, SP",
    description: "O Olívio Bar, recentemente inaugurado na Rua Delfina, apresenta uma proposta única com ênfase em drinks exclusivos. Um destaque é o 22,
    uma bebida que combina rum, licor de pêssego, licor de laranja, rum de coco, limonada, espuma de limão siciliano, lima da Pérsia e leite de coco, servida em uma banheira de plástico com dois patinhos de borracha.
    O salão possui teto retrátil para os dias mais quentes, bancos confortáveis e uma varanda cercada por um belo jardim.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694029659/locations/bar2_ofhypp.jpg"
  },
  locationsp9: {
    name: "Boteco São Conrado",
    address: "Rua Aspicuelta, 51, Vila Madalena, São Paulo, SP",
    description: "O Boteco São Conrado, localizado na animada Rua Aspicuelta, traz o clima descontraído da zona sul carioca para o bairro boêmio de São Paulo.
    O bar possui um amplo e arejado salão, com toldos retráteis e um piso de ladrilho hidráulico que proporciona uma atmosfera de boteco autêntico.
    A grande atração do cardápio é o chope, com uma chopeira de seis bicos oferecendo variedades como Brahma, Stella Artois, Brahma Black e Colorado. Nas quartas-feiras, o bar oferece chopp liberado!",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694029646/locations/bar4_aawwzh.jpg"
  },
  locationsp10: {
    name: "Ícone",
    address: "Rua Fidalga, 79, Vila Madalena, São Paulo, SP",
    description: "Em um ambiente descontraído e acolhedor no coração da Vila Madalena, o restaurante Ícone Asiático é a combinação perfeita entre o respeito às tradições e a atenção às tendências da gastronomia asiática.
    Sob o comando dos chefs Alexandre Ortigoso e Roberto Satoru, a casa oferece o melhor da culinária asiática autoral, com um toque de influência das técnicas francesas.
    De maneira inovadora, todos os pratos são preparados diante dos olhos dos clientes, atrás de um balcão, proporcionando uma experiência única para saborear a refeição e conversar com os chefs.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Restaurante",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694031952/locations/restaurante-icone_rj7pnr.jpg"
  },
  locationsp11: {
    name: "Santo Grão",
    address: "Rua Fradique Coutinho, 915, Vila Madalena, São Paulo, SP",
    description: "Santo Grão é muito mais do que apenas um lugar para tomar café; é uma experiência culinária e sensorial completa que combina o charme de uma cafeteria,
    a excelência de um restaurante e a descontração de um lounge, criando um ambiente verdadeiramente acolhedor e convidativo para todos os tipos de visitantes.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Café",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694031238/locations/cafe_odusl5.jpg"
  },
  locationsp12: {
    name: "Pátio SP",
    address: "Rua Mourato Coelho, 1.272, Vila Madalena, São Paulo, SP",
    description: "O Pátio SP abriu suas portas na Vila Madalena em março de 2017 e rapidamente se tornou um ponto badalado para o happy hour na região.
    A casa possui uma fachada aberta e bem iluminada, com decoração sustentável que inclui mesas e cadeiras feitas de pallets, garrafas reutilizadas como luminárias e um jardim vertical.
    O cardápio oferece petiscos, coquetéis, cervejas artesanais e chopp Brahma e Colorado.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694029651/locations/bar3_wpvgv6.jpg"
  },
  locationsp13: {
    name: "Buco",
    address: "Rua Delfina, 38, Vila Madalena, São Paulo, SP",
    description: "O Buco, um pizza-bar comandado por Rafael Silva, oferece uma opção descolada e saborosa no bairro. Entre os sabores de destaque, estão a Cacio e Pepe,
    a de Abobrinha com molho cacio e pepe e raspas de limão siciliano, e a de Figo com queijo tipo taleggio, presunto de Parma e rúcula, entre outras opções.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Restaurante",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694031954/locations/pizza-bar_pslpkw.jpg"
  },
  locationsp14: {
    name: "Quintal do Espeto",
    address: "Rua Mourato Coelho, 1022, Vila Madalena, São Paulo, SP",
    description: "O Quintal do Espeto possui várias unidades em São Paulo e, para a alegria dos amantes da boemia, também está presente na Vila Madalena.
    Este bar oferece um ambiente agradável ao ar livre, programação de música ao vivo e um cardápio com mais de 50 tipos de espetinhos, acompanhados de cervejas de garrafa. É a escolha perfeita para um encontro descontraído com os amigos.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694029653/locations/bar8_iouwsu.jpg"
  },
  locationsp15: {
    name: "Chez Mom",
    address: "Rua Wisard, 586, Vila Madalena, São Paulo, SP",
    description: "Se você é fã de um docinho para acompanhar o seu café, não pode deixar de visitar a Chez Mom. Este encantador estabelecimento combina uma confeitaria excepcional com uma cafeteria de primeira.
    Eles oferecem um menu repleto de receitas autorais que harmonizam perfeitamente sabores. Aberto de segunda a domingo, das 8h às 16h.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Café",
    user_id: User.last.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694031239/locations/cafe2_q2qpqm.jpg"
  },
  locationsp16: {
    name: "Pé de Manga",
    address: "Rua Arapiraca, 152, Vila Madalena, São Paulo, SP",
    description: "O bar e restaurante Pé de Manga é conhecido por seu ambiente ao ar livre e cercado por vegetação.
    O espaço acomoda 90 pessoas sentadas e inclui um lago artificial com queda d'água e três mangueiras centenárias. Durante a noite, o local é iluminado para que os clientes possam desfrutar dos pratos deliciosos criados pelo chef João Silva. Há também uma área interna dividida em dois pisos, ideal para comemorações mais intimistas.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Restaurante",
    user_id: User.last.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694031955/locations/restaurante-pe-de-manga_skyn3h.jpg"
  },
  locationsp17: {
    name: "Vila 567",
    address: "Rua Aspicuelta, 567, Vila Madalena, São Paulo, SP",
    description: "O Vila 567 é o lugar perfeito para quem busca um happy hour animado. Este espaço sertanejo combina as características de um bar e uma balada, com shows ao vivo de quinta a domingo.
    Uma de suas características únicas é a infraestrutura inovadora, incluindo um rooftop e um teto retrátil que oferecem uma vista privilegiada do bairro boêmio de São Paulo.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694029642/locations/bar5_mhu0wf.jpg"
  },
  locationsp18: {
    name: "Cupping Café",
    address: "Rua Wisard, 171, Vila Madalena, São Paulo, SP",
    description: "O Cupping Café é um destino ideal para os amantes de café, oferecendo um cardápio diversificado com diversas opções de preparo,
    uma ampla seleção de grãos, bebidas quentes e geladas, opções veganas, chocolates bean-to-bar e deliciosos pães de queijo.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Café",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694031241/locations/cafe1_co15vz.jpg"
  },
  locationsp19: {
    name: "High Line Bar",
    address: "Rua Girassol, 144, Vila Madalena, São Paulo, SP",
    description: "Inspirado no famoso parque suspenso de Nova York, o High Line Bar oferece uma gastronomia sofisticada em um ambiente que recria o estilo nova-iorquino.
    O complexo combina arte, música, gastronomia e coquetelaria, com um cardápio que inclui pratos quentes e tradicionais petiscos de bar.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Restaurante",
    user_id: User.last.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694030654/locations/bar10_fqdqo0.jpg"
  },
  locationsp20: {
    name: "Alto da Harmonia",
    address: "Rua Harmonia, 271, Vila Madalena, São Paulo, SP",
    description: "O Alto da Harmonia, localizado na Rua Harmonia, é uma mistura de ambiente boêmio com restaurante sofisticado,
    distribuído em três andares. O bar oferece um terraço com uma vista deslumbrante da cidade e possui uma programação especial que inclui transmissões de eventos esportivos e noites agitadas com DJs.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694030659/locations/bar12_kbogrt.jpg"
  },
  locationsp21: {
    name: "Sub Astor",
    address: "Rua Delfina, 163, Vila Madalena, São Paulo, SP",
    description: "O SubAstor, localizado no subsolo do refinado bar Astor, segue o conceito de speakeasy, inspirado nos bares secretos.
    Com um ambiente charmoso e aconchegante, sua decoração é uma homenagem às décadas de 50 e 60. É o lugar perfeito para os apreciadores de uma carta de drinks clássicos e variados.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694029639/locations/bar6_j1q3ry.jpg"
  },
  locationsp22: {
    name: "Armazém Piola",
    address: "Rua Aspicuelta, 574, Vila Madalena, São Paulo, SP",
    description: "O Armazém Piola, situado na Rua Aspicuelta, é o lugar ideal para reunir os amigos.
    Com um ambiente descontraído, mesas ao ar livre, paredes de tijolinho e decoração criativa, o bar oferece uma programação de música ao vivo que destaca novos talentos do samba, pagode, MPB e também conta com DJs para animar o público.",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694030652/locations/bar11_gzvmdk.jpg"
  },
  locationsp23: {
    name: "Le Pain Quotidien",
    address: "Rua Wisard, 138, Vila Madalena, São Paulo, SP",
    description: "O Le Pain Quotidien é conhecido por sua culinária clássica e pães orgânicos que complementam perfeitamente seus cafés em um ambiente rústico e chique. ",
    neighborhood_id: Neighborhood.find(11).id,
    category: "Café",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960148/locations/le-pain-jardins_z5exvi.jpg"
  },
  locationsp24: {
    name: "MASP",
    address: "Av. Paulista, 1578, São Paulo, SP",
    description: "Um museu de arte moderna com uma coleção de obras de arte de todo o mundo.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Museu",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960166/locations/masp_pkfgzg.jpg"
  },
  locationsp25: {
    name: "Shopping Cidade Jardim, São Paulo, SP",
    address: "Av. Magalhães de Castro, 12000",
    description: "Um shopping de luxo com uma variedade de lojas e restaurantes.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Loja",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960189/locations/shopping-cidade-jardim_b1bh06.jpg"
  },
  locationsp26: {
    name: "Parque Trianon",
    address: "Av. Paulista, 1700, São Paulo, SP",
    description: "Um parque público com uma variedade de árvores, flores e animais.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Parque",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960180/locations/parque-trianon_f5irwr.jpg"
  },
  locationsp27: {
    name: "Passeio de bicicleta pela Avenida Paulista",
    address: "Av. Paulista, São Paulo, SP",
    description: "Um passeio pela avenida mais famosa de São Paulo, com uma vista de tirar o fôlego.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Parque",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960134/locations/bike-av-paulista_ybeqs4.jpg"
  },
  locationsp28: {
    name: "Le Pain Quotidien Jardins",
    address: "Rua Haddock Lobo, 1382, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de pães, bolos e refeições.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Café",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960149/locations/le-pain-moema_mxdovg.jpg"
  },
  locationsp29: {
    name: "Bar Brahma Jardins",
    address: "Av. Paulista, 227, São Paulo, SP",
    description: "Um dos bares mais famosos de São Paulo, com uma variedade de pratos e bebidas.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960126/locations/bar-brahma_r6dkhf.jpg"
  },
  locationsp30: {
    name: "Paris 6 Jardins",
    address: "Rua Augusta, 1502, São Paulo, SP",
    description: "Um restaurante francês com um ambiente elegante e sofisticado.",
    neighborhood_id: Neighborhood.find(12).id,
    category: "Restaurante",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960172/locations/paris6-jardins_yqpozp.jpg"
  },
  locationsp31: {
    name: "Starbucks Moema",
    address: "Av. Ibirapuera, 2927, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de bebidas e comidas.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Café",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960216/locations/starbucks-moema_tfagc7.jpg"
  },
  locationsp32: {
    name: "Bar do Juarez Moema",
    address: "Av. Ibirapuera, 2181, São Paulo, SP",
    description: "Um bar tradicional da Vila Madalena com uma atmosfera descontraída.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694030654/locations/bar10_fqdqo0.jpg"
  },
  locationsp33: {
    name: "Coco Bambu",
    address: "Av. Ibirapuera, 3727, São Paulo, SP",
    description: "Um restaurante especializado em frutos do mar com um ambiente elegante.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Restaurante",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960139/locations/coco-bambu_kjqth7.jpg"
  },
  locationsp34: {
    name: "Museu de Arte Contemporânea de São Paulo",
    address: "Av. Pedro Álvares Cabral, 1301, São Paulo, SP",
    description: "Um museu de arte contemporânea com uma coleção de obras de arte de todo o mundo.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Museu",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960165/locations/mac-usp_egihwf.jpg"
  },
  locationsp35: {
    name: "Shopping Ibirapuera",
    address: "Av. Ibirapuera, 3900, São Paulo, SP",
    description: "Um shopping center com uma variedade de lojas e restaurantes.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Loja",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960189/locations/shopping-ibirapuera_g0qjsm.jpg"
  },
  locationsp36: {
    name: "Parque Ibirapuera",
    address: "Av. Pedro Álvares Cabral, São Paulo, SP",
    description: "Um parque público com uma variedade de atrações, incluindo o Museu de Arte Contemporânea de São Paulo, o Pavilhão Japonês e o Obelisco.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Parque",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960179/locations/parque-ibirapuera-2_qq0cv6.jpg"
  },
  locationsp37: {
    name: "Stand up paddle no Lago do Parque Ibirapuera",
    address: "Av. Pedro Álvares Cabral, São Paulo, SP",
    description: "Uma atividade ao ar livre para se divertir e praticar exercícios no lago do Parque Ibirapuera.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Parque",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960195/locations/standup-ibirapuera_rqfp8z.jpg"
  },
  locationsp38: {
    name: "Le Pain Quotidien Moema",
    address: "Av. Ibirapuera, 2, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de pães, bolos e refeições.",
    neighborhood_id: Neighborhood.find(13).id,
    category: "Café",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960149/locations/le-pain-moema_mxdovg.jpg"
  },
  locationsp39: {
    name: "Starbucks Pinheiros",
    address: "Rua dos Pinheiros, 248, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de bebidas e comidas.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Café",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960216/locations/starbucks-moema_tfagc7.jpg"
  },
  locationsp40: {
    name: "Bar Brahma Pinheiros",
    address: "Rua dos Pinheiros, 145, São Paulo, SP",
    description: "Um dos bares mais famosos de São Paulo, com uma variedade de pratos e bebidas.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960126/locations/bar-brahma_r6dkhf.jpg"
  },
  locationsp41: {
    name: "Mocotó",
    address: "Rua Aspicuelta, 542, São Paulo, SP",
    description: "Um restaurante especializado em comida brasileira com um ambiente informal.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Restaurante",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960139/locations/coco-bambu_kjqth7.jpg"
  },
  locationsp42: {
    name: "Pinacoteca do Estado de São Paulo",
    address: "Av. Tiradentes, 615, São Paulo, SP",
    description: "Um museu de arte com uma coleção de obras de arte de todo o mundo.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Museu",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960184/locations/pinacoteca1_wyhalg.jpg"
  },
  locationsp43: {
    name: "Shopping Villa Lobos",
    address: "Av. das Nações Unidas, 4777, São Paulo, SP",
    description: "Um shopping center com uma variedade de lojas e restaurantes.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Loja",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960194/locations/shopping-patio-paulista_kaf9tt.jpg"
  },
  locationsp44: {
    name: "Parque Villa Lobos",
    address: "Av. das Nações Unidas, 7161, São Paulo, SP",
    description: "Um parque público com uma variedade de atrações, incluindo o Auditório Ibirapuera, o Museu de Arte Moderna e o Museu de Arte Contemporânea de São Paulo.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Parque",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960194/locations/shopping-villa-lobos_sjctgj.jpg"
  },
  locationsp45: {
    name: "Stand up paddle no Lago do Parque Villa Lobos",
    address: "Av. das Nações Unidas, 716, São Paulo, SP",
    description: "Uma atividade ao ar livre para se divertir e praticar exercícios no lago do Parque Villa Lobos.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Parque",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960195/locations/standup-ibirapuera_rqfp8z.jpg"
  },
  locationsp46: {
    name: "Le Pain Quotidien Pinheiros",
    address: "Rua dos Pinheiros, 326, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de pães, bolos e refeições.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Café",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960148/locations/le-pain-jardins_z5exvi.jpg"
  },
  locationsp47: {
    name: "Bar da Esquina",
    address: "Rua dos Pinheiros, 340, São Paulo, SP",
    description: "Um bar tradicional da Vila Madalena com uma atmosfera descontraída.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694030654/locations/bar10_fqdqo0.jpg"
  },
  locationsp48: {
    name: "Jiquitaia",
    address: "Rua dos Pinheiros, 274, São Paulo, SP",
    description: "Um restaurante especializado em comida brasileira com um ambiente sofisticado.",
    neighborhood_id: Neighborhood.find(14).id,
    category: "Restaurante",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960147/locations/jiquitaia_exseaz.jpg"
  },
  locationsp49: {
    name: "Starbucks Bela Vista",
    address: "Rua Augusta, 1059, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de bebidas e comidas.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Café",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960216/locations/starbucks-moema_tfagc7.jpg"
  },
  locationsp50: {
    name: "Bar do Luiz",
    address: "Rua Augusta, 1246, São Paulo, SP",
    description: "Um bar tradicional da Bela Vista com uma atmosfera descontraída.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694030654/locations/bar10_fqdqo0.jpg"
  },
  locationsp51: {
    name: "San Gennaro",
    address: "Rua Treze de Maio, 171, São Paulo, SP",
    description: "Um restaurante italiano com um ambiente familiar.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Restaurante",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960189/locations/san-gennaro_ushavs.jpg"
  },
  locationsp52: {
    name: "Edifício Itália",
    address: "Av. Ipiranga, 344, São Paulo, SP",
    description: "Um edifício de 36 andares com uma vista panorâmica da cidade.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Museu",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960141/locations/edificio-italia_tdufb5.jpg"
  },
  locationsp53: {
    name: "Shopping Pátio Paulista",
    address: "Rua Augusta, 1261, São Paulo, SP",
    description: "Um shopping center com uma variedade de lojas e restaurantes.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Loja",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960194/locations/shopping-patio-paulista_kaf9tt.jpg"
  },
  locationsp56: {
    name: "Le Pain Quotidien Bela Vista",
    address: "Rua Augusta, 1875, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de pães, bolos e refeições.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Café",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960148/locations/le-pain-jardins_z5exvi.jpg"
  },
  locationsp57: {
    name: "Bar Brahma Bela Vista",
    address: "Av. Ipiranga, 344, São Paulo, SP",
    description: "Um dos bares mais famosos de São Paulo, com uma variedade de pratos e bebidas.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960126/locations/bar-brahma_r6dkhf.jpg"
  },
  locationsp58: {
    name: "Bráz Trattoria",
    address: "Rua Treze de Maio, 112, São Paulo, SP",
    description: "Uma trattoria italiana com um ambiente elegante.",
    neighborhood_id: Neighborhood.find(15).id,
    category: "Restaurante",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960134/locations/braz-trattoria_y4gyng.jpg"
  },
  locationsp59: {
    name: "Le Pain Quotidien",
    address: "Rua Jerônimo da Veiga, 149, São Paulo, SP",
    description: "Uma cafeteria internacional com uma variedade de pães, bolos e refeições.",
    neighborhood_id: Neighborhood.find(16).id,
    category: "Café",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960148/locations/le-pain-jardins_z5exvi.jpg"
  },
  locationsp60: {
    name: "SubAstor",
    address: "Rua Oscar Freire, 414, São Paulo, SP",
    description: "Um bar e restaurante com uma variedade de pratos e bebidas.",
    neighborhood_id: Neighborhood.find(16).id,
    category: "Bar",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1694030654/locations/bar10_fqdqo0.jpg"
  },
  locationsp61: {
    name: "D.O.M.",
    address: "Rua Barão de Capanema, 549, São Paulo, SP",
    description: "Um restaurante especializado em comida brasileira com um ambiente sofisticado.",
    neighborhood_id: Neighborhood.find(16).id,
    category: "Restaurante",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960141/locations/dom_nbtfef.jpg"
  },
  locationsp62: {
    name: "Museu de Arte de São Paulo (MASP)",
    address: "Avenida Paulista, 1578, São Paulo, SP",
    description: "Um museu de arte com uma coleção de obras de arte de todo o mundo.",
    neighborhood_id: Neighborhood.find(16).id,
    category: "Museu",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960166/locations/masp_pkfgzg.jpg"
  },
  locationsp63: {
    name: "Daslu",
    address: "Rua Oscar Freire, 855, São Paulo, SP",
    description: "Um shopping center de luxo com uma variedade de lojas e restaurantes.",
    neighborhood_id: Neighborhood.find(16).id,
    category: "Loja",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960140/locations/daslu_mrdusg.jpg"
  },
  locationsp64: {
    name: "Parque do Ibirapuera",
    address: "Avenida Pedro Álvares Cabral, São Paulo, SP",
    description: "Um parque público com uma variedade de atrações, incluindo o Museu de Arte Contemporânea de São Paulo, o Pavilhão Japonês e o Obelisco.",
    neighborhood_id: Neighborhood.find(16).id,
    category: "Parque",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960179/locations/parque-ibirapuera_ni8i0e.jpg"
  },
  locationsp65: {
    name: "Parque Burle Marx",
    address: "Rua Medeiros de Albuquerque, 450, São Paulo, SP",
    description: "Um parque público com uma variedade de jardins e esculturas.",
    neighborhood_id: Neighborhood.find(16).id,
    category: "Parque",
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960176/locations/parque-burle-marx_utlna1.jpg"
  }
}

locations.each do |key, location_data|

  location = Location.create(
    name: location_data[:name],
    description: location_data[:description],
    address: location_data[:address],
    category: location_data[:category],
    neighborhood_id: location_data[:neighborhood_id],
    user_id: location_data[:user_id],
    approved: location_data[:approved]
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
    date: Date.new(2023, 9, 10),
    description: "Um festival de arte urbana que transformará as ruas da Vila Madalena em uma galeria a céu aberto. Artistas locais e internacionais criarão murais incríveis.",
    location_id: Location.find(7).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960071/event/festival-arte-urbana_hlbejq.jpg"
  },
  event2: {
    title: "Concerto ao Pôr do Sol no Parque da Aclimação",
    date: Date.new(2023, 9, 9),
    description: "Uma noite mágica de música clássica no belo Parque das Artes. Traga seu piquenique e desfrute de um concerto inesquecível.",
    location_id: Location.find(6).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960065/event/concerto-por-do-sol_zyjvpj.jpg"
  },
  event3: {
    title: "Feira de Artesanato da Vila",
    date: Date.new(2023, 9, 9),
    description: "Descubra o talento artesanal local nesta feira, onde você encontrará joias, roupas e objetos de decoração únicos.",
    location_id: Location.find(7).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960068/event/feira-artesanato_t7ctpm.jpg"
  },
  event4: {
    title: "Exposição de Fotografia Cenas Urbanas",
    date: Date.new(2023, 9, 9),
    description: "Uma exposição cativante de fotografias que capturam a essência da vida urbana em São Paulo.",
    location_id: Location.find(24).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960065/event/exposicao-fotografica_mir8hp.jpg"
  },
  event5: {
    title: "Noite de Comédia Stand-up no Sub Astor",
    date: Date.new(2023, 9, 10),
    description: "Risos garantidos com os comediantes mais engraçados da cidade. Uma noite repleta de humor.",
    location_id: Location.find(21).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960086/event/standup-comedy_oq9nar.jpg"
  },
  event6: {
    title: "Workshop de Yoga ao Ar Livre",
    date: Date.new(2023, 9, 10),
    description: "Sinta a paz e a harmonia enquanto pratica yoga em meio à natureza no Parque da Vila.",
    location_id: Location.find(6).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960087/event/yoga-ar-livre_er1bum.jpg"
  },
  event7: {
    title: "Exposição de Arte Contemporânea Visões Abstratas",
    date: Date.new(2023, 9, 16),
    description: "Explore as mentes criativas dos artistas contemporâneos em uma exposição que desafia a forma e a cor.",
    location_id: Location.find(24).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960063/event/arte-contemporanea_vplxl6.jpg"
  },
  event8: {
    title: "Festa da Cultura Brasileira no Boteco São Conrado",
    date: Date.new(2023, 9, 9),
    description: "Celebre a riqueza da cultura brasileira com música ao vivo, dança e pratos típicos.",
    location_id: Location.find(9).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960069/event/festa-cultura-brasileira_kwi3jt.jpg"
  },
  event9: {
    title: "Passeio de Bicicleta pela Vila Madalena",
    date: Date.new(2023, 9, 9),
    description: "Explore os encantos da Vila de bicicleta com um passeio guiado pelas ruas pitorescas.",
    location_id: Location.find(7).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960085/event/passeio-bike_zofjca.jpg"
  },
  event10: {
    title: "Noite de Jazz no High Line Bar",
    date: Date.new(2023, 9, 9),
    description: "Relaxe ao som suave do jazz em um dos bares mais aconchegantes da Vila.",
    location_id: Location.find(19).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960077/event/noite-jazz_ilfxqq.jpg"
  },
  event11: {
    title: "Noite de Karaokê no Quintal do Espeto",
    date: Date.new(2023, 9, 10),
    description: "Solte sua voz e divirta-se cantando seus hits favoritos com amigos.",
    location_id: Location.find(14).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960080/event/noite-karaoke_kowllg.jpg"
  },
  event12: {
    title: "Exposição de Esculturas no Espaço Criativo",
    date: Date.new(2023, 9, 9),
    description: "Admire esculturas impressionantes criadas por artistas locais.",
    location_id: Location.find(24).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960065/event/exposicao-esculturas_xvf6xh.jpg"
  },
  event13: {
    title: "Festival de Food Trucks na Rua Medeiros",
    date: Date.new(2023, 9, 9),
    description: "Experimente uma variedade de pratos de food trucks com música ao vivo.",
    location_id: Location.find(7).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960072/event/festival-foodtruck_llk2zj.jpg"
  },
  event14: {
    title: "Festival de Jazz no Parque Trianon",
    date: Date.new(2023, 9, 9),
    description: "Desfrute de uma noite mágica de jazz ao ar livre, com músicos talentosos e comida de rua deliciosa.",
    location_id: Location.find(26).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960074/event/festival-jazz_apysyr.jpg"
  },
  event15: {
    title: "Noite de MPB no Armazém Piola",
    date: Date.new(2023, 9, 9),
    description: "Uma noite de música popular brasileira ao vivo com drinks especiais e petiscos.",
    location_id: Location.find(22).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960080/event/noite-mpb1_elw0oj.jpg"
  },
  event16: {
    title: "Sessão de Cinema ao Ar Livre no Ibirapuera",
    date: Date.new(2023, 9, 9),
    description: "Traga sua cadeira de praia e aproveite um filme sob as estrelas.",
    location_id: Location.find(36).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960064/event/cinema-arlivre_vh4m71.jpg"
  },
  event17: {
    title: "Feira Gastronômica na Praça da Vila Madalena",
    date: Date.new(2023, 9, 9),
    description: "Saboreie pratos deliciosos de diferentes culturas em um evento gastronômico diversificado.",
    location_id: Location.find(7).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960068/event/feira-gastronomica_iwyssa.jpg"
  },
  event18: {
    title: "Degustação de Cerveja Artesanal no Boteco São Conrado",
    date: Date.new(2023, 9, 17),
    description: "Experimente cervejas artesanais locais com especialistas em cerveja.",
    location_id: Location.find(9).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960064/event/cerveja-artesanal_y11xl7.jpg"
  },
  event19: {
    title: "Noite de Bossa Nova no Vila 567",
    date: Date.new(2023, 9, 10),
    description: "Desfrute de uma atmosfera sofisticada com músicas de bossa nova e coquetéis exclusivos.",
    location_id: Location.find(17).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960075/event/noite-bossa-nova_f1prwp.jpg"
  },
  event20: {
    title: "Noite de Samba no Bar do Beco",
    date: Date.new(2023, 9, 9),
    description: "O melhor do samba ao vivo com deliciosos petiscos brasileiros e caipirinhas especiais.",
    location_id: Location.find(2).id,
    user_id: User.first.id,
    approved: true,
    photo_url: "https://res.cloudinary.com/go-local/image/upload/v1693960081/event/noite-samba_qy5jhk.jpg"
  }
}

events.each do |key, event_data|

  event = Event.create(
    title: event_data[:title],
    description: event_data[:description],
    date: event_data[:date],
    location_id: event_data[:location_id],
    neighborhood_id: event_data[:neighborhood_id],
    user_id: event_data[:user_id],
    approved: event_data[:approved]
  )
  if event_data[:photo_url]
    file = URI.open(event_data[:photo_url])
    event.photo.attach(io: file, filename: "#{event_data[:title]}.jpg", content_type: "image/jpg")
  end

  event.save!
end
