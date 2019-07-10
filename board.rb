require_relative 'tile'


class Board 

    attr_reader :grid

    def self.fill_board
        Array.new(9) do 
            Array.new(9) {Tile.new(self)}
        end 
    end 


    def initialize(grid)
        @grid = grid
    end 

  
end 

