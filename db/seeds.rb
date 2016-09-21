# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# TODO: Seed agenda items from API from today to next week.
# https://toronto-ocd-api.herokuapp.com/events/?start_time__gte=2016-09-21&start_time__lte=2016-09-38

require 'csv'

puts "Seeding Agenda Item records..."
csv_file = File.join Rails.root, 'db/data/agenda_items.csv'
CSV.foreach(csv_file, headers: true) do |row|
  data = {
    title: row['title'],
    meeting_date: Date.parse(row['meeting_date']),
    identifier: row['identifier'],
    organization: row['organization'],
  }
  AgendaItem.create data
end
