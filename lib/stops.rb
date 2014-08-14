class Stops
attr_reader :station_id, :train_id, :id

  def initialize(attributes)
    @station_id = attributes[:station_id]
    @train_id = attributes[:train_id]
    @id = attributes[:id]
  end


  def self.all
    @train_stops = []
    results = DB.exec("SELECT * FROM stops;")
    results.each  do |result|
      @train_stops << Stops.new({:station_id => result['station_id'].to_i,
                                :train_id => result ['train_id'].to_i})
    end
    @train_stops
  end


  def save
    results = DB.exec("INSERT INTO stops (station_id, train_id)
      VALUES ('#{@station_id}', '#{@train_id}') RETURNING id;")

      @id = results.first['id'].to_i
  end

  def ==(another_line)
    (self.train_id == another_line.train_id) &&
    (self.station_id == another_line.station_id)
  end

end
