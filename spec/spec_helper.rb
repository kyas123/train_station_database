require 'rspec'
require 'pg'
require 'train_stations'

DB = PG.connect(:dbname => 'train_system')

RSpec.configure do |config|
  config.after(:each) do
  DB.exec("DELETE FROM train_stations *;")
  end
end
