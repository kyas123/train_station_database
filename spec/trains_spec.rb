require 'spec_helper'

describe Train_stations do
  it 'initializes an instance of Train_stations' do
  test_station = Train_stations.new({:location => "A"})
  expect(test_station).to be_an_instance_of Train_stations
  end

  it 'displays the train station location' do
    test_station = Train_stations.new({:location =>"A"})
    expect(test_station.location).to eq "A"
  end

  it 'creates a list of train stations'  do
    expect(Train_stations.all).to eq []
  end

  it 'adds/saves train stations'  do
    test_station = Train_stations.new({:location =>"A"})
    test_station2 = Train_stations.new({:location =>"B"})
    test_station.save
    test_station2.save
    expect(Train_stations.all).to eq [test_station, test_station2]
  end

  it 'sets two stations that have the same name as equal' do
     test_station = Train_stations.new({:location =>"A"})
    test_station2 = Train_stations.new({:location =>"A"})
    expect(test_station).to eq test_station2
  end
end
