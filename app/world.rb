require_relative "cell"
require_relative "neighbours"

class World
  include Neighbours
  attr_reader :height, :width, :cells

  def initialize(height:, width:)
    @height = height
    @width = width
    build_cells
  end

  def cell_at(x:, y:)
    cells["#{x}-#{y}"]
  end

  private
  attr_writer :cells

  def build_cells
    @cells = {}
    width.times do |x|
      height.times do |y|
        cell = create_cell(x+1, y+1)
        add_cell(cell)
      end
    end
  end

  def create_cell(x, y)
    position = {x: x, y: y}
    Cell.new(position)
  end

  def add_cell(cell)
    @cells.merge!("#{cell.x}-#{cell.y}" => cell) if cell
  end
end
