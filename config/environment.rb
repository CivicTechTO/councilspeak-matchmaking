# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.config.action_mailer.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => 25,
  :domain => "example.com",
  :authentication => :plain,
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
}
