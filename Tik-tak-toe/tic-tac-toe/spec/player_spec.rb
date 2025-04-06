require 'player'

RSpec.describe Player do
  let(:player) { Player.new("Alice", "X") }
  let(:another_player) { Player.new("Bob", "O") }

  describe '#initialize' do
    it 'creates a player with a name and mark' do
      expect(player.name).to eq("Alice")
      expect(player.mark).to eq("X")
    end
  end

  describe '#name' do
    it 'returns the player name' do
      expect(player.name).to eq("Alice")
    end
  end

  describe '#mark' do
    it 'returns the player mark' do
      expect(player.mark).to eq("X")
    end
  end
end