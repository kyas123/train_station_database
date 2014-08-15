require 'spec_helper'

describe TrainStation do
  it 'initializes an instance of TrainStation' do
  test_station = TrainStation.new({:location => "A"})
  expect(test_station).to be_an_instance_of TrainStation
  end

  it 'displays the train station location' do
    test_station = TrainStation.new({:location =>"A"})
    expect(test_station.location).to eq "A"
  end

  it 'creates a list of train stations'  do
    expect(TrainStation.all).to eq []
  end

  it 'adds/saves train stations'  do
    test_station = TrainStation.new({:location =>"A"})
    test_station2 = TrainStation.new({:location =>"B"})
    test_station.save
    test_station2.save
    expect(TrainStation.all).to eq [test_station, test_station2]
  end

  it 'sets two stations that have the same name as equal' do
     test_station = TrainStation.new({:location =>"A"})
    test_station2 = TrainStation.new({:location =>"A"})
    expect(test_station).to eq test_station2
  end

  it "sees all of a train's stops" do
    test_station = TrainStation.new({:location => "A"})
    test_line =  TrainLine.new({:name => "Blue"})
    test_station.save
    test_line.save
    test_stop = Stop.new({:station_id => test_station.id, :train_id => test_line.id})
    test_stop.save
    test_station2 = TrainStation.new({:location => "B"})
    # test_line2 =  TrainLine.new({:name => "Blue"})
    test_station2.save
    # test_line2.save
    test_stop2 = Stop.new({:station_id => test_station2.id, :train_id => test_line.id})
    test_stop2.save
    stop_list = test_line.stops
    # binding.pry
    expect(stop_list.map {|stop| stop["location"]}).to eq [test_station.location, test_station2.location]
  end
end
