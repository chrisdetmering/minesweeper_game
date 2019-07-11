require_relative 'tile'


class Board 

    attr_reader :grid

    def self.fill_board
       board = Array.new(9) do 
            Array.new(9) {Tile.new(0)}
        end 

        self.new(board)
    end 


    def initialize(grid = self.fill_board)
        @grid = grid
    end 

    def give_tiles_grid
        @grid.map{|row| row.map {|tile| tile.board = @grid}}
    end 

    def place_bombs
        bombs = 0 

        until bombs == 10 
            tile = @grid[rand(0..8)][rand(0..8)]
            tile.bomb_setter
            bombs +=1 
        end
    end 

    def render
      puts "  #{(0..8).to_a.join(" ")}"
        grid.each_with_index do |row, i|
        puts "#{i} #{row.join(" ")}"
        end
    end 

  
end 

