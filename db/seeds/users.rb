#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "artist@artist.com", password: "abc123", password_confirmation: "abc123", name: "Devastador", artist: true)
User.create(email: "user@user.com", password: "abc123", password_confirmation: "abc123", name: "User", artist: false)