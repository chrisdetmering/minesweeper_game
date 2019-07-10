require_relative 'tile'
require_relative 'board'


class PlayMinesweeper 

    attr_accessor :board

    def self.fill_board
        board = Board.fill_board
        self.new(board)
    end 


    def initialize(board)
        @board = board
    end 

    def bomb
        bombs = 0 

        until bombs == 10 
            tile = @board[rand(0..8)][rand(0..8)]
            tile.bomb_setter
            bombs +=1 
        end
    end 


end 


game = PlayMinesweeper.fill_board

game.bomb

p game