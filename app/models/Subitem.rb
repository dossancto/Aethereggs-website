class Subitem
  attr_accessor :id, :mapname, :name, :steps

  def initialize(id, mapname, name, steps)
    @id = id
    @mapname = mapname
    @name = name
    @steps = steps
  end
end
