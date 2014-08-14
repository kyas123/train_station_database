class Train_stations

attr_reader :location

  def initialize(attributes)
    @location = attributes[:location]
  end


  def self.all
    @train_stations = []
    results = DB.exec("SELECT * FROM train_stations;")
    results.each  do |result|
      @train_stations << Train_stations.new({:location => result['location']})
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

end
