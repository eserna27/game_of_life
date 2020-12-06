require 'spec_helper'
require_relative '../app/game'
require_relative '../app/world'

RSpec.describe Game do
  let(:world) {World.new(height: 4, width: 4)}
  def alive_cell(world)
    cell = world.cell_at(x: 2, y: 2)
    cell.live!
    cell
  end

  def dead_cell(world)
    cell = world.cell_at(x: 2, y: 2)
    cell.dead!
    cell
  end

  describe "#next!" do
    describe "underpopulation" do
      example "any cell living without live neighbours dies" do
        cell = alive_cell(world)
        neighbours = world.cell_neighbours(cell)
        game = Game.new(world)
        game.next_generation!
        expect(world.cell_at(**cell.position)).not_to be_alive
      end

      example "any cell living with one live neighbours dies" do
        cell = alive_cell(world)
        neighbours = world.cell_neighbours(cell)
        neighbours.take(1).map(&:live!)
        game = Game.new(world)
        game.next_generation!
        expect(world.cell_at(**cell.position)).not_to be_alive
      end

      example "any cell living with two live neighbours live" do
        cell = alive_cell(world)
        neighbours = world.cell_neighbours(cell)
        neighbours.take(2).map(&:live!)
        game = Game.new(world)
        game.next_generation!
        expect(world.cell_at(**cell.position)).to be_alive
      end
    end

    describe "overcrowding" do
      example "any cell living with 3 lives neighbours live" do
        cell = alive_cell(world)
        neighbours = world.cell_neighbours(cell)
        neighbours.take(3).map(&:live!)
        game = Game.new(world)
        game.next_generation!
        expect(world.cell_at(**cell.position)).to be_alive
      end

      example "any cell living with more than 3 lives neighbours dies" do
        cell = alive_cell(world)
        neighbours = world.cell_neighbours(cell)
        neighbours.take(4).map(&:live!)
        game = Game.new(world)
        game.next_generation!
        expect(world.cell_at(**cell.position)).not_to be_alive
      end
    end

    describe "live in next generation" do
      example "any cell living with 2 lives neighbours live" do
        cell = alive_cell(world)
        neighbours = world.cell_neighbours(cell)
        neighbours.take(2).map(&:live!)
        game = Game.new(world)
        game.next_generation!
        expect(world.cell_at(**cell.position)).to be_alive
      end

      example "any cell living with 3 lives neighbours live" do
        cell = alive_cell(world)
        neighbours = world.cell_neighbours(cell)
        neighbours.take(3).map(&:live!)
        game = Game.new(world)
        game.next_generation!
        expect(world.cell_at(**cell.position)).to be_alive
      end
    end

    describe "any cell with exactly 3 neighbours became alive" do
      example "has 2 lives neighbours not is alive" do
        cell = dead_cell(world)
        neighbours = world.cell_neighbours(cell)
        neighbours.take(2).map(&:live!)
        game = Game.new(world)
        game.next_generation!
        expect(world.cell_at(**cell.position)).not_to be_alive
      end

      example "has 4 lives neighbours not is alive" do
        cell = dead_cell(world)
        neighbours = world.cell_neighbours(cell)
        neighbours.take(4).map(&:live!)
        game = Game.new(world)
        game.next_generation!
        expect(world.cell_at(**cell.position)).not_to be_alive
      end

      example "has 3 lives neighbours is alive" do
        cell = dead_cell(world)
        neighbours = world.cell_neighbours(cell)
        neighbours.take(3).map(&:live!)
        game = Game.new(world)
        game.next_generation!
        expect(world.cell_at(**cell.position)).to be_alive
      end
    end
  end
end
