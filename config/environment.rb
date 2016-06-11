# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
config.consider_all_requests_local = true
ActiveRecord::RecordNotFound => 404 (page not found)
nil.method => 500 (server error) unless you turn off whiny nils
ActionController::RoutingError => 404 (page not found)
