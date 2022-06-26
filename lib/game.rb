# frozen_string_literal: true

# Game class manages general gameflow and interaction with a user
class Game
  def initialize(board = Board.new)
    @board = board
    @history = []
    create_players
  end

  def play_game
    loop do
      if turn_with_check(@player_one)
        conclusion(@player_one)
        break
      end

      if turn_with_check(@player_two)
        conclusion(@player_two)
        break
      end
    end
  end

  def player_turn(player)
    loop do
      @board.display_board
      player_input = ask_column
      result = @board.drop_checker(player.color, player_input)
      if result
        @history.unshift(result.position)
        return result
      end

      puts 'That row is full, sorry!'
    end
  end

  def ask_column
    loop do
      puts 'Please enter which column you would like to play in'
      result = gets.chomp
      return result.to_i if verify_input(result)

      puts 'Invalid column, try again'
    end
  end

  private

  def turn_with_check(player)
    player_turn(player)
    @board.check_for_win(player.color, @history[0])
  end

  def create_players
    @player_one = Player.new(:red)
    @player_two = Player.new(:blue)
  end

  def verify_input(input)
    input.to_i.between?(1, 7)
  end

  def conclusion(player)
    @board.display_board
    puts "#{player.color} player wins!"
  end

  def welcome
    puts <<-TEXT
      Welcome to Connect Four, a game where players alternate dropping tokens down a board, trying to make a 4-in-a-row line in a horizontal, vertical, or diagonal direction. Try to do so before your opponent can. Lets begin!
    TEXT
  end
end
