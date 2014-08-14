require 'spec_helper'

describe Stops do
  it 'initializes an instance of Stops' do
  test_stop = Stops.new({:stop_location => "A", :train_name => "blue"})
  expect(test_stop).to be_an_instance_of Stops
  end

  it 'displays the initialized attributes ' do
    test_stop = Stops.new({:stop_location => "A", :train_name => "blue"})
    expect(test_stop.stop_location).to eq "A"
    expect(test_stop.train_name).to eq "blue"
  end

  it 'creates a list of stops'  do
    expect(Stops.all).to eq []
  end

  it 'adds/saves train lines'  do
    test_stop = Stops.new({:stop_location => "A", :train_name => "blue"})
    test_stop2 = Stops.new({:stop_location => "B", :train_name => "green"})
    test_stop.save
    test_stop2.save
    expect(Stops.all).to eq [test_stop, test_stop2]
  end

  it 'sets two lines that have the same name as equal' do
     test_stop= Stops.new({:stop_location => "A", :train_name => "blue"})
    test_stop2 = Stops.new({:stop_location => "A", :train_name => "blue"})
    expect(test_stop).to eq test_stop2
  end
end

