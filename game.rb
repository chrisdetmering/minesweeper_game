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

    def play 
        @board.place_bombs
        @board.give_tiles_grid

        until over? 
            @board.render
            prompt

            system('clear')
        end 

        puts "You Won!"
    end 

    def prompt 
        puts "Please enter a spot you would like to choose e.g. 3,4"

        pos = coord(gets.chomp)
        flag_or_clear(pos)
    end 

    def flag_or_clear(pos)
        puts "would you like to flag that spot? y/n"
        tile = tile(pos)

        ans = gets.chomp

        if  ans == 'y'
            tile.flagged 

        elsif tile.bomb 
            puts "You lose!"
            sleep(2)
            
        elsif tile.flagged?
            tile.unflag

        else 
            clear(pos)

        end
    end 

    def coord(string)
        string.split(",").map(&:to_i)
    end 

    def tile(pos)
        x, y = pos
        tile = board.grid[x][y]
        tile 
    end 

    def clear(pos)
    
        tile = tile(pos)
        
        seen = {}
        queue = [tile]

        until queue.empty? 
            ele = queue.shift 

            next if ele.flagged?

            if ele.bomb_count.to_i > 0
                ele.reveal
                seen[ele] = true

            else
                ele.reveal
                seen[ele] = true 

                ele.neighbors.each do |child| 
                    if !seen.include?(child)
                        queue << child 
                    end
                end
            end 
        end 
    end 

    def over? 
        @board.won? 
    end 

end 


game = Minesweeper.fill_board
game.play
