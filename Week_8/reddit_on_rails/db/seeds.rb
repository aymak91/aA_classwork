# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'

User.destroy_all
Sub.destroy_all
Post.destroy_all

puts "Creating Users..."
users = (0...10).map do
    User.create!(
        username: Faker::Name.first_name, 
        password: "123456")
end

puts "Creating Subs..."
subs = (0...10).map do
    Sub.create!(
      title: Faker::Beer.style, 
      description: "ABV: #{Faker::Beer.alcohol}, IBU: #{Faker::Beer.ibu}",
      moderator_id: users.sample.id
    )
end

puts "Creating Posts..."
posts = (0...10).map do
    Post.create!(
        title: Faker::TvShows::Simpsons.character,
        url: Faker::Internet.domain_name(subdomain: true),
        content: Faker::TvShows::Simpsons.quote,
        author_id: users.sample.id
    )
end

puts "Creating PostsSubs..."
20.times do
    PostsSub.create!(
        post_id: posts.sample.id,
        sub_id: subs.sample.id
    )
end