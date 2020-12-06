require 'spec_helper'
require_relative '../app/world'

RSpec.describe World do
  it "is initialize with dimensions" do
    dimensions = {height: 4, width: 4}
    world = World.new(**dimensions)
    expect(world.height).to eq 4
    expect(world.width).to eq 4
  end

  it "generates dead cells for each space" do
    dimensions = {height: 4, width: 4}
    world = World.new(**dimensions)
    expect(world.cells.count).to eq 4*4
    expect(world.cells.any?(:alive?)).to eq false
  end

  it "returns a cell on any position" do
    dimensions = {height: 4, width: 4}
    world = World.new(**dimensions)
    position = {x: 2, y: 2}
    cell = world.cell_at(**position)
    expect(cell.x).to eq position[:x]
    expect(cell.y).to eq position[:y]
  end

  it "knows cell neighbours" do
    dimensions = {height: 4, width: 4}
    world = World.new(**dimensions)
    position = {x: 2, y: 2}
    cell = world.cell_at(**position)
    neighbours = world.cell_neighbours(cell)
    expect(neighbours.count).to eq 8
    expect(neighbours.map(&:x).uniq).to eq [1, 2, 3]
    expect(neighbours.map(&:y).uniq).to eq [1, 2, 3]
  end

  it "knows cell neighbours out of range" do
    dimensions = {height: 4, width: 4}
    world = World.new(**dimensions)
    position = {x: 4, y: 4}
    cell = world.cell_at(**position)
    neighbours = world.cell_neighbours(cell)
    expect(neighbours.count).to eq 3
  end
end
