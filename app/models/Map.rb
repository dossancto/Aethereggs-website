class Map
  attr_accessor :id, :name, :ee, :ww, :uww, :extras

  def initialize(id, name, ee, ww, uww, extras)
    @id = id
    @name = name
    @ee = ee
    @ww = ww
    @uww = uww
    @extras = extras
  end
end
