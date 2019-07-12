require_relative 'tile'
require_relative 'board'
require 'byebug'
class Minesweeper 

    attr_accessor :board

    def self.fill_board
        board = Board.fill_board   
        self.new(board)
    end 


    def initialize(board)
        @board = board
    end 


    def clear(pos)
        queue = [pos]

        until queue.empty? 
            ele = queue.shift 

            tile = @board.grid[ele[0]][ele[1]]
            next if tile.bomb
            tile.revealed

            tile.neighbors.each {|child| queue << child.position}

        end 

    end 
    



end 


game = Minesweeper.fill_board
game.board.place_bombs
game.board.give_tiles_grid
p game.board.grid[1][1].neighbors
game.board.render



