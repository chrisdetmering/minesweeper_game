require_relative 'tile'


class Board 

    attr_reader :grid

    def self.fill_board
       board = Array.new(9) do 
            Array.new(9) {Tile.new(self)}
        end 

        self.new(board)
    end 


    def initialize(grid = self.fill_board)
        @grid = grid
    end 

    def bomb
        bombs = 0 

        until bombs == 10 
            tile = @grid[rand(0..8)][rand(0..8)]
            tile.bomb_setter
            bombs +=1 
        end
    end 

    def reveal(position)
        x, y = position
        tile = @grid[x][y]
        tile.revealed
    end 

    def render
      puts "  #{(0..8).to_a.join(" ")}"
        grid.each_with_index do |row, i|
        puts "#{i} #{row.join(" ")}"
        end
    end 

  
end 

