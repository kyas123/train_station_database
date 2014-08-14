class Stops
attr_reader :stop_location,:train_name

  def initialize(attributes)
    @stop_location = attributes[:stop_location]
    @train_name = attributes[:train_name]
  end


  def self.all
    @train_stops = []
    results = DB.exec("SELECT * FROM stops;")
    results.each  do |result|
      @train_stops << Stops.new({:stop_location => result['stop_location'],
                                :train_name => result ['train_name']})
    end
    @train_stops
  end


  def save
    results = DB.exec("INSERT INTO stops(stop_location, train_name)
      VALUES ('#{@stop_location}', '#{@train_name}') RETURNING id;")

      @id = results.first['id'].to_i
  end

  def ==(another_line)
    (self.train_name == another_line.train_name) &&
    (self.stop_location == another_line.stop_location)
  end

end
