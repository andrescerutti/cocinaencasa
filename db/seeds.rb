puts "-"*30
puts "Deleting users"
User.destroy_all
puts "Deleting brands"
Brand.destroy_all
puts "Deleting restaurants"
Restaurant.destroy_all
puts "Deleting addresses"
Address.destroy_all
puts "Deleting stores"
Store.destroy_all
puts "Deleting kits"
Kit.destroy_all
puts "Deleting categories"
Category.destroy_all
puts "Deleting relations between kits and categories"
KitCategory.destroy_all
puts "Deleting guides"
Guide.destroy_all


puts "-"*30
puts "Start seeding the DB"
puts "-"*30
puts "Creating users"
andres = User.create!(
  email: 'andres@cocinaencasa.com.ar', 
  password: 'cocinaencasa', 
  first_name: 'andres', 
  last_name: 'cerutti', 
  phone:'2604404465'
)
alejo = User.create!(
  email: 'alejo@cocinaencasa.com.ar', 
  password: 'cocinaencasa', 
  first_name: 'alejo', 
  last_name: 'gonzales', 
  phone:'2604404465'
)
gaspar = User.create!(
  email: 'gaspar@cocinaencasa.com.ar', 
  password: 'cocinaencasa', 
  first_name: 'gaspar', 
  last_name: 'baldunciel', 
  phone:'2604404465'
)
sebastian = User.create!(
  email: 'sebastian@cocinaencasa.com.ar', 
  password: 'cocinaencasa', 
  first_name: 'sebastian', 
  last_name: 'sempe', 
  phone:'2604404465'
)

puts "-"*30
puts "Creating brands"
fabric = Brand.create!(
  name:'Fabric Sushi', 
  logo: 'https://res.cloudinary.com/cocina-en-casa/image/upload/v1590589781/CEVICHE_mtcuhe.png'
)
kansas = Brand.create!(
  name:'Kansas', 
  logo:'https://res.cloudinary.com/cocina-en-casa/image/upload/v1590590248/take_a_coffe_snze5z.png'
)
foodtrack = Brand.create!(
  name: 'The Food Track Store', 
  logo: 'https://res.cloudinary.com/cocina-en-casa/image/upload/v1590590249/homebar_njlyou.png'
)
laparolaccia = Brand.create!(
  name: 'La Parolaccia', 
  logo:'https://res.cloudinary.com/cocina-en-casa/image/upload/v1590384711/hiiiibondi_ojku4x_rs1vej.png'
)

puts "-"*30
puts "Creating restaurants"
kpalermo = Restaurant.create!(
  user_id: andres.id, 
  name: 'Kansas Palermo', 
  image:'https://media-cdn.tripadvisor.com/media/photo-s/09/a3/8f/b1/kansas-1-largejpg.jpg', 
  brand_id: kansas.id, 
  email:'kansas@mail.com', 
  phone:'123123'
)
kpilar = Restaurant.create!(
  user_id: andres.id, 
  name: 'Kansas Pilar', 
  image:'https://kansasgrillandbar.com.ar/gfx/tmp/lo_slide_06b.jpg', 
  brand_id: kansas.id, 
  email:'@mail.com', 
  phone:'123123'
)
fbelgrano = Restaurant.create!(
  user_id: alejo.id, 
  name: 'Fabric Sushi Belgrano', 
  image:'https://media-cdn.tripadvisor.com/media/photo-s/10/73/40/47/fachada-sobre-ciudad.jpg', 
  brand_id: fabric.id, 
  email:'fabric1@mail.com', 
  phone:'123123'
)
fvilla = Restaurant.create!(
  user_id: alejo.id, 
  name: 'Fabric Sushi Villa Urquiza', 
  image:'https://restorando-res.cloudinary.com/image/upload/c_fill,f_auto,g_auto,h_174,q_auto:eco,w_305/v1/restaurant_photos/l//13427/127584/restaurante_fabric-villa-urquiza_villa-urquiza_23004746_1904846489555736_5734207852698321964_o.jpg', 
  brand_id: fabric.id, 
  email:'fabric2@mail.com', 
  phone:'123123'
)
tfts = Restaurant.create!(
  user_id: gaspar.id, 
  name: 'The Food Track Store Retiro', 
  image:'https://media-cdn.tripadvisor.com/media/photo-s/09/df/c6/e5/the-food-truck-store.jpg', 
  brand_id: foodtrack.id, 
  email:'foodtrack1@mail.com', 
  phone:'123123'
)
laparo = Restaurant.create!(
  user_id: andres.id, 
  name: 'La Parolaccia Puerto Madero', 
  image:'https://www.restaurantpremium.com/uploads/1/0/8/2/108296609/83-2.jpg', 
  brand_id: laparolaccia.id, 
  email:'laparolaccia1@mail.com', 
  phone:'123123'
)

puts "-"*30
puts "Creating addresses"
add1 = Address.create!(
  address: 'Virrey Loreto 1721, 
  Buenos Aires, 
  Argentina', 
  addressable_type:'Restaurant', 
  addressable_id:kpalermo.id, 
  latitude: -34.598032, 
  longitude: -58.372203
)
add2 = Address.create!(
  address: 'Av. Boedo 1601, 
  C1239 AAG, 
  Buenos Aires', 
  addressable_type:'Restaurant', 
  addressable_id:kpalermo.id, 
  latitude: -34.632701, 
  longitude: -58.416145
)
add3 = Address.create!(
  address: 'Gral. José Gervasio Artigas 1372, 
  Buenos Aires', 
  addressable_type:'Restaurant', 
  addressable_id:kpalermo.id, 
  latitude: -34.614922, 
  longitude:-58.470926
)
add4 = Address.create!(
  address: 'B1824HMF, 
  Yatay 309, 
  B1824HMF Valentín Alsina, 
  Buenos Aires', 
  addressable_type:'Restaurant', 
  addressable_id:kpalermo.id, 
  latitude:-34.664534, 
  longitude: -58.409495)
  add5 = Address.create!(
  address: 'Virrey Loreto 1721, 
  Buenos Aires, 
  Argentina', 
  addressable_type:'Restaurant', 
  addressable_id:kpalermo.id, 
  latitude: -34.598032, 
  longitude: -58.372203)
  add6 = Address.create!(
  address: 'Virrey Loreto 1721, 
  Buenos Aires, 
  Argentina', 
  addressable_type:'Restaurant', 
  addressable_id:kpalermo.id, 
  latitude:-34.664534, 
  longitude: -58.409495
)

puts "-"*30
puts "Creating stores"
s1 = Store.create!(
  restaurant_id: kpalermo.id, 
  name: 'Benavidez', 
  sunday: false, 
  monday: false, 
  tuesday: false, 
  wednesday: false, 
  thursday: false, 
  friday: false, 
  saturday: true, 
  addressable_type: 'Store', 
  addressable_id: add1, 
  next_day_hour: 19.0, 
  day_for_order: 1.0, 
  flags: 'popular', 
  pick_up: false, 
  polygon: '', 
  accepts_cash: true, 
  discount: 0.0, 
  ready_made: false
)
s2 = Store.create!(
  restaurant_id: kpilar.id, 
  name: 'Benavidez', 
  sunday: false, 
  monday: false, 
  tuesday: false, 
  wednesday: false, 
  thursday: false, 
  friday: false, 
  saturday: true, 
  addressable_type: 'Store', 
  addressable_id: add2, 
  next_day_hour: 19.0, 
  day_for_order: 1.0, 
  flags: 'popular', 
  pick_up: false, 
  polygon: '', 
  accepts_cash: true, 
  discount: 0.0, 
  ready_made: false
)
s3 = Store.create!(
  restaurant_id: fbelgrano.id, 
  name: 'Benavidez', 
  sunday: false, 
  monday: false, 
  tuesday: false, 
  wednesday: false, 
  thursday: false, 
  friday: false, 
  saturday: true, 
  addressable_type: 'Store', 
  addressable_id: add3, 
  next_day_hour: 19.0, 
  day_for_order: 1.0, 
  flags: 'popular', 
  pick_up: false, 
  polygon: '', 
  accepts_cash: true, 
  discount: 0.0, 
  ready_made: false
)
s4 = Store.create!(
  restaurant_id: fvilla.id, 
  name: 'Benavidez', 
  sunday: false, 
  monday: false, 
  tuesday: false, 
  wednesday: false, 
  thursday: false, 
  friday: false, 
  saturday: true, 
  addressable_type: 'Store', 
  addressable_id: add4, 
  next_day_hour: 19.0, 
  day_for_order: 1.0, 
  flags: 'popular', 
  pick_up: false, 
  polygon: '', 
  accepts_cash: true, 
  discount: 0.0, 
  ready_made: false
)
s5 = Store.create!(
  restaurant_id: tfts.id, 
  name: 'Benavidez', 
  sunday: false, 
  monday: false, 
  tuesday: false, 
  wednesday: false, 
  thursday: false, 
  friday: false, 
  saturday: true, 
  addressable_type: 'Store', 
  addressable_id: add5, 
  next_day_hour: 19.0, 
  day_for_order: 1.0, 
  flags: 'popular', 
  pick_up: false, 
  polygon: '', 
  accepts_cash: true, 
  discount: 0.0, 
  ready_made: false
)
s6 = Store.create!(
  restaurant_id: laparo.id, 
  name: 'Benavidez', 
  sunday: false, 
  monday: false, 
  tuesday: false, 
  wednesday: false, 
  thursday: false, 
  friday: false, 
  saturday: true, 
  addressable_type: 'Store', 
  addressable_id: add6, 
  next_day_hour: 19.0, 
  day_for_order: 1.0, 
  flags: 'popular', 
  pick_up: false, 
  polygon: '', 
  accepts_cash: true, 
  discount: 0.0, 
  ready_made: false
)

puts "-"*30
puts "Creating kits"
k1 = Kit.create!(
  name: 'Kansas kit 1', 
  stock: 15, 
  price: 1990, 
  size: 4, 
  preparation_time: '15', 
  image: 'https://res.cloudinary.com/cocina-en-casa/image/upload/v1590589927/imlf7qt7vncdcfs0qdff_lwjvin.jpg', 
  description: 'Experiencia recomendada para 4 personas.', 
  restaurant_id: kpalermo.id, 
  priority: 0, 
  tags: 'popular', 
  difficulty: 'fácil', 
  slug: 'k-kit-1'
)
k2 = Kit.create!(
  name: 'Kansas kit 2', 
  stock: 15, 
  price: 1990, 
  size: 4, 
  preparation_time: '15', 
  image: 'https://res.cloudinary.com/cocina-en-casa/image/upload/v1590589927/imlf7qt7vncdcfs0qdff_lwjvin.jpg', 
  description: 'Experiencia recomendada para 4 personas.', 
  restaurant_id: kpilar.id, 
  priority: 0, 
  tags: 'popular', 
  difficulty: 'fácil', 
  slug: 'k-kit-2'
)
k3 = Kit.create!(
  name: 'Fabric kit 1', 
  stock: 15, 
  price: 1990, 
  size: 4, 
  preparation_time: '15', 
  image: 'https://res.cloudinary.com/cocina-en-casa/image/upload/v1590589927/imlf7qt7vncdcfs0qdff_lwjvin.jpg', 
  description: 'Experiencia recomendada para 4 personas.', 
  restaurant_id: fbelgrano.id, 
  priority: 0, 
  tags: 'popular', 
  difficulty: 'fácil', 
  slug: 'f-kit-1'
)
k4 = Kit.create!(
  name: 'Food track kit 1', 
  stock: 15, 
  price: 1990, 
  size: 4, 
  preparation_time: '15', 
  image: 'https://res.cloudinary.com/cocina-en-casa/image/upload/v1590589927/imlf7qt7vncdcfs0qdff_lwjvin.jpg', 
  description: 'Experiencia recomendada para 4 personas.', 
  restaurant_id: tfts.id, 
  priority: 0, 
  tags: 'popular', 
  difficulty: 'fácil', 
  slug: 'ft-kit-1'
)
k5 = Kit.create!(
  name: 'Fabric kit 2', 
  stock: 15, 
  price: 1990, 
  size: 4, 
  preparation_time: '15', 
  image: 'https://res.cloudinary.com/cocina-en-casa/image/upload/v1590589927/imlf7qt7vncdcfs0qdff_lwjvin.jpg', 
  description: 'Experiencia recomendada para 4 personas.', 
  restaurant_id: fvilla.id, 
  priority: 0, 
  tags: 'popular', 
  difficulty: 'fácil', 
  slug: 'f-kit-2'
)
k6 = Kit.create!(
  name: 'La paro kit 1', 
  stock: 15, 
  price: 1990, 
  size: 4, 
  preparation_time: '15', 
  image: 'https://res.cloudinary.com/cocina-en-casa/image/upload/v1590589927/imlf7qt7vncdcfs0qdff_lwjvin.jpg', 
  description: 'Experiencia recomendada para 4 personas.', 
  restaurant_id: laparo.id, 
  priority: 0, 
  tags: 'popular', 
  difficulty: 'fácil', 
  slug: 'l-kit-1'
)

puts "-"*30
puts "Creating categories"
c1 = Category.create!(
  name: 'Vegano',
  image: 'https://res.cloudinary.com/cocina-en-casa/image/upload/v1590690245/vegano_ckjgu0.jpg'
)

puts "-"*30
puts "Creating relations between kits and categories"
kc1 = KitCategory.create!(
  category_id: c1.id, 
  kit_id: k1.id
)
kc2 = KitCategory.create!(
  category_id: c1.id, 
  kit_id: k2.id
)
kc3 = KitCategory.create!(
  category_id: c1.id, 
  kit_id: k3.id
)

puts "-"*30
puts "Creating guides"
g1 = Guide.create!(
  kit_id: k1.id, 
  video: 'PeFJlk8eOhQ'
)
g2 = Guide.create!(
  kit_id: k2.id, 
  video: 'PeFJlk8eOhQ'
)
g3 = Guide.create!(
  kit_id: k3.id, 
  video: 'PeFJlk8eOhQ'
)
g4 = Guide.create!(
  kit_id: k4.id, 
  video: 'PeFJlk8eOhQ'
)
g5 = Guide.create!(
  kit_id: k5.id, 
  video: 'PeFJlk8eOhQ'
)
g6 = Guide.create!(
  kit_id: k6.id, 
  video: 'PeFJlk8eOhQ'
)
