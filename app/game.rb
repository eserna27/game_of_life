class Game
  def initialize(world)
    @world = world
    @cells = world.cells
  end

  def next_generation!
    cells_to_kill = find_cells_to_kill
    cells_to_alive = find_cells_to_alive
    kill_cells(cells_to_kill)
    alive_cells(cells_to_alive)
  end

  private

  attr_reader :world, :cells

  def find_cells_to_kill
    cells.values.select do |cell|
      underpopulation?(cell) ||
      overcrowding?(cell)
    end
  end

  def find_cells_to_alive
    cells.values.select do |cell|
      can_be_alive?(cell)
    end
  end

  def underpopulation?(cell)
    world.cell_neighbours(cell).select(&:alive?).count < 2
  end

  def overcrowding?(cell)
    world.cell_neighbours(cell).select(&:alive?).count > 3
  end

  def can_be_alive?(cell)
    world.cell_neighbours(cell).select(&:alive?).count == 3
  end

  def kill_cells(cells_to_kill)
    cells_to_kill.map(&:dead!)
  end

  def alive_cells(cells_to_alive)
    cells_to_alive.map(&:live!)
  end
end
