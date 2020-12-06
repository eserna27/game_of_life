class World
  attr_reader :height, :width

  def initialize(dimensions)
    @height = dimensions[:height]
    @width = dimensions[:width]
  end
end
