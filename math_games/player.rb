class Player

  attr_reader :name #:ap
  attr_accessor :hp

  def initialize(name)
    @name=name
    @hp=3
    # @ap=1
  end


  def lost?
    @hp <= 0
  end

  # def answer
  #   gets.chomp
  # end

  def turn(opponent)
    @number1 = rand(20)
    @number2 = rand(20)
    @answer = @number1 + @number2
    puts "#{@name}: What does #{@number1} plus #{@number2} equal?"
    @player_answer = gets.chomp
    if @player_answer == @answer.to_s
      puts "Yes! You are correct."
    else 
      puts "Cmon man, that's not it"
      opponent.hp -= 1
    end  
  end 
end