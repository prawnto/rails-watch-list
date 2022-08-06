# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"

api_url = "https://tmdb.lewagon.com/movie/top_rated"

movies_serialized = URI.open(api_url).read
movies = JSON.parse(movies_serialized)
# movies is an array, ["results"] is a hash of arrays

puts "Cleaning database..."
Bookmark.destroy_all
Movie.destroy_all

puts "Creating movies.."
movies["results"].each do |result|
  movie = Movie.create!(
    title: result["title"],
    overview: result["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{result["poster_path"]}",
    rating: result["vote_average"]
  )
  puts "Created #{movie.title}"
end

puts "Finished"
