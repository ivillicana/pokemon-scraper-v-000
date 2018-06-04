class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(attributes)
    attributes.each {|k, v| self.send("#{k}=", v)}
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find (id, db)
    Pokemon.new(id: db.execute("SELECT id FROM pokemon WHERE id = ?", id), name: db.execute("SELECT name FROM pokemon WHERE id = ?", id), type: db.execute("SELECT type FROM pokemon WHERE id = ?", id))

  end
end
