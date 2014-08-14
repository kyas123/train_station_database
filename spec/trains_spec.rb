require 'spec_helper'

describe Trains do
  it 'initializes an instance of Trains' do
  train = Trains.new({:stops => "A"})
  expect(train).to be_an_instance_of Trains
  end

  it 'displays the train stops' do
    train = Trains.new({:stops =>"A"})
    expect(train.stops).to eq "A"
    end

end
