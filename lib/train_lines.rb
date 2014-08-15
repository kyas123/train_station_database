require 'pry'
class TrainLine
attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end


  def self.all
    @train_lines = []
    results = DB.exec("SELECT * FROM train_lines;")
    results.each  do |result|
      @train_lines << TrainLine.new({:name => result['name']})
    end
    @train_lines
  end


  def save
    results = DB.exec("INSERT INTO train_lines(name)
      VALUES ('#{@name}') RETURNING id;")

      @id = results.first['id'].to_i
  end

  def ==(another_line)
    self.name == another_line.name
  end


  def stops
    train_stops = []
    results = DB.exec("SELECT train_stations.* FROM train_lines
                      JOIN stops ON (train_lines.id = stops.train_id)
                      JOIN train_stations ON (stops.station_id = train_stations.id)
                       WHERE stops.train_id = #{@id};")
    results.each  do |result|
      train_stops << result
      end
      train_stops
  end
end


# select animals.* from
# trainers join lessons on (trainers.id = lessons.trainer_id)
#          join animals on (lessons.animal_id = animals.id)
# where trainers.id = 1;
