

puts 'Creating restaurants...'
5.times do
  restaurant = Restaurant.new(
    name:    Faker::Games::LeagueOfLegends.champion,
    address: "#{Faker::Games::LeagueOfLegends.location}",
    category: %w[chinese italian french japanese french belgian].sample,
    phone_number: Faker::PhoneNumber.cell_phone
  )
  restaurant.save!
end
puts 'Finished!'