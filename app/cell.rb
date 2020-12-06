class Cell
  attr_reader :x, :y

  def initialize(position)
    @x = position[:x]
    @y = position[:y]
  end

  def live!
    @live = true
  end

  def dead!
    @live = false
  end

  def alive?
    live
  end

  def my_position?(position)
    x == position[:x] && y == position[:y]
  end

  private
  attr_accessor :live
end
