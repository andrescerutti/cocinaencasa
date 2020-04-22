puts 'Cleaning database...'
puts 'Erasing reviews...'
Review.destroy_all
puts 'Erasing payments...'
Payment.destroy_all
puts 'Erasing orders...'
Order.destroy_all
puts 'Erasing favourites...'
Favourite.destroy_all
puts 'Erasing steps...'
Step.destroy_all
puts 'Erasing guides...'
Guide.destroy_all
puts 'Erasing categorys...'
KitCategory.destroy_all
Category.destroy_all
puts 'Erasing kit_cookwares...'
KitCookware.destroy_all
puts 'Erasing Cookware...'
Cookware.destroy_all
puts 'Erasing kit_ingredients...'
KitIngredient.destroy_all
puts 'Erasing ingredients...'
Ingredient.destroy_all
puts 'Erasing kits...'
Kit.destroy_all
puts 'Erasing restaurants...'
Restaurant.destroy_all
puts 'Erasing brands...'
Brand.destroy_all
puts 'NOT Erasing users...'
# User.destroy_all
puts 'Erasing addresses...'
Address.destroy_all

User.destroy_all

puts 'creating categories'
["Los más pedidos", "Americana", "Postres", "Italiana", "Internacional", "Saludable", "Asiática","Panadería", "Árabe", "Carnes", "Argentina", "Mexicana", "Latina", "Peruana"].each do |name|
  Category.create!(name: name)
end

puts 'Creating users'

INGREDIENTS = [
  {
    name: "Arroz",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/150g-sushi-rice-v2-x200.jpg"
  },

  {
    name: "Salsa de soja",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/soy-sauce-sachet-x200.jpg"
  },

  {
    name: "Langostinos crudos",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/248g-jumbo-king-prawns-x200.jpg"
  },

  {
    name: "Palta",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/1-avocado-x200.jpg"
  },

  {
    name: "Pepino",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/cucumber-x200.jpg"
  },

  {
    name: "Salmón fresco",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/2-salmon-fillets-x200.jpg"
  },

  {
    name: "Alga Nori",
    remote_image_url: "https://cdn.shopify.com/s/files/1/2371/7589/products/nori_seaweed.jpg?v=1518625551"
  },

  {
    name: "Atún fresco",
    remote_image_url: "https://midlandchilled.co.uk/wp-content/uploads/2013/12/F312F.jpg"
  },

  {
    name: "Kanikama",
    remote_image_url: "https://i.imgur.com/vcFvYZz.jpg"
  },

  {
    name: "Semillas de sesamo",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/sesame-seeds-x200.jpg"
  },

  {
    name: "Wasabi",
    remote_image_url: "https://i.imgur.com/LLyFbnY.jpg"
  },

  {
    name: "Diente de ajo",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/garlic-clove-x200.jpg"
  },

  {
    name: "Perejil",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/fresh-coriander-x200.jpg"
  },

  {
    name: "Salsa de pimienta roja",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/1-Sriracha-hot-chilli-sauce-sachet-8ml-x200.jpg"
  },

  {
    name: "Cerdo",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/2-x-150g-British-picanha-rump-steak-x200.jpg"
  },

  {
    name: "Papa",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/sweet-potato-x200.jpg"
  },

  {
    name: "Pastilla de avecrem",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/sour-cream-x200.jpg"
  },

  {
    name: "Vino blanco",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/cider-vinegar-x200.jpg"
  },

  {
    name: "Aceite de oliva",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/sesame-oil-x200.jpg"
  },

  {
    name: "Salsa de BBQ",
    remote_image_url: "https://assets.bonappetit.com/photos/5ac7c75a58c1050ba7ca239a/1:1/h_276,c_limit/Basically_Vanilla-Extract.jpg"
  },

  {
    name: "Plátanos maduros",
    remote_image_url:"https://assets.bonappetit.com/photos/5b7efb0334b974168939a33a/1:1/h_276,c_limit/basically-bananas.png"
  },

  {
    name: "Queso en hebras",
    remote_image_url: "https://i.imgur.com/80HY1Jf.jpg"
  },

  {
    name: "Costillar de cerdo",
    remote_image_url: "https://i.imgur.com/F9lQugK.jpg",
  },

  {
    name: "Almendras",
    remote_image_url: "https://assets.bonappetit.com/photos/59721bae34cdf71ac5825812/1:1/h_276,c_limit/Basically_Almonds-Chopped.jpg"
  },

  {
    name: "Limon",
    remote_image_url: "https://assets.bonappetit.com/photos/598b2425eb58a76ce841b143/1:1/h_276,c_limit/Basically_Lemon.jpg"
  },

  {
    name: "Spaghetti",
    remote_image_url: "https://assets.bonappetit.com/photos/5969388d2b659b48a371c309/1:1/h_276,c_limit/basically-ingredients-spaghetti.jpg"
  },
  {
    name: "Queso rallado",
    remote_image_url: "https://assets.bonappetit.com/photos/596938815df40d13712705f6/1:1/h_276,c_limit/basically-ingredient-parmesan.jpg"
  },

  {
    name: "Comino",
    remote_image_url: "https://assets.bonappetit.com/photos/59bc2b02810ec3374e2f8bc8/1:1/h_276,c_limit/Basically_Toasted-Sesame-Seeds.jpg"
  },

  {
    name: "Pollo",
    remote_image_url: "https://assets.bonappetit.com/photos/5ce689b1ccd61f96344c2f86/1:1/h_276,c_limit/Basically_chickenbreast.jpg"
  },

  {
    name: "Piña",
    remote_image_url: "https://assets.bonappetit.com/photos/5a8da3353d8ebf78d69f862c/1:1/h_276,c_limit/Basically_Pineapple.jpg"
  },

  {
    name: "Cebolla morada",
    remote_image_url: "https://assets.bonappetit.com/photos/596ce8ee7102712b68401afa/1:1/h_276,c_limit/Basically_Red-Onion.jpg"
  },

  {
    name: "Azucar",
    remote_image_url: "https://assets.bonappetit.com/photos/596ceb276c75df51bc0b9298/1:1/h_276,c_limit/basically-ingredients-granulated-sugar.jpg"
  },

  {
    name: "Huevos",
    remote_image_url: "https://assets.bonappetit.com/photos/59aed1cce1fa821f5140d340/1:1/h_276,c_limit/Basically_Eggs-Large.jpg"
  },

  {
    name: "Curcuma",
    remote_image_url: "https://assets.bonappetit.com/photos/598b23d41ec78a46feca0995/1:1/h_276,c_limit/Basically_Cinnamon.jpg"
  },

  {
    name: "Cebolla",
    remote_image_url: "https://assets.bonappetit.com/photos/5981ee524f130a49582c2d0a/1:1/h_276,c_limit/Basically_Onions-Yellow-Large.jpg",
  },

  {
    name: "Azucar morena",
    remote_image_url: "https://assets.bonappetit.com/photos/5c5210af2f2fcb652dcd37fb/1:1/h_276,c_limit/BA_OO_S05_Ep004_Basically_ChickenSchnitzelWithRawSalad_Video_stills_01_BREADCRUMBS.jpg"
  },

  {
    name: "Zanhaoria",
    remote_image_url: "https://assets.bonappetit.com/photos/59bc2a79b44d0053ed192701/1:1/h_276,c_limit/Basically_Carrots.jpg"
  },

  {
    name: "Cilantro",
    remote_image_url: "https://assets.bonappetit.com/photos/5981ebc9eeb1571af36e4db4/1:1/h_276,c_limit/Basically_Basil-Leaves.jpg"
  },

  {
    name: "Remolacha",
    remote_image_url: "https://theforkedspoon.com/wp-content/uploads/2017/04/How-to-Cook-Beets-700x1050.jpg"
  },

  {
    name: "Manteca",
    remote_image_url: "https://assets.bonappetit.com/photos/598b23b667b3c327ec47eacf/1:1/h_276,c_limit/Basically_Butter.jpg"
  },

  {
    name: "Pan integral",
    remote_image_url: "https://i1.wp.com/4.bp.blogspot.com/-EvNbsjE_LbI/W22tabo-FgI/AAAAAAAAMUo/FD_YfhCc0yUiSX2E3iG59sm2rdWtDZQCwCLcBGAs/s1600/pandesemillas.png?ssl=1"
  },

  {
    name: "Espinaca",
    remote_image_url: "https://assets.bonappetit.com/photos/57ad42411b33404414975574/16:9/w_1200,c_limit/sauteed-spinach-with-soy-and-sesame.jpg"
  },
  # Arreglar fotos.
  {
    name: "Chorizo",
    remote_image_url: "http://d26lpennugtm8s.cloudfront.net/stores/562/484/products/35-chorizo-especial11-20536b77423e160f0115119522834356-640-0.jpg"
  },

  {
    name: "Champiñones",
    remote_image_url: "https://estaticos.muyinteresante.es/media/cache/680x_thumb/uploads/images/gallery/5548e20741444aef0ed38ec2/sistema-inmune.jpg"
  },

  {
    name: "Milanesa de pollo",
    remote_image_url: "http://carnesneme.es/wp-content/uploads/2017/01/milanesas1-3565b87b5f37bb144b14941859058980-640-0.jpeg"
  },

  {
    name: "Queso manchengo",
    remote_image_url: "https://www.chapela.es/wp-content/uploads/2017/11/Queso-semicurado-web-min.png"
  },

  {
    name: "Pan molido",
    remote_image_url: "https://www.chapela.es/wp-content/uploads/2017/11/Queso-semicurado-web-min.png"
  },
  {
    name: "Arroz Carnioli",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/150g-sushi-rice-v2-x200.jpg"
  },
  {
    name: "Caldo de verduras",
    remote_image_url: "https://i.imgur.com/X99twmu.png"
  },
  {
    name: "Brócoli",
    remote_image_url: "https://cdn.imgbin.com/13/20/21/imgbin-broccoli-wPFYcbT7JadCG940pF0bJfsvZ.jpg"
  },
  {
    name: "Pechuga de pollo",
    remote_image_url: "https://assets.bonappetit.com/photos/5ce689b1ccd61f96344c2f86/1:1/h_276,c_limit/Basically_chickenbreast.jpg"
  },
  {
    name: "Papas pequeñas",
    remote_image_url: "https://production-media.gousto.co.uk/cms/ingredient-image/sweet-potato-x200.jpg"
  },
  {
    name: "Tomates cherry",
    remote_image_url: "https://comprafresca.es/603-tm_large_default/tomate-cherry.jpg"
  },
  {
    name: "Hongos secos",
    remote_image_url: "https://http2.mlstatic.com/hongos-secos-chilenos-x-10-kg-D_NQ_NP_958672-MLA31180780262_062019-Q.jpg"
  },
    ]

puts 'creating cookwares'

COOKWARES = [
  { name: "Cuchillo de chef", remote_image_url: "https://assets.bonappetit.com/photos/5969387c7102712b68401a77/1:1/h_276,c_limit/basically-equipment-chefs-knife%20.jpg" },
  { name: "Tabla para cortar", remote_image_url: "https://assets.bonappetit.com/photos/59693b227102712b68401a8c/1:1/h_276,c_limit/basically-equipment-cutting-board.jpg" },
  { name: "Bowl chico", remote_image_url: "https://assets.bonappetit.com/photos/59690da8a0530210d4a24a1f/1:1/h_276,c_limit/basically-equipment-small-bowl.jpg" },
  { name: "Bowl mediano", remote_image_url: "https://assets.bonappetit.com/photos/59690d9a51b3be287d7816e1/1:1/h_276,c_limit/basically-equipment-large-bowl.jpg" },
  { name: "Esterilla", remote_image_url: "http://www.cocinayvino.com/wp-content/uploads/2017/05/23215945_l.jpg" },
  { name: "Bandeja", remote_image_url: "https://assets.bonappetit.com/photos/596940e46c75df51bc0b91c4/1:1/h_276,c_limit/basically-equipment-rimmed-baking-sheet.jpg" },
  { name: "Plato", remote_image_url: "https://assets.bonappetit.com/photos/596f7dea3bb0831778007028/1:1/h_276,c_limit/Basically_Plate.jpg" },
  { name: "Brocha", remote_image_url: "https://assets.bonappetit.com/photos/5a2adb357d4b9b484283ebd4/1:1/h_276,c_limit/Basically_Pastry_Brush.jpg" },
  { name: "Amazadora", remote_image_url: "https://assets.bonappetit.com/photos/5a2082b9ba79684ffc2e8d55/1:1/h_276,c_limit/Basically_Rolling_Pin.jpg" },
  { name: "Espatula de plastico", remote_image_url: "https://assets.bonappetit.com/photos/597901f35e52a765a32832ce/1:1/h_276,c_limit/Basically_Rubber-Spatula.jpg" },
  { name: "Cuchara de medida", remote_image_url: "https://assets.bonappetit.com/photos/596cf407b85671732e0d55ff/1:1/h_276,c_limit/Basically_Tablespoon.jpg" },
  { name: "Bowl grande", remote_image_url: "https://assets.bonappetit.com/photos/596938717654ad3411665279/1:1/h_276,c_limit/basically-equipment-large-pot.jpg" },
  { name: "Cuchara", remote_image_url: "https://assets.bonappetit.com/photos/596940436c75df51bc0b91c0/1:1/h_276,c_limit/basically-equipment-wooden-spoon.jpg" },
  { name: "Graduado", remote_image_url: "https://assets.bonappetit.com/photos/59d7daa6a3542e7d35aabb76/1:1/h_276,c_limit/Basically_Glass-Measuring-2-Cups.jpg" },
  { name: "Olla", remote_image_url:"https://assets.bonappetit.com/photos/5a7490a05736e36c6bb6a23e/1:1/h_276,c_limit/Basically_Dutch-Oven-Large-with-Lid.jpg" },
  { name: "Sarten", remote_image_url: "https://assets.bonappetit.com/photos/596940c66c75df51bc0b91c2/1:1/h_276,c_limit/basically-equipment-medium-skillet.jpg" }
]

USERS = [
  {
    first_name: 'Alejo',
    last_name: 'Chaves',
    permision_level: 5,
    email: 'alejoagchaves@gmail.com',
    password: 'elturrodealverti',
    avatar_image: 'https://ca.slack-edge.com/T02NE0241-UNDMY14Q5-3615c3435408-512'
  },

  {
    first_name: 'Andres',
    last_name: 'Cerutti',
    permision_level: 5,
    email: 'cerutti_andres@hotmail.com',
    password: 'ningun',
    avatar_image:'https://ca.slack-edge.com/T02NE0241-UNDCB0BTN-6e9c411fc926-512'
  },
  {
    first_name: 'Gaspar',
    last_name: 'Baldunciel',
    permision_level: 5,
    email: 'gasparbaldunciel@gmail.com',
    password: 'gas321',
    avatar_image: 'https://ca.slack-edge.com/T02NE0241-UNFJ1HF0F-08f9f98b0ab4-512'
  },
  {
    first_name: 'Romina',
    last_name: 'Baldunciel',
    permision_level: 1,
    email: 'romina@gmaail.com',
    password: 'faqe111as',
    avatar_image: 'https://images.unsplash.com/photo-1520813792240-56fc4a3765a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'
  },
  {
   first_name: 'Lucia',
   last_name: 'Fernandez',
   permision_level: 1,
   email: 'lucia-fernandez@gmaail.com',
   password: 'faqe11123434as',
   avatar_image: 'https://images.unsplash.com/photo-1546961329-78bef0414d7c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'
  },
   {
  first_name: 'Lucas',
  last_name: 'Sanchez',
  permision_level: 1,
  email: 'lucas.sanchez@gmaail.com',
  password: 'faqe11123434as',
  avatar_image: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80'
  }
]

BRANDS = [
  {
    brand: {
      name: 'Mano Rota',
      remote_logo_url: 'https://www.manorota.com/wp-content/uploads/2018/02/logo-manorota-e1529613131810.png'
    },
    restaurants: [
                  {
                    name: 'Mano Rota',
                    phone: "+54926058752",
                    test_mp_public_key: "TEST-97be680b-9143-4d57-80bf-50ae0576c5f2",
                    test_mp_private_key: "TEST-5497686852257892-041221-d6bb381c98ee79cdcd0872704a705297-168219137",
                    prod_mp_public_key: "APP_USR-d47234f2-9c8d-40d2-89a8-654125e5cf47",
                    prod_mp_private_key: "APP_USR-5497686852257892-041221-f838a8d921fa05cb3f14f83f25464505-168219137",
                    day_open: "Lunes a Viernes de 8:30 a 16:00 hs",
                    email: "info123@manorota.com",
                    remote_image_url: 'https://tendencias.tv/wp-content/uploads/2016/07/MANO-ROTA.jpg',
                    address_attributes: {
                                          address: "Paraguay 4801, Buenos Aires, Ciudad Autónoma de Buenos Aires",
                                          latitude: -34.582034,
                                          longitude: -58.427546,
                                        }
                  },
                ],
    kits: [
            { general_information: {
                name: 'Pollo relleno de queso fundido y chorizo',
                stock: 10,
                price: 425,
                size: 3,
                preparation_time: 45,
                description: 'Pollo relleno de una combinación entre Queso derretido y Chorizo.',
                remote_image_url: 'https://i.ytimg.com/vi/7yyIEA3h62Y/maxresdefault.jpg',
              },
              cooking_ingredients: [
                                      { quantity: 1, unit: 'g', name: "Chorizo" },
                                      { quantity: 0.5, unit: 'ml', name: "Cebolla" },
                                      { quantity: 1, unit: 'u', name: "Diente de ajo" },
                                      { quantity: 2, unit: 'g', name: "Champiñones" },
                                      { quantity: 2, unit: 'g', name: "Milanesa de pollo" },
                                      { quantity: 30, unit: 'g', name: "Queso manchengo" },
                                      { quantity: 2, unit: 'u', name: "Huevos" },
                                      { quantity: 25, unit: 'g', name: "Pan molido" },
                                      { quantity: 0.5, unit: 'g', name: "Palta" },
                                      { quantity: 0.5, unit: 'g', name: "Limon" },
                                    ],
              cooking_cookwares: ["Cuchillo de chef", "Tabla para cortar", "Bowl chico", "Bowl mediano", "Sarten"],
              categories: ["Americana", "Los más pedidos"],
              guides: { video: "_wU4o-WhNnQ",
                        steps: [
                                { order: 1, content: "Pelar y cortan los champiñones." },
                                { order: 2, content: "En un sartén cocinar el chorizo por 3 minutos, agregar la cebolla y los dientes de ajo." },
                                { order: 3, content: "Salpimentar y agregar los champiñones. Cocinar por 5 minutos." },
                                { order: 4, content: "Agregar sal, pimienta y perejil picado a las milanesas de pollo." },
                                { order: 5, content: "Agregar la mezcla de chorizo y queso manchego." },
                                { order: 6, content: "Realizar rollos." },
                                { order: 7, content: "Pasar los rollos por harina, huevo y por último pan molido." },
                                { order: 8, content: "Freír hasta que estén dorados." },
                                { order: 9, content: "Cortar en rodajas." },
                                { order: 10, content: "Machacar el aguacate, agregar sal, perejil picado y el limón, mezclar. Colocar en cada rodaja de pollo." },
                                { order: 11, content: "Espolvorear con un poco de perejil picado." },
                               ]
                      },
              kit_orders: [
                            {
                              kit_name: "Pollo relleno de queso fundido y chorizo",
                              user_email: "lucas.sanchez@gmaail.com",
                              check_out_session_id: "pending",
                              amount: 1,
                              status: 0,
                              code: "432509",
                              date_delivery: "2019/12/02 07:00",
                              address_attributes: {
                                                    address: "Avenida Libertador 3380, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina",
                                                    latitude: -34.571301,
                                                    longitude: -58.468190,
                                                  },
                              review: {
                                        content: "Excelente la calidad de los ingredientes, el plato quedo muy bien",
                                        rating: 5,
                                        remote_image_url: "https://www.te.gob.mx/blog/reyes/media/layout/images/img_no_disponible.png"
                                      }
                            },
                          ],
            },
            { general_information: {
                                      name: 'Risotto de hongos',
                                      stock: 0,
                                      price: 350,
                                      size: 1,
                                      preparation_time: 60,
                                      description: 'Un auténtico Risotto de hongos.',
                                      remote_image_url: 'https://truffle-assets.imgix.net/1t1bxm43v4e3_3MtBfTVlAkaIuGeO0Mo4QW_risotto-de-hongos_landscapeThumbnail_en-US.png'
                                    },
              cooking_ingredients: [
                                      { quantity: 100, unit: 'g', name: "Arroz Carnioli" },
                                      { quantity: 1, unit: 'u', name: "Cebolla" },
                                      { quantity: 1, unit: 'u', name: "Diente de ajo" },
                                      { quantity: 200, unit: 'g', name: "Champiñones" },
                                      { quantity: 50, unit: 'g', name: "Hongos secos" },
                                      { quantity: 100, unit: 'ml', name: "Vino blanco" },
                                      { quantity: 1, unit: 'u', name: "Caldo de verduras" },
                                ],
              cooking_cookwares: ["Cuchillo de chef", "Tabla para cortar", "Bowl chico", "Bowl mediano", "Sarten", "Olla", "Cuchara"],
              categories: ["Opciones Saludables"],
              guides: { video: "WRslIFqxNy0",
                        steps: [
                                  { order: 1, content: "En sartén, rehogar el ajo y la cebolla. Agregar los champiñones fileteados y los hongos de pino picados." },
                                  { order: 2, content: "Agregar el arroz. Cuando dore, añadir el vino blanco. Bajar el fuego y agregar de a poco el caldo caliente a medida que lo vaya necesitando. Condimentar." },
                                  { order: 3, content: "Cuando esté al dente, terminar con manteca fría y queso rallado." },
                                  { order: 4, content: "Espolvorea con perejil picado y servir." },
                               ]
                      },
              kit_orders: [
                            {
                              kit_name: "Risotto de hongos",
                              user_email: "lucia-fernandez@gmaail.com",
                              check_out_session_id: "pending",
                              amount: 1,
                              status: 1,
                              code: "586038",
                              date_delivery: "2019/12/01 01:00",
                              address_attributes: {
                                                    address: "Avenida Callao 1833, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina",
                                                    latitude: -34.588468,
                                                    longitude: -58.388461,
                                                  },
                              review: {
                                        content: "Un plato muy loco e innovador",
                                        rating: 5,
                                        remote_image_url: "https://www.te.gob.mx/blog/reyes/media/layout/images/img_no_disponible.png"
                                      }
                            },
                          ],
            }
          ]
  },
  {
    brand: {
      name: 'Abantal',
      remote_logo_url: 'https://www.diariodesevilla.es/2019/09/17/con_cuchillo_y_tenedor/cosas_de_come/mesa-junto-cocina_1392470814_107011889_1994x1024.jpg'
    },
    restaurants: [ {
                    name: 'Abantal',
                    phone: "+59265871554",
                    test_mp_public_key: "TEST-616e8f02-6dda-4804-a211-a8420a5b1dfc",
                    test_mp_private_key: "TEST-5189200031208569-041221-5d856d7977f9479b339288b6cf41e4ae-125522072",
                    prod_mp_public_key: "APP_USR-516eb105-81a6-4e01-8566-75fe8fb966e3",
                    prod_mp_private_key: "APP_USR-5189200031208569-041221-e925141c98437e21acad9c43384276cd-125522072",
                    email: "info12@abantal.com",
                    day_open: "Lunes a Viernes de 8:30 a 14:00 hs",

                    remote_image_url: 'https://www.diariodesevilla.es/2019/09/17/con_cuchillo_y_tenedor/cosas_de_come/mesa-junto-cocina_1392470814_107011889_1994x1024.jpg',
                    address_attributes: {
                                          address: "Soler 4202",
                                          latitude: -34.589695,
                                          longitude: -58.421230,
                                        }
                  },
                ],
    kits: [
            { general_information: {
                                      name: 'Costillar de cerdo',
                                      stock: 0,
                                      price: 567,
                                      size: 1,
                                      preparation_time: 90,
                                      description: 'Costillar de cerdo asado a fuego lento, aderezado con salsa barbacoa, acompañado de papas fritas.',
                                      remote_image_url: 'https://www.traegergrills.com/images/en-us/Recipes/2019/Feb%202019/20190116_BBQ-Ribs-By-Amanda-Haas_RE_HE_M.jpg'
                                    },
              cooking_ingredients: [
                                  { quantity: 8, unit: 'g', name: "Diente de ajo" },
                                  { quantity: 10, unit: 'g', name: "Perejil" },
                                  { quantity: 3, unit: 'g', name: "Salsa de pimienta roja" },
                                  { quantity: 800, unit: 'g', name: "Costillar de cerdo" },
                                  { quantity: 300, unit: 'g', name: "Papa" },
                                  { quantity: 120, unit: 'ml', name: "Pastilla de avecrem" },
                                  { quantity: 70, unit: 'ml', name: "Vino blanco" },
                                  { quantity: 20, unit: 'ml', name: "Aceite de oliva" },
                                  { quantity: 25, unit: 'g', name: "Salsa de BBQ" },
                                ],
              cooking_cookwares: ["Bandeja", "Plato", "Brocha", "Amazadora", "Espatula de plastico", "Cuchara", "Bowl grande", "Cuchara de medida", "Graduado", "Olla", "Sarten"],
              categories: ["Los más pedidos", "Carne"],
              guides: { video: "ukMzUCjRjmE",
                        steps: [
                                  { order: 1, content: "Comenzamos con una receta para hacer unas costillas de cerdo al horno de forma sencilla pero a la vez muy sabrosa y apetitosa. Es una forma interesante para comenzar a hacer esta receta si no tienes mucha práctica previa. Para comenzar, antes de nada vamos a limpiar bien nuestro costillar de cerdo y a dejarlo secar bien. Si preferís podéis cortar ya las costillas y hornearlas así cortadas, aunque en nuestro caso vamos a hornear el costillar entero y serpararlo después de estar cocinado. Vamos a encender el horno para que vaya precalentándose a 200ºC durante el tiempo que tardamos en preparar el resto de ingredientes." },
                                  { order: 2, content: "Mientras esperamos que el horno alcance la temperatura adecuada, vamos a pelar los ajos, y los echamos en un recipiente junto con un chorreón de aceite de oliva virgen, un poco de sal, un poco de pimienta negra y perejil, y lo vamos a batir para formar una mezcla cremosa y de aspecto homogéneo. Se le puede añadir un toque de limón o de vino si queréis dar un toque extra de sabor, de forma opcional, o cualquier otro tipo de especia que os guste, aunque para empezar os recomedamos utilizar este simple aliño." },
                                  { order: 3, content: "Esta mezcla la vamos a extender bien por el costillar de cerdo, lo mejor es hacerlo con las manos para untar bien toda la carne con la misma. Una vez que el horno haya alcanzado los 200ºC, vamos a meter las costillas aliñadas en una bandeja y las vamos a hornear sobre 30 o 35 minutos por cada cara. El tiempo dependerá del grosor de las costillas de cerdo que estemos horneado, ya que no es lo mismo hornear costillas ibéricas que costillas carnudas, que tiene #########################" },
                                  { order: 4, content: "Cuando la carne esté doradita por ambos lados, para lo que es interesante dar un toque final con el grill del horno durante unos minutos, con cuidado de que no se nos quemen, ya podemos sacar las costillas al horno y servirlas siempre en caliente. Se pueden acompañar con alguna guarnición para acompañar, como una ensalada o patatas fritas o asadas, y también con alguna salsa que nos guste, alguna especial para carnes. Y a disfrutar de esta receta tan sencilla y tan apetitosa, que seguro que resulta un éxito entre tus comensales e invitados." },
                               ]
                      },
              kit_orders: [
                              {
                                kit_name: "Costillar de cerdo",
                                user_email: "lucia-fernandez@gmaail.com",
                                check_out_session_id: "pending",
                                amount: 1,
                                status: 3,
                                code: "395729",
                                date_delivery: "2019/11/18 08:00",
                                address_attributes: {
                                                      address: "Rodriguez Peña 1833, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina",
                                                      latitude: -34.589252,
                                                      longitude: -58.387530,
                                                    },
                                review: {
                                          content: "Buenisimo!",
                                          rating: 4,
                                          remote_image_url: "https://www.recipetineats.com/wp-content/uploads/2016/01/Oven-Pork-Ribs-with-Barbecue-Sauce_4.jpg"
                                        }
                              },

                              {
                                kit_name: "Costillar de cerdo",
                                user_email: "sebastian@gmail.com",
                                check_out_session_id: "pending",
                                amount: 1,
                                status: 4,
                                code: "586038",
                                date_delivery: "2019/05/19 01:00",
                                address_attributes: {
                                                      address: "Avenida Callao 1833, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina",
                                                      latitude: -34.588468,
                                                      longitude: -58.388461,
                                                    },
                                review: {
                                          content: "No hay con que darle a esa barbacoa, muy bueno.",
                                          rating: 4,
                                          remote_image_url: "https://cafedelites.com/wp-content/uploads/2018/06/Pork-Ribs-IMAGE-13.jpg"
                                        }
                              },

                              {
                                kit_name: "Costillar de cerdo",
                                user_email: "felipe@gmail.com",
                                check_out_session_id: "pending",
                                amount: 1,
                                status: 5,
                                code: "937859",
                                date_delivery: "2019/10/19 12:00",
                                address_attributes: {
                                                      address: "Avenida Libertador 1833, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina",
                                                      latitude: -34.582266,
                                                      longitude: -58.399956,
                                                    },
                                review: {
                                          content: "Salio excelente, ya me puedo considerar como chef.",
                                          rating: 5,
                                          remote_image_url: "https://d1alt1wkdk73qo.cloudfront.net/images/guide/b97326af298c4712b697ee8ea26d4a51/478x640_ac.jpg"
                                        }
                              }
                            ],
            },
            { general_information: {
                                      name: 'Croquetas de Pollo y Brócoli',
                                      stock: 0,
                                      price: 245,
                                      size: 1,
                                      preparation_time: 30,
                                      description: 'Exquisitas Croquetas de Brócoli',
                                      remote_image_url: 'https://truffle-assets.imgix.net/916a7d40-croquetas-de-brocoli-con-pollo-l.jpg'
                                    },
              cooking_ingredients: [
                                      { quantity: 1, unit: 'u', name: "Brócoli" },
                                      { quantity: 0.5, unit: 'u', name: "Cebolla" },
                                      { quantity: 1, unit: 'u', name: "Diente de ajo" },
                                      { quantity: 1, unit: 'u', name: "Pechuga de pollo" },
                                      { quantity: 5, unit: 'u', name: "Papas pequeñas" },
                                      { quantity: 2, unit: 'u', name: "Huevos" },
                                      { quantity: 400, unit: 'g', name: "Tomates cherry" },
                                      { quantity: 0.5, unit: 'u', name: "Palta" },
                                      { quantity: 0.5, unit: 'u', name: "Limon" },
                                    ],
              cooking_cookwares: ["Cuchillo de chef", "Tabla para cortar", "Bowl chico", "Bowl mediano"],
              categories: ["Los más pedidos", "Opciones Saludables"],
              guides: { video: "9R-TJj5hk1o",
                        steps: [
                                  { order: 1, content: "Separar el brócoli." },
                                  { order: 2, content: "Cocer el brócoli de 2 a 3 minutos" },
                                  { order: 3, content: "Cocer el pollo y desmenuzar." },
                                  { order: 4, content: "Licuar el brócoli con la cebolla y ajo." },
                                  { order: 5, content: "Agregar el pollo desmenuzado y licuar hasta lograr una consistencia espesa." },
                                  { order: 6, content: "Pelar y cortar las papas." },
                                  { order: 7, content: "Cocer las papas hasta que estén tiernas." },
                                  { order: 8, content: "Machacar las papas hasta obtener un puré rústico. Salpimentar." },
                                  { order: 9, content: "Agregar la mezcla de brócoli y pollo." },
                                  { order: 10, content: "Salpimentar al gusto." },
                                  { order: 11, content: "Mezclar hasta incorporar perfectamente." },
                                  { order: 12, content: "Hacer croquetas y colocar en un sartén con poco aceite, hasta que estén un poco doradas." },
                               ]
                      },
              kit_orders: [
                              {
                                kit_name: "Croquetas de Pollo y Brócoli",
                                user_email: "romina@gmaail.com",
                                check_out_session_id: "pending",
                                amount: 1,
                                status: 0,
                                code: "395729",
                                date_delivery: "2019/12/01 08:00",
                                address_attributes: {
                                                      address: "Rodriguez Peña 1833, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina",
                                                      latitude: -34.589252,
                                                      longitude: -58.387530,
                                                    },
                                review: {
                                          content: "Buenisimo!",
                                          rating: 4,
                                          remote_image_url: "https://www.te.gob.mx/blog/reyes/media/layout/images/img_no_disponible.png"
                                        }
                              },
                            ],
            },
          ]
  },

  {
    brand: {
      name: 'Ristorante La Pineta',
      remote_logo_url: 'https://i.imgur.com/VdMltvq.png'
    },
    restaurants: [
                  {
                    name: 'Ristorante La Pineta',
                    test_mp_public_key: "TEST-063df879-b849-45df-87e0-81ea1f09cea1",
                    test_mp_private_key: "TEST-3734607708209553-120722-b85c11a9716448fb713c3faee5bc9ad9-89640039",
                    prod_mp_public_key: "APP_USR-d8af2308-9b7f-44ef-832a-bbec7b2f12c8",
                    prod_mp_private_key: "APP_USR-3734607708209553-120722-88210b387e49699c64b06a5866b5bd77-89640039",
                    day_open: "Lunes a Viernes de 8:30 a 12:00 hs",

                    phone: "123123123123123",
                    email: "lapiñeta2@gmail.com",
                    remote_image_url: 'https://i.imgur.com/VdMltvq.png',
                    address_attributes: {
                                          address: "Aráoz 2499",
                                          latitude: -34.585781,
                                          longitude: -58.415291,
                                        }
                  },
                ],
    kits: [
            { general_information: {
                                      name: 'Pastel de Platano y Carne de Cerdo',
                                      stock: 20,
                                      price: 2,
                                      size: 1,
                                      preparation_time: 80,
                                      description: 'Un auténtico Pastel de Plátano con Carne, Frijoles y Queso.',
                                      remote_image_url: 'https://i.imgur.com/eHiJ90R.jpg'
                                    },
              cooking_ingredients: [
                                  { quantity: 50, unit: 'g', name: "Cebolla" },
                                  { quantity: 5, unit: 'g', name: "Platanos maduros" },
                                  { quantity: 3, unit: 'g', name: "Diente de ajo" },
                                  { quantity: 300, unit: 'g', name: "Cerdo" },
                                  { quantity: 4, unit: 'g', name: "Perejil" },
                                  { quantity: 4, unit: 'ml', name: "Queso en hebras" },
                                ],
              cooking_cookwares: ["Cuchillo de chef", "Tabla para cortar", "Bowl chico", "Bowl mediano"],
              categories: ["Carne"],
              guides: { video: "vflA4-G6XTo",
                        steps: [
                                  { order: 1, content: "Hervir los plátanos hasta que queden bien cocidos, pelados y en un procesador de alimentos mezclar hasta obtener un puré." },
                                  { order: 2, content: "En un tazón, revolver el puré de plátano con la mitad del queso tipo Turrialba y sal al gusto. Reservar." },
                                  { order: 3, content: "En un sartén a fuego medio, calentar el aceite y freír el chile y cebolla." },
                                  { order: 4, content: "Agregar la carne molida, el sazonador completo y la salsa tipo ranchera. Mezclar hasta que la carne esté bien cocida. Salpimentar a gusto." },
                                  { order: 5, content: "En un recipiente para horno, colocar la mitad del puré de plátano, luego agregar los frijoles molidos, una capa de la carne y otra de puré."},
                                  { order: 6, content: "Cubrir con el queso mozzarella y el resto de queso tipo Turrialba."},
                                  { order: 7, content: "Llevar al horno por 15 minutos a 180 grados hasta que se dore el queso."},
                               ]
                      },
              kit_orders: [
                              {
                                kit_name: "Pastel de Platano y Carne de Cerdo",
                                user_email: "sebastian@gmail.com",
                                check_out_session_id: "pending",
                                amount: 2,
                                status: 3,
                                code: "395729",
                                date_delivery: "2019/11/18 08:00",
                                address_attributes: {
                                                      address: "Virrey Loreto 2901, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina",
                                                      latitude: -34.572843,
                                                      longitude: -58.453644,
                                                    },
                                review: {
                                          content: "Me encanto cocinar el plato con la ayuda de la guia de EasyChef",
                                          rating: 4,
                                          remote_image_url: "https://i.imgur.com/aMWsO8q.jpg"
                                        }
                              },
                            ],
            },
            { general_information: {
                                      name: 'Spaghetti con Salsa de Remolacha',
                                      stock: 0,
                                      price: 360,
                                      size: 1,
                                      preparation_time: 55,
                                      description: 'Con un poco de Nuez y toda la nutrición de la Remolacha, estos Spaghettis son la forma más saludable para disfrutar de una buena pasta.',
                                      remote_image_url: 'https://i.imgur.com/khcIO2Y.png'
                                    },
              cooking_ingredients: [
                                  { quantity: 200, unit: 'g', name: "Spaghetti" },
                                  { quantity: 1, unit: 'u', name: "Diente de ajo" },
                                  { quantity: 10, unit: 'g', name: "Almendras" },
                                  { quantity: 1, unit: 'u', name: "Perejil" },
                                  { quantity: 10, unit: 'mg', name: "Queso rallado" },
                                  { quantity: 3, unit: 'u', name: "Remolacha" },
                                  { quantity: 20, unit: 'ml', name: "Aceite de oliva" },
                                  { quantity: 5, unit: 'mg', name: "Manteca" },
                                ],
              cooking_cookwares: ["Cuchillo de chef", "Tabla para cortar", "Bowl chico", "Bowl mediano"],
              categories: ["Vegetariano", "Los más pedidos"],
              guides: { video: "_3lTroLNN5s",
                        steps: [
                                  { order: 1, content: "Precalentar el horno a 200 ºC y alinear en una hoja de hornear con papel de aluminio." },
                                  { order: 2, content: "Preparar las remolachas quitando las hojas, pero manteniendo un poco en la parte superior para que no se sequen durante el tueste. Enjuagar con agua fría para eliminar cualquier exceso de suciedad." },
                                  { order: 3, content: "Colocar las remolachas en una hoja de papel de aluminio y frotar con aceite de oliva, sazonar con sal y pimienta y colocar en su interior. Verter el agua sobre las remolachas y cerrar la hoja para formar una bolsa. Asar durante 30-40 minutos hasta que estén tiernos pero no se caigan." },
                                  { order: 4, content: "Dejar enfriar ligeramente. Utilizando toallas de papel para proteger sus manos, frotar suavemente las remolachas para quitar las pieles." },
                                  { order: 5, content: "Colocar las remolachas en un procesador de alimentos y pulsar hasta que estén suaves. Añadir la mitad de las almendras, el ajo, la ralladura de limón, el jugo de limón, la mitad del parmesano y sazonar con sal y pimienta. Mezclar y agregar las almendras restantes y el aceite de oliva hasta lograr una consistencia suave."},
                                  { order: 6, content: "Cocinar los espaguetis de acuerdo a las instrucciones del paquete, reservando un ¼-½ de taza del agua de cocción antes de drenar."},
                                  { order: 7, content: "Calentar una cacerola con mantequilla. Agregar el ajo y la chalote, cocinando hasta que estén tiernos. Cortar las hojas y los tallos de la remolacha y agregar a la sartén, cocinando hasta que se marchiten. Agregar la salsa pesto, la pasta y el agua de la pasta (según sea necesario), revolviendo para cubrir."},
                                  { order: 8, content: "Servir caliente con perejil picado, cáscara de limón y parmesano."}
                               ]
                      },
              kit_orders: [
                              {
                                kit_name: "Spaghetti con Salsa de Remolacha",
                                user_email: "fernando@gmail.com",
                                check_out_session_id: "pending",
                                amount: 1,
                                status: 4,
                                code: "395729",
                                date_delivery: "2019/11/18 08:00",
                                address_attributes: {
                                                      address: "Washington 1940, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina",
                                                      latitude: -34.571026,
                                                      longitude: -58.468242,
                                                    },
                                review: {
                                          content: "No soy fanatico de la remolacha, pero me encanto cocinar el plato con la ayuda de la guia de EasyChef",
                                          rating: 3,
                                          remote_image_url: "https://res.cloudinary.com/oreegano/image/upload/c_fill,f_auto,g_center,h_800,q_auto,w_800/v1495762676/isj7k620mbvl2dyzmtqf.jpg"
                                        }
                              },
                              {
                                kit_name: "Spaghetti con Salsa de Remolacha",
                                user_email: "lucia-fernandez@gmaail.com",
                                check_out_session_id: "pending",
                                amount: 1,
                                status: 0,
                                code: "395729",
                                date_delivery: "2019/11/18 08:00",
                                address_attributes: {
                                                      address: "Avenida Cordoba 5443, Buenos Aires, Ciudad Autónoma de Buenos Aires, Argentina",
                                                      latitude: -34.588280,
                                                      longitude: -58.438932,
                                                    },
                                review: {
                                          content: "Excelente calidad de ingredientes",
                                          rating: 4,
                                          remote_image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQKzIspSN93LNxwLR0joWiKWZxYF8ca-bRzHXiTzyIiFBrvag-Z"
                                        }
                              },
                              {
                                kit_name: "Spaghetti con Salsa de Remolacha",
                                user_email: "romina@gmaail.com",
                                check_out_session_id: "pending",
                                amount: 1,
                                status: 3,
                                code: "395729",
                                date_delivery: "2019/11/18 08:00",
                                address_attributes: {
                                                      address: "Avenida Coronel Niceto Vega 4866, Buenos Aires",
                                                      latitude: -34.591930,
                                                      longitude: -58.432318,
                                                    },
                                review: {
                                          content: "BUE-NI-SI-MO, lo volveria a comprar",
                                          rating: 5,
                                          remote_image_url: "https://i.ytimg.com/vi/nbow5w3qccM/hqdefault.jpg"
                                        }
                              },
                          ],
            },
          ]
  },
  {
    brand: {
      name: 'Buenos Aires Rock',
      remote_logo_url: 'https://i.imgur.com/ZuopTOE.png'
    },
    restaurants: [
                    {
                    name: 'Buenos Aires Rock',
                    phone: "123123123123123",
                    test_mp_public_key: "TEST-063df879-b849-45df-87e0-81ea1f09cea1",
                    test_mp_private_key: "TEST-3734607708209553-120722-b85c11a9716448fb713c3faee5bc9ad9-89640039",
                    prod_mp_public_key: "APP_USR-d8af2308-9b7f-44ef-832a-bbec7b2f12c8",
                    prod_mp_private_key: "APP_USR-3734607708209553-120722-88210b387e49699c64b06a5866b5bd77-89640039",
                    day_open: "Lunes a Viernes de 8:30 a 12:00 hs Sábados 13:00 a 15:00 hs",

                    email: "buenosairesrock@bsasrock.com",
                    remote_image_url: 'https://www.xn--ministeriodediseo-uxb.com/ministerio2/wp-content/uploads/2018/03/SPAZIO-Milano_Sala-Bifore1-Brambilla-Serrani-Photographers-1-e1447782553348.jpg',
                    address_attributes: {
                                          address: "Paraguay 3857, Buenos Aires, Ciudad Autónoma de Buenos Aires",
                                          latitude: -34.590727,
                                          longitude: -58.415909,
                                        }
                  },
                ],
    kits: [
            { general_information: {
                name: 'Sandwich de Espinaca',
                stock: 0,
                price: 260,
                size: 1,
                preparation_time: 20,
                description: 'Una opción saludable y deliciosa.',
                remote_image_url: 'https://i.imgur.com/5lzm0Cx.png',
              },
              cooking_ingredients: [
                                      { quantity: 1, unit: 'u', name: "Espinaca" },
                                      { quantity: 1, unit: 'u', name: "Queso en hebras" },
                                      { quantity: 2, unit: 'u', name: "Huevos" },
                                      { quantity: 1, unit: 'g', name: "Diente de ajo" },
                                      { quantity: 4, unit: 'u', name: "Pan integral" },
                                    ],
              cooking_cookwares: ["Cuchillo de chef", "Tabla para cortar", "Bowl chico", "Bowl mediano", "Esterilla"],
              categories: ["Comida rápida", "Los más pedidos"],
              guides: { video: "aEaCZfucmGQ",
                        steps: [
                                { order: 1, content: "Picar la espinaca limpia y llevar a cocinar 1 minuto en una sartén con una cuchara de manteca, agregar los huevos previamente batidos condimentados                 con sal, pimienta, ají molido y ajo en polvo." },
                                { order: 2, content: "Mover con cuchara de madera y cocinar hasta cocinar el huevo" },
                                { order: 3, content: "Dejar enfriar. Unir con la mozzarella rallada y armar los sandwich." },
                                { order: 4, content: "Dorar por ambos lados en un sartén con manteca." },
                               ]
                      }
            }
          ]
  },
]

# puts "NOT creating users"
USERS.each do |user|
  u = User.create!(user)
  # u.remote_avatar_image_url = user[:avatar_image]
  u.save!
end

puts 'creating ingredients'

INGREDIENTS.each do |information|
  ingredient = Ingredient.new(information)
  # ingredient.remote_image_url = information[:image]
  ingredient.save!
end

puts 'creating cookware'

COOKWARES.each do |information|
  cookware = Cookware.new(information)
  # cookware.remote_image_url = cookware[:image]
  cookware.save!
end

puts 'Creating brands'

BRANDS.each do |brand_data|
  puts "- creating brand #{brand_data[:brand][:name]}"
  brand = Brand.create!(brand_data[:brand])
  # b.remote_logo_url = brand[:logo]
  brand.save!

  if !brand_data[:restaurants].nil?
    brand_data[:restaurants].each do |restaurant_information|
      puts "- creating restaurant #{restaurant_information[:name]}"
      restaurant = Restaurant.new(restaurant_information)
      restaurant.brand = brand
      restaurant.user = User.first
      # restaurant.remote_image_url = restaurant_information[:image]
      restaurant.save!


      if !brand_data[:kits].nil?
        brand_data[:kits].each do |kit_info|
          puts '- creating kits'
          kit = Kit.new(kit_info[:general_information])
          kit.restaurant = restaurant
          # kit.remote_image_url = kit[:image]
          kit.save!
          puts 'creating guides'
          guide = Guide.create!(video: kit_info[:guides][:video], kit: kit)
          kit_info[:guides][:steps].each do |step_info|
            puts '- creating steps'
            step = Step.new(step_info)
            step.guide = guide
            step.save!
          end

          puts "- creating kit categories"
          kit_info[:categories].each do |name|
            category = Category.find_by(name: name)
            if category.nil?
              puts "------------------------------------------------------------------------------------"
              puts "---------------- CATEGORY #{name} MISSING ------------------"
              puts "------------------------------------------------------------------------------------"
            else
              KitCategory.create!(kit: kit, category: category)
            end
          end

          kit_info[:cooking_ingredients].each do |cooking_ingredients|
            ingredient = Ingredient.find_by(name: cooking_ingredients[:name])
            puts 'creating kits_ingredients'
            if ingredient.nil?
              puts "------------------------------------------------------------------------------------"
              puts "---------------- INGREDIENT #{cooking_ingredients[:name]} MISSING ------------------"
              puts "------------------------------------------------------------------------------------"
            else
              KitIngredient.create!(quantity: cooking_ingredients[:quantity], unit: cooking_ingredients[:unit], ingredient: ingredient, kit: kit)

            end
          end
          kit_info[:cooking_cookwares].each do |cooking_cookwares|
            puts 'creating kit_cookwares'
            cookware = Cookware.find_by(name: cooking_cookwares)
            if cookware.nil?
              puts "------------------------------------------------------------------------------------"
              puts "---------------- COOKWARES #{cooking_cookwares} MISSING ------------------"
              puts "------------------------------------------------------------------------------------"
            else
              KitCookware.create!(kit: kit, cookware: cookware)
            end
          end
          # kit_info[:kit_orders].each do |kit_order|
          #   puts 'creating kit order'
          #   user = User.find_by(email: kit_order[:user_email])
          #   order = Order.create!(kit: kit, user: user, code: "#{kit.id}-#{user.id}-#{rand(0..1000000)}",  date_delivery: kit_order[:date_delivery], amount: kit_order[:amount], status: kit_order[:status], address_attributes: kit_order[:address_attributes])
          #   puts "Creating review for order #{order.id}. (content: #{kit_order[:review][:content]})"
          #   review = Review.create!(order: order, content: kit_order[:review][:content], rating: kit_order[:review][:rating], remote_image_url: kit_order[:review][:remote_image_url])
          # end
        end
      end
    end
  end

end
