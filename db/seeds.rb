# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

poll = Poll.create!(question: "What's your favorite programming language?")
poll.options.create!(text: "Ruby")
poll.options.create!(text: "JavaScript")
poll.options.create!(text: "Python")
poll.options.create!(text: "Go")
poll.options.create!(text: "Other")

poll2 = Poll.create!(question: "What's your favorite kind of pizza?")
poll2.options.create!(text: "Margherita")
poll2.options.create!(text: "Pepperoni")
poll2.options.create!(text: "Hawaiian")
poll2.options.create!(text: "Four Cheese")
poll2.options.create!(text: "Other")

poll3 = Poll.create!(question: "What's your favorite summer vacation destination?")
poll3.options.create!(text: "Spain")
poll3.options.create!(text: "Mexico")
poll3.options.create!(text: "Greece")
poll3.options.create!(text: "Italy")
poll3.options.create!(text: "Other")



