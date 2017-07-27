class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name,type) VALUES ('#{name}','#{type}');")
  end

  def self.find(id,db)
    arr = db.execute("SELECT * FROM pokemon WHERE id = #{id};").flatten
    new(id:arr[0], name: arr[1], type: arr[2], db: db)
  end

  # def alter_hp(hp=60, db)
  #   db.execute("UPDATE pokemon SET hp = #{hp};")
  # end
end
