require 'spec_helper'
require_relative '../app/cell'

RSpec.describe Cell do
  it "is initialize with position" do
    position = {x: 1, y: 1}
    cell = Cell.new(position)
    expect(cell.x).to eq 1
    expect(cell.y).to eq 1
    expect(cell.position).to eq({x: 1, y: 1})
  end

  it "is not alive when is new" do
    position = {x: 1, y: 1}
    cell = Cell.new(position)
    expect(cell).not_to be_alive
  end

  it "could be set as alive" do
    position = {x: 1, y: 1}
    cell = Cell.new(position)
    cell.live!
    expect(cell).to be_alive
  end

  it "could be set as dead" do
    position = {x: 1, y: 1}
    cell = Cell.new(position)
    cell.live!
    expect(cell).to be_alive
    cell.dead!
    expect(cell).not_to be_alive
  end
end
