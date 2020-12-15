Faker::Config.locale = 'fr'

User.delete_all
Garden.delete_all
Post.delete_all
Tag.delete_all
PostComment.delete_all
GardenComment.delete_all
Climate.delete_all
GardenType.delete_all
Location.delete_all
Country.delete_all
Follow.delete_all
Event.delete_all
Testimony.delete_all
GardenTag.delete_all
PostTag.delete_all

User.reset_pk_sequence
Garden.reset_pk_sequence
Post.reset_pk_sequence
Tag.reset_pk_sequence
PostComment.reset_pk_sequence
GardenComment.reset_pk_sequence
Climate.reset_pk_sequence
GardenType.reset_pk_sequence
Location.reset_pk_sequence
Country.reset_pk_sequence
Follow.reset_pk_sequence
Event.reset_pk_sequence
Testimony.reset_pk_sequence
GardenTag.reset_pk_sequence
PostTag.reset_pk_sequence

# ARRAYS
climate_array = ["Tropical", "Méditerranéen", "Continental"]
garden_type_array = ["Urbain", "Rural"]

# USER
10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "azerty",
    password_confirmation: "azerty",
    is_admin: false
  )
  user.email = user.first_name + "@yopmail.com"
  user.username = user.first_name.downcase + "_" + user.last_name.downcase
  user.save
  puts "user #{user.id} created"
end

User.create(first_name: "Fli",
  last_name: "bustier",
  username: "flibusrier",
  email: "flibustier@yopmail.com",
  password: "azerty",
  password_confirmation: "azerty",
  is_admin: true
)
puts "Flibustier created"

# CLIMATE
i=0
3.times do
  Climate.create(
    name: climate_array[i]
  )
  i+=1
end

# COUNTRY
3.times do
  Country.create(
  name: Faker::Address.country 
  )
end

# LOCATION
3.times do
  Location.create(
    name: Faker::Address.city,
    lat: Faker::Address.latitude,
    long: Faker::Address.longitude,
    country: Country.all.sample
  )
end

# GARDEN TYPE
j=0
2.times do
  GardenType.create(
    name: garden_type_array[j]
  )
  j+=1
end

# GARDEN
20.times do
  garden = Garden.create(
    name: Faker::Games::Minecraft.biome,
    area: rand(1..150),
    user: User.all.sample,
    location: Location.all.sample,
    climate: Climate.all.sample,
    garden_type: GardenType.all.sample,
    description: Faker::Books::Dune.quote
  )
  puts "Garden #{garden.id} created"
end

# TAG
5.times do
  Tag.create(
    name: Faker::Space.constellation
  )
end

# POST
15.times do
  Post.create(
    title: Faker::Space.galaxy,
    content: Faker::Books::Dune.quote,
    garden: Garden.all.sample
  )
end

# GARGEN TAG
20.times do
    GardenTag.create(
      garden: Garden.all.sample,
      tag: Tag.all.sample
    )
end

# POST TAG
10.times do
  PostTag.create(
    post: Post.all.sample,
    tag: Tag.all.sample
  )
end

# GARDEN COMMENT
30.times do
  GardenComment.create(
    content: Faker::Lorem.sentences,
    user: User.all.sample,
    garden: Garden.all.sample
  )
end

# POST COMMENT
30.times do
  PostComment.create(
    content: Faker::Lorem.sentences,
    user: User.all.sample,
    post: Post.all.sample
  )
end

# FOLLOW
30.times do
  follow = Follow.create(
    user: User.all.sample,
    garden: Garden.all.sample
  )
  puts "Follow #{follow.id} created"
end

# EVENT
50.times do
  Event.create(
    name:Faker::Lorem.sentence,
    description: Faker::Lorem.sentences,
    garden: Garden.all.sample,
    start_date: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :all),
    end_date: Faker::Time.between_dates(from: Date.today + 2, to: Date.today + 5, period: :all)
  )
end

# TESTIMONY
5.times do
  Testimony.create(
    content: Faker::Lorem.sentences,
    user: User.all.sample
  )
end

# GARDEN LIKE
30.times do
  gardenlike = GardenLike.create(
    user: User.all.sample,
    garden: Garden.all.sample
  )
  puts "GardenLike #{gardenlike.id} created"
end