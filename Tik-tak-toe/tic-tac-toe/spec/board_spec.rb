require 'board'

RSpec.describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'creates a 3x3 grid' do
      expect(board.grid.size).to eq(3)
      expect(board.grid.all? { |row| row.size == 3 }).to be true
    end
  end

  describe '#display' do
    it 'displays the current state of the board' do
      expect { board.display }.to output.to_stdout
    end
  end

  describe '#place_mark' do
    context 'when placing a mark in an empty cell' do
      it 'places the mark correctly' do
        board.place_mark(0, 0, 'X')
        expect(board.grid[0][0]).to eq('X')
      end
    end

    context 'when placing a mark in an occupied cell' do
      it 'raises an error' do
        board.place_mark(0, 0, 'X')
        expect { board.place_mark(0, 0, 'O') }.to raise_error('Cell already taken')
      end
    end
  end

  describe '#check_win' do
    context 'when a player has three in a row' do
      it 'returns true for a winning row' do
        board.place_mark(0, 0, 'X')
        board.place_mark(0, 1, 'X')
        board.place_mark(0, 2, 'X')
        expect(board.check_win('X')).to be true
      end

      it 'returns true for a winning column' do
        board.place_mark(0, 0, 'O')
        board.place_mark(1, 0, 'O')
        board.place_mark(2, 0, 'O')
        expect(board.check_win('O')).to be true
      end

      it 'returns true for a winning diagonal' do
        board.place_mark(0, 0, 'X')
        board.place_mark(1, 1, 'X')
        board.place_mark(2, 2, 'X')
        expect(board.check_win('X')).to be true
      end
    end

    context 'when no player has won' do
      it 'returns false' do
        expect(board.check_win('X')).to be false
      end
    end
  end

  describe '#check_draw' do
    context 'when the board is full and no player has won' do
      it 'returns true' do
        board.place_mark(0, 0, 'X')
        board.place_mark(0, 1, 'O')
        board.place_mark(0, 2, 'X')
        board.place_mark(1, 0, 'O')
        board.place_mark(1, 1, 'X')
        board.place_mark(1, 2, 'O')
        board.place_mark(2, 0, 'O')
        board.place_mark(2, 1, 'X')
        board.place_mark(2, 2, 'O')
        expect(board.check_draw).to be true
      end
    end

    context 'when the board is not full' do
      it 'returns false' do
        board.place_mark(0, 0, 'X')
        expect(board.check_draw).to be false
      end
    end
  end
end