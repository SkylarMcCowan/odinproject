# Tic Tac Toe

This is a command-line Tic Tac Toe game implemented in Ruby, designed for two human players to compete against each other. The project follows object-oriented programming principles, organizing the code into distinct classes for better maintainability and readability.

## Project Structure

- **lib/**
  - `board.rb`: Defines the `Board` class, managing the game board and its state.
  - `game.rb`: Contains the `Game` class, orchestrating the game flow and player turns.
  - `player.rb`: Represents a player in the game with their name and chosen mark (X or O).
  - `tic_tac_toe.rb`: Entry point for the application, initializing the game.

- **spec/**
  - `board_spec.rb`: Tests for the `Board` class, ensuring correct functionality of methods.
  - `game_spec.rb`: Tests for the `Game` class, verifying game flow and victory conditions.
  - `player_spec.rb`: Tests for the `Player` class, checking player attributes and methods.
  - `spec_helper.rb`: Sets up the testing environment for RSpec.

- **Gemfile**: Specifies the required gems for the project, including RSpec for testing.

## How to Run the Game

1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Install the required gems by running:
   ```
   bundle install
   ```
4. Start the game by executing:
   ```
   ruby lib/tic_tac_toe.rb
   ```

## Game Rules

- The game is played on a 3x3 grid.
- Players take turns placing their marks (X or O) in an empty cell.
- The first player to align three of their marks horizontally, vertically, or diagonally wins the game.
- If all cells are filled and no player has won, the game ends in a draw.

Enjoy playing Tic Tac Toe!