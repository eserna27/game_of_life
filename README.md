# game_of_life

To use the game:
- Create a world `world = World.new(height: x, width: y)`
- world.cells => returns array of cells
- world.cell_at(x: , y:) => returns a cell in the position
- world.neighbours(cell) => returns the cells neighbours

- Create a game 
- `Game.new(world)`
- game.next_generation! => make the change of state to each cell

- Create a cell
- `Cell.new(x:, y:)`
- cell.live! => change the state of cell to alive
- cell.dead! => change the state of cell to died
- cell.alive? => returns true if is alive
- cell.position => returns {x: , y:}
- cell.my_position?(x:, y:) => returns if is the positon of cell

To run the spec use
`rspec spec/`
