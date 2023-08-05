# frozen_string_literal: true

require './lib/shipment2'

describe Shipment2 do
  it 'should return shipment2 with one two three number' do
    expect(Shipment2.one).to eq(1)
    expect(Shipment2.two).to eq(2)
    expect(Shipment2.three).to eq(3)
  end
end
