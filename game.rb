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

    



end 


game = Minesweeper.fill_board

game.board.bomb
game.board.reveal([1, 1])
game.board.render

