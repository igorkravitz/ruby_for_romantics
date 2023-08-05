# frozen_string_literal: true

# Задание: попробуйте заменить 1420 выше на 1421 и посмотрите что произойдет (тест не
# должен сработать).
#
# Задание: код файла `shipment.rb` был изменен: если в метод “total_weight” не переданы
# аргументы, генерируется ошибка (также говорят “выбрасывается исключение”):
#
# module Shipment
#   module_function
#   def total_weight(options={})
#     raise "Can't calculate weight with empty options" if options.empty?
#     a = options[:soccer_ball_count] || 0
#     b = options[:tennis_ball_count] || 0
#     c = options[:golf_ball_count] || 0
#     (a * 410) + (b * 58) + (c * 45) + 29
#   end
# end

require './lib/shipment'

describe Shipment do
  # it 'should work without options' do
  #   expect(Shipment.total_weight).to eq(29)
  # end

  it 'should calculate shipment with only one item' do
    expect(Shipment.total_weight(soccer_ball_count: 1)).to eq(439)
    expect(Shipment.total_weight(tennis_ball_count: 1)).to eq(87)
    expect(Shipment.total_weight(golf_ball_count: 1)).to eq(74)
  end

  it 'should calculate shipment with only two item' do
    expect(Shipment.total_weight(soccer_ball_count: 2)).to eq(849)
    expect(Shipment.total_weight(tennis_ball_count: 2)).to eq(145)
    expect(Shipment.total_weight(golf_ball_count: 2)).to eq(119)
  end

  it 'should throw an exception without options' do
    expect do
      Shipment.total_weight
    end.to raise_error "Can't calculate weight with empty options"
  end

  it 'matches the error message' do
    expect { raise StandardError, 'this message exactly' }.to raise_error(
      'this message exactly'
    )
  end

  it 'should calculate shipment with multiple items' do
    # expect(
    #   Shipment.total_weight(
    #     soccer_ball_count: 3,
    #     tennis_ball_count: 2,
    #     golf_ball_count: 1
    #   )
    # ).to eq(1421)
    expect(
      Shipment.total_weight(
        soccer_ball_count: 3,
        tennis_ball_count: 2,
        golf_ball_count: 1
      )
    ).to eq(1420)
  end
end
