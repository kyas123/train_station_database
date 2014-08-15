class TrainStation

attr_reader :location, :id

  def initialize(attributes)
    @location = attributes[:location]
    @id = attributes[:id]
  end


  def self.all
    @train_stations = []
    results = DB.exec("SELECT * FROM train_stations;")
    results.each  do |result|
      @train_stations << TrainStation.new({:location => result['location']})
    end
    @train_stations
  end


  def save
    results = DB.exec("INSERT INTO train_stations(location)
      VALUES ('#{@location}') RETURNING id;")

      @id = results.first['id'].to_i
  end

  def ==(another_station)
    self.location == another_station.location
  end

  def stops
    trains =[]
    results = DB.exec("SELECT train_lines.* FROM train_stations
                      JOIN stops ON (train_stations.id = stops.station_id)
                      JOIN train_lines ON (stops.train_id = train_lines.id)
                      WHERE stops.station_id = #{@id};")
    results.each do |result|
      trains << result
    end
    trains
  end
end


