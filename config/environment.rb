# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['HB_EMAIL_USERNAME'],
  :password => ENV['HB_EMAIL_PASSWORD'],
  :domain => ENV['HB_EMAIL_DOMAIN'],
  :address => ENV['HB_EMAIL_SMTP_ADDRESS'],
  :port => ENV['HB_EMAIL_SMTP_PORT'],
  :authentication => :plain,
  :enable_starttls_auto => true
}
