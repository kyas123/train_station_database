require 'spec_helper'

describe Train_lines do
  it 'initializes an instance of Train_lines' do
  test_lines = Train_lines.new({:name => "blue"})
  expect(test_lines).to be_an_instance_of Train_lines
  end

  it 'displays the train linesname' do
    test_lines = Train_lines.new({:name =>"blue"})
    expect(test_lines.name).to eq "blue"
  end

  it 'creates a list of train lines'  do
    expect(Train_lines.all).to eq []
  end

  it 'adds/saves train lines'  do
    test_lines = Train_lines.new({:name =>"blue"})
    test_lines2 = Train_lines.new({:name =>"green"})
    test_lines.save
    test_lines2.save
    expect(Train_lines.all).to eq [test_lines, test_lines2]
  end

  it 'sets two lines that have the same name as equal' do
     test_lines= Train_lines.new({:name =>"blue"})
    test_lines2 = Train_lines.new({:name =>"blue"})
    expect(test_lines).to eq test_lines2
  end
end
