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

    def prompt 
        puts "Please enter a spot like to choose e.g. 3,4"

        pos = gets.chomps.split(',')
        flag_or_clear(pos)
    end 

    def flag_or_clear(pos)
        puts "would you like to flag that spot? y/n"
        tile = tile(pos)

        ans = gets.chomp

        if ans == 'y'
            tile.flagged 

        elsif tile.bomb 
            puts "You lose!"
    
        else 
            clear(pos)

        end
    end 

    def tile(pos)
        x, y = pos
        tile = board.grid[x][y]
        tile 
    end 

    def clear(pos)
    
        tile = tile(pose)
        
        seen = {}
        queue = [tile]

        until queue.empty? 
            ele = queue.shift 

        
            if ele.bomb_count.to_i > 0
                ele.revealed
                seen[ele] = true

            else
                ele.revealed
                seen[ele] = true 

                ele.neighbors.each do |child| 
                    if !seen.include?(child)
                        queue << child 
                    end
                end
            end 
        end 
    end 


end 


game = Minesweeper.fill_board
game.board.place_bombs
game.board.give_tiles_grid
game.clear([1, 1])
game.board.render



