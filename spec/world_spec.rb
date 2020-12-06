require 'spec_helper'
require_relative '../app/world'

RSpec.describe World do
  it "is initialize with dimensions" do
    dimensions = {height: 4, width: 4}
    world = World.new(dimensions)
    expect(world.height).to eq 4
    expect(world.width).to eq 4
  end

  it "knows the number of cells" do
    dimensions = {height: 4, width: 4}
    world = World.new(dimensions)
    expect(world.cells).to eq 0
  end
end
