class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size = args[:size]
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
    post_initialize(args)
  end

  #subclasses may override
  def post_initialize(args)
    nil
  end

  def default_chain
    '100-speed'
  end

  def default_tire_size
    raise NotImplementedError, "This #{self.class} cannot respond to: "
  end

  def spares
    {
      tire_size: tire_size,
      chain: chain,
    }.merge(local_spares)
  end

  def local_spares
    {}
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = arge[:tape_color]
  end

  def default_tire_size
    '23'
  end

  def local_spares
    {tape_color: tape_color}
  end
end

class MoutainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  def default_tire_size
    '2.1'
  end

  def local_spares
    {rear_shock: rear_shock}
  end
end

class RecumbentBike < Bicycle
  attr_reader :flag

  def post_initialize(arg)
    @flag = arg[:flag]
  end

  def local_spares
    {flag: flag}
  end

  def default_chain
    '9-speed'
  end

  def default_tire_size
    '28'
  end
end

class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

class Parts
  def initialize(args={})
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size
    post_initialize(args)
  end

  def spares
    {
      tire_size: tire_size,
      chain: chain
    }.merge(local_spares)
  end

  def default_tire_size
    raise NotImplementedError
  end

  def post_initialize(args)
    nil
  end

  def local_spares
    {}
  end

  def default_chain
    '10-speed'
  end
end 

class RoadBikeParts < Part
  attr_reader :tape_color

  def post_initialize
    @tape_color = args[:tape_color]
  end

  def local_spares
    {tape_color: tape_color}
  end

  def default_tire_size
    '23'
  end
end

class MoutainBikePars < Par
  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  def local_spares
    {rear_shock: rear_shock}
  end

  def default_tire_size
    '2.1'
  end
end

require 'forwardarble'

class Parts extend Forwardable
  def_delegators :@parts, :size, :each

  def initialize(parts)
    @parts = parts
  end

  def spares
    parts.select {|part| part.needs_spare}
  end
end


class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare, true)
  end
end