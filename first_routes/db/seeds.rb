# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Artwork.destroy_all
Comment.destroy_all

michelle = User.create!(username: "michelle")
art1 = Artwork.create!(artist_id: michelle.id, title: "title1", image_url: "my_url1")

theo = User.create!(username: "theo")
art2 = Artwork.create!(artist_id: theo.id, title: "title2", image_url: "my_url2")


jet = User.create!(username: "jet")
art3 = Artwork.create!(artist_id: jet.id, title: "title3", image_url: "my_url3")

ashley = User.create!(username: "ashley")
art4 = Artwork.create!(artist_id: ashley.id, title: "title4", image_url: "my_url4")

comment1 = Comment.create!(author_id: michelle.id, artwork_id: art2.id, body: "hello")
comment2 = Comment.create!(author_id: michelle.id, artwork_id: art3.id, body: "hello world")
comment3 = Comment.create!(author_id: theo.id, artwork_id: art2.id, body: "hey")