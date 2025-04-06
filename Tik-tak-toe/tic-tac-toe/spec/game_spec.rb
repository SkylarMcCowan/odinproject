require 'rspec'
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

RSpec.describe Game do
  let(:player1) { Player.new("Alice", "X") }
  let(:player2) { Player.new("Bob", "O") }
  let(:game) { Game.new(player1, player2) }

  describe '#initialize' do
    it 'creates a new game with two players' do
      expect(game.player1).to eq(player1)
      expect(game.player2).to eq(player2)
      expect(game.board).to be_a(Board)
    end
  end

  describe '#play' do
    it 'allows players to take turns' do
      allow(game).to receive(:gets).and_return("1", "2", "3")
      expect { game.play }.to change { game.board.cells }.from(Array.new(9, nil)).to(["X", "O", "X"])
    end

    it 'declares a winner when a player wins' do
      allow(game).to receive(:gets).and_return("1", "2", "4", "3", "7")
      expect { game.play }.to output(/Alice wins!/).to_stdout
    end

    it 'declares a draw when the board is full and there is no winner' do
      allow(game).to receive(:gets).and_return("1", "2", "3", "4", "5", "6", "7", "8", "9")
      expect { game.play }.to output(/It's a draw!/).to_stdout
    end
  end

  describe '#check_winner' do
    it 'returns the winning player when there is a win' do
      game.board.cells = ["X", "X", "X", nil, nil, nil, nil, nil, nil]
      expect(game.check_winner).to eq(player1)
    end

    it 'returns nil when there is no winner' do
      game.board.cells = ["X", "O", "X", nil, nil, nil, nil, nil, nil]
      expect(game.check_winner).to be_nil
    end
  end
end