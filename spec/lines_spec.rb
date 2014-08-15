require 'spec_helper'
require 'pry'
describe TrainLine do
  it 'initializes an instance of TrainLine' do
  test_lines = TrainLine.new({:name => "blue"})
  expect(test_lines).to be_an_instance_of TrainLine
  end

  it 'displays the train linesname' do
    test_lines = TrainLine.new({:name =>"blue"})
    expect(test_lines.name).to eq "blue"
  end

  it 'creates a list of train lines'  do
    expect(TrainLine.all).to eq []
  end

  it 'adds/saves train lines'  do
    test_lines = TrainLine.new({:name =>"blue"})
    test_lines2 = TrainLine.new({:name =>"green"})
    test_lines.save
    test_lines2.save
    expect(TrainLine.all).to eq [test_lines, test_lines2]
  end

  it 'sets two lines that have the same name as equal' do
    test_lines= TrainLine.new({:name =>"blue"})
    test_lines2 = TrainLine.new({:name =>"blue"})
    expect(test_lines).to eq test_lines2
  end

  it "sees all of trains that come to one stop" do
    test_station = TrainStation.new({:location => "A"})
    test_line =  TrainLine.new({:name => "Blue"})
    test_station.save
    test_line.save
    test_stop = Stop.new({:station_id => test_station.id, :train_id => test_line.id})
    test_stop.save
    test_line2 =  TrainLine.new({:name => "Green"})
    test_line2.save
    test_stop2 = Stop.new({:station_id => test_station.id, :train_id => test_line2.id})
    test_stop2.save
    stop_list = test_station.stops
    binding.pry
    expect(stop_list.map {|stop| stop["name"]}).to eq [test_line.name, test_line2.name]
  end
end
