require 'rspec'
require 'pg'
require 'trains'

DB = PG.connect(:dbname => 'train_system')

RSpec.configure do |config|
  config.after(:each) do
  DB.exec("DELETE FROM trains *;")
  end
end
