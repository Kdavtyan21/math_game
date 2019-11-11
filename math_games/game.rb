require_relative 'player.rb'

class Game
  def initialize 
    @players = [Player.new('P1'), Player.new('P2')]
  end

  def game_status
    puts "---- NEW TURN ----"
    @players.each do |player|
      puts "#{player.name}: #{player.hp}/3"
    end
  end

  def game_over?
    alive_players.count == 1
  end

  def alive_players
    @players.select{|player| player.hp > 0}
  end

  def alive_opponent(current)
    alive_players.select{|player| player != current}.sample
  end

  def next_round
    @players.rotate!
    sleep 1
  end


  def run

    while(!game_over?) 
      current_player = alive_players.first
      opponent_player = alive_opponent(current_player)

      current_player.turn(opponent_player)

      game_status

      next_round


    end

    puts "#{alive_players.first.name} Won!!!"
    puts "---- GAME OVER ----"
    puts "Good bye!"
  end


end