# The Item Class
class Item
  attr_accessor :type
  TYPES = %i[potion sword].freeze

  def initialize
    @type = TYPES.sample
  end

  def interact(player)
    case @type
    when :potion
      puts "You drink #{self}. *glug glug glug*"
      player.heal(10)
    when :sword
      puts "You pick up #{self}."
      player.attack_power += 1
    end
  end

  def to_s
    "a shiny awesome #{@type}"
  end
end
