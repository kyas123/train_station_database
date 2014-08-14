require 'spec_helper'
require 'pry'

describe Stops do
  it 'initializes an instance of Stops' do
  test_station = Train_stations.new({:location => "A"})
  test_line =  Train_lines.new({:name => "Blue"})
  test_station.save
  test_line.save
  test_stop = Stops.new({:station_id => test_station.id, :train_id => test_line.id})
  expect(test_stop).to be_an_instance_of Stops
  end

  it 'displays the initialized attributes ' do
    test_station = Train_stations.new({:location => "A"})
    test_line =  Train_lines.new({:name => "Blue"})
    test_station.save
    test_line.save
    test_stop = Stops.new({:station_id => test_station.id, :train_id => test_line.id})
    expect(test_stop.station_id).to eq test_station.id
    expect(test_stop.train_id).to eq test_line.id
  end

  it 'creates a list of stops'  do
    expect(Stops.all).to eq []
  end

  it 'adds/saves multiple stops'  do
  test_station = Train_stations.new({:location => "A"})
  test_line =  Train_lines.new({:name => "Blue"})
  test_station.save
  test_line.save
  test_stop = Stops.new({:station_id => test_station.id, :train_id => test_line.id})
  test_stop.save
  test_station2 = Train_stations.new({:location => "B"})
  test_line2 =  Train_lines.new({:name => "Green"})
  test_station2.save
  test_line2.save
  test_stop2 = Stops.new({:station_id => test_station2.id, :train_id => test_line2.id})
  test_stop2.save
    expect(Stops.all).to eq [test_stop, test_stop2]
  end

  it 'sets two lines that have the same name as equal' do
     test_stop= Stops.new({:station_id => "A", :train_id => "blue"})
    test_stop2 = Stops.new({:station_id => "A", :train_id => "blue"})
    expect(test_stop).to eq test_stop2
  end
end

