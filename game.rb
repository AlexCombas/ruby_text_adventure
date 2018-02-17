Dir['lib/**.*'].each { |file| require_relative file }

# The Game Class
class Game
  ACTIONS = %i[north east south west fight take status exit help].freeze

  def initialize
    @world = World.new
    @player = Player.new

    start_game
  end

  private

  def start_game
    system 'clear'
    while @player.alive?
      @current_room = @world.get_room_of(@player)
      print_status

      action = take_player_input
      system 'clear'
      next unless ACTIONS.include? action

      take_action(action)
    end
  end

  def take_player_input
    puts 'What\'s the plan, Stan?'
    print '> '
    gets.chomp.to_sym
  end

  def print_status
    puts "\nYou are at map coordinates [#{@player.x_coord}, #{@player.y_coord}]"
    puts @current_room
    puts "You see #{@current_room.content}." if @current_room.content
  end

  def print_help
    puts 'Directions: north, south, east, west'
    puts 'Actions: fight, take, status'
    puts 'Game Over: exit'
  end

  def take_action(action)
    case action
    when :north
      @world.move_entity_north(@player)
    when :east
      @world.move_entity_east(@player)
    when :south
      @world.move_entity_south(@player)
    when :west
      @world.move_entity_west(@player)
    when :fight, :take
      @current_room.interact(@player)
    when :status
      @player.print_status
    when :exit
      Process.exit
    when :help
      print_help
    end
  end
end

Game.new
