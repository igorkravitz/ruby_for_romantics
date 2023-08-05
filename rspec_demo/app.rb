# frozen_string_literal: true

require './lib/shipment'
x =
  Shipment.total_weight(
    soccer_ball_count: 3,
    tennis_ball_count: 2,
    golf_ball_count: 1
  )
puts x

puts Shipment.total_weight(
  soccer_ball_count: 2
),
     Shipment.total_weight(
       tennis_ball_count: 2
     ),
     Shipment.total_weight(
       golf_ball_count: 2
     )
puts Shipment.total_weight
