class Train_lines
attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end


  def self.all
    @train_lines = []
    results = DB.exec("SELECT * FROM train_lines;")
    results.each  do |result|
      @train_lines << Train_lines.new({:name => result['name']})
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

end
