class House
  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def turn_price_to_int
    @price_int = @price[1..-1].to_i
  end

  def above_market_average?
    turn_price_to_int
    @price_int > 500000
  end

  def rooms_from_category(category)
    room_type = Hash.new { |h, k| h[k] = [] }
    @rooms.each do |room|
      room_type[room.category].push(room)
      end
    room_type[category]
  end

  def area
    total_area = 0
    @rooms.each do |room|
      total_area += room.area
    end
    total_area
  end

  def details
  { "price" => turn_price_to_int, "address" => @address }
  end

  def price_per_square_foot
    (turn_price_to_int.to_f / area).round(2)
  end

  def rooms_sorted_by_area
    sorted_rooms = @rooms.sort_by {|room| room.area}
    sorted_rooms
  end

  def rooms_by_category
    room_type = Hash.new { |h, k| h[k] = [] }
    @rooms.each do |room|
      room_type[room.category].push(room)
      end
    room_type
  end
end
