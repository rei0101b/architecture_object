class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel=nil)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diamiter
  end

  # Wheel = Struct.new(:rim, :tire) do
  #   def diamiter
  #     rim + (tire * 2)
  #   end
  # end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diamiter
    rim + (tire * 2)
  end

  def circumference
    diamiter * Math::PI
  end

end

wheel = Wheel.new(25, 1.5)
puts wheel.circumference
puts Gear.new(42, 13, wheel).gear_inches

class ObscuringReferences
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def diameters
    data.collect { |cell|
      cell[0] + (cell[1] * 2)}
  end
end

class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  def diamiters
    wheels.collect do
      diamiter(wheel)
    end
  end

  def diamiter(wheel)
    wheel.rim + (wheel.tire * 2)
  end

  Wheel = Struct.new(:rim, :tire)

  def wheelify(data)
    data.collect do |cell|
      Wheel.new(cell[0], cell[1])
    end
  end
end

puts Gear.new(52, 12)