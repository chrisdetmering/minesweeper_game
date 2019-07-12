require_relative 'tile'

class Board 

    attr_reader :grid

    def self.fill_board
       board = Array.new(9) do |i|
            Array.new(9) {|j| Tile.new(0, [i, j])}
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
            row = rand(0..8)
            col = rand(0..8)

            tile = @grid[row][col]
            if tile.value != "B"
                tile.bomb_setter
                bombs +=1 
            end
        end
    end 

    def render
      puts "  #{(0..8).to_a.join(" ")}"
        grid.each_with_index do |row, i|
        puts "#{i} #{row.join(" ")}"
        end
    end 

    def won? 

        @grid.each do |row| 
            row.each do |tile| 
                if tile.bomb && !tile.flagged
                    
                    return false
                elsif !tile.revealed?
                    
                    return false
                end
            end 
        end 

        true
    end 
end 

