require 'rspec'
require 'pg'
require 'train_stations'
require 'train_lines'
require 'stops'

DB = PG.connect(:dbname => 'train_system')

RSpec.configure do |config|
  config.before(:each) do
  DB.exec("DELETE FROM train_stations *;")
  DB.exec("DELETE FROM train_lines *;")
  DB.exec("DELETE FROM stops *;")

  end
end
