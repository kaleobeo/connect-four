# frozen_string_literal: true

require_relative '../lib/library'

describe Game do
  describe '#initialize' do
    subject(:init_game) { described_class.new }

    before do
      allow(Player).to receive(:new)
    end

    it 'instantiates two players' do
      described_class.new
      expect(Player).to have_received(:new).twice
    end
  end

  describe '#ask_column' do
    subject(:game_ask) { described_class.new }

    context 'when given a valid number to begin with' do
      before do
        valid_input = '4'
        allow(game_ask).to receive(:puts)
        allow(game_ask).to receive(:gets).and_return(valid_input)
      end

      it 'returns after one loop' do
        game_ask.ask_column
        expect(game_ask).to have_received(:gets).once
      end
    end

    context 'when given two invalid inputs, and then a valid one' do
      before do
        symbol_input = '%'
        letter_input = 'g'
        valid_number = '7'
        allow(game_ask).to receive(:puts)
        allow(game_ask).to receive(:gets).and_return(symbol_input, letter_input, valid_number)
      end

      it 'returns after three loops' do
        game_ask.ask_column
        expect(game_ask).to have_received(:gets).exactly(3).times
      end
    end
  end

  describe '#player_turn' do
    let(:board) { instance_double(Board) }
    let(:turn_game) { described_class.new(board) }
    let(:player) { instance_double(Player) }
    let(:cell_double) { instance_double(Cell) }

    context 'when the board successfully places a checker' do
      before do
        allow(player).to receive(:color).and_return(:red)
        allow(board).to receive(:drop_checker).and_return(cell_double)
        allow(cell_double).to receive(:position)
        allow(turn_game).to receive(:ask_column).and_return 4
        allow(board).to receive(:display_board)
      end

      it 'only executes the loop once' do
        turn_game.player_turn(player)
        expect(board).to have_received(:drop_checker).once
      end
    end

    context 'when the board fails to place a checker three times' do
      before do
        allow(player).to receive(:color).and_return(:red)
        allow(board).to receive(:drop_checker).and_return(false, false, false, cell_double)
        allow(cell_double).to receive(:position)
        allow(turn_game).to receive(:ask_column).and_return 4
        allow(turn_game).to receive(:puts)
        allow(board).to receive(:display_board)
      end

      it 'executes the loop 4 times' do
        turn_game.player_turn(player)
        expect(board).to have_received(:drop_checker).exactly(4).times
      end
    end
  end

  describe '#play_game' do
    let(:board) { instance_double(Board) }
    let(:play_game) { described_class.new(board) }

    context 'when the game ends at the end of round 4' do
      before do
        allow(board).to receive(:check_for_win).and_return(false, false, false, false, false, false, false, true)
        allow(play_game).to receive(:player_turn)
        allow(play_game).to receive(:player_turn)
        allow(play_game).to receive(:puts)
        allow(board).to receive(:display_board)
      end

      it '8 turns are executed' do
        play_game.play_game
        expect(board).to have_received(:check_for_win).exactly(8).times
      end
    end
  end
end
