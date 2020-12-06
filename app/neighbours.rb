module Neighbours
  def cell_neighbours(cell)
    neighbours = []
    x_radiuos(cell).each do |x|
      y_radiuos(cell).each do |y|
        neighbour = find_neighbour(x, y)
        neighbours << neighbour unless cell.my_position?(x: x, y: y)
      end
    end
    neighbours.compact
  end

  def x_radiuos(cell)
    (cell.x-1...cell.x+2).to_a
  end

  def y_radiuos(cell)
    (cell.x-1...cell.x+2).to_a
  end

  def find_neighbour(x, y)
    cell_at(x: x, y: y)
  end
end
