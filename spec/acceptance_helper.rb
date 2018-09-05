require 'rails_helper'
require 'rspec_api_documentation'
require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
  config.format = %i[json combined_text html]
  config.curl_host = 'https://quiet-stream-12356.herokuapp.com'
  config.api_name = "Questions & Answers API"
  config.api_explanation = "API for getting questions and answers"
end
