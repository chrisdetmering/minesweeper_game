require_relative 'tile'
require_relative 'board'


class PlayMinesweeper 

    def self.empty_grid
        board = Board.empty_grid
        self.new(board)
    end 


    def initialize(board)
        @board = board
    end 





end 


game = PlayMinesweeper.empty_grid

p game