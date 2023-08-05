# frozen_string_literal: true

# example of module with demo rspec
module Shipment
  module_function

  def total_weight(options = {})
    raise "Can't calculate weight with empty options" if options.empty?

    a = options[:soccer_ball_count] || 0
    b = options[:tennis_ball_count] || 0
    c = options[:golf_ball_count] || 0
    (a * 410) + (b * 58) + (c * 45) + 29
  end
end
