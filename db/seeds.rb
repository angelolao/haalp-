# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

titles = ["Babysitter", "House Cleaning", "Furniture Assemble", "Backyard Work", "Gardening", "Plumbing", "Computer Fixing", "Fix Appliance", "Car Cleaning", "Furniture Moving"]
status = %w(open)
locations = ["Taguig City", "Makati City", "Quezon City"]

10.times do |i|
  Task.create!(
    user_id: 1,
    status: status.sample,
    title: titles[i],
    category_ids: rand(0..7).to_s,
    due_date: DateTime.current + 1.week,
    description: "This a description example for #{titles[i]}. The quick brown fox jumps over the lazy dog.",
    price: rand(500..1000),
    worker_number: 1,
    location: locations.sample
  )
end

10.times do |i|
  Task.create!(
    user_id: 1,
    status: "completed",
    title: titles[i],
    category_ids: rand(0..7).to_s,
    due_date: DateTime.current + 1.week,
    description: "This a description example for #{titles[i]}. The quick brown fox jumps over the lazy dog.",
    price: rand(500..1000),
    worker_number: 1,
    location: locations.sample
  )
end
