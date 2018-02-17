# The Room Class
class Room
  attr_accessor :size, :content

  def initialize
    @content = init_content
    @size = init_size
    @adjective = init_adjective
  end

  def interact(player)
    @content.interact(player) if @content
    @content = nil
  end

  def to_s
    "You are in a #{@size} room. It is #{@adjective}."
  end

  private

  def init_content
    [Monster, Item].sample.new
  end

  def init_size
    %w[small medium large storage weapons].sample
  end

  def init_adjective
    %w[pretty ugly hideous clean messy].sample
  end
end

