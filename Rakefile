# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require "date"
require "json"
require "net/http"

require_relative 'config/application'

Rails.application.load_tasks

namespace :db do
  desc 'Import upcoming agenda items from OCD API'
  task :import_agenda_items => :environment do
    today = Date.today.strftime "%Y-%m-%d"
    api_base_url = "https://toronto-ocd-api.herokuapp.com"
    url = "#{api_base_url}/events/?fields=agenda,start_time,status,name&sort=start_time&start_time__gte=#{today}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)

    raise 'TODO: Implement pagination support' if response['meta']['total_count'] > 100

    events = response['results']
    events.each do |event|
      next if event['status'] == 'cancelled'

      event['agenda'].each do |item|
        data = {
          title: item['description'],
          meeting_date: Date.parse(event['start_time']),
          identifier: item['related_entities'].first['entity_name'],
          organization: event['name'],
        }
        record = AgendaItem.new data
        # Skip if not unique by identifier + meeting_date
        next unless record.valid?

        puts "Adding new agenda item: #{data}"
        record.save!
      end
    end
  end
end
