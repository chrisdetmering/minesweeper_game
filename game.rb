require_relative 'tile'
require_relative 'board'


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
        que = []

        
    end 
    



end 


game = Minesweeper.fill_board
game.board.place_bombs
game.board.give_tiles_grid
game.board.grid[1][1].neighbors
game.board.grid[1][1].neighbor_bomb_count

game.board.render


