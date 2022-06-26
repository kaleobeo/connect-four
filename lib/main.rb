# frozen_string_literal: true

require_relative './library'

def run_loop
  loop do
    game = Game.new
    game.play_game

    if prompt_play_again == 'n'
      puts 'thanks for playing!'
      break
    end
  end
end

def prompt_play_again
  loop do
    puts 'Do you want to play again? y/n'
    input = gets.chomp
    return input if %w[y n].include?(input)

    puts 'invalid entry'
  end
end

run_loop
