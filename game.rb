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
        @lost = false
    end 

    def play 
        @board.place_bombs
        @board.give_tiles_grid

        play_turn until (won? || lost?)
            board.render
            
           if won? 
            puts "You won!"
           end 
    end 

    def play_turn 
        board.render
        pos = get_pos
        flag_or_clear(pos)
       
        system("clear")
    end 


    def get_pos
        pos = nil

        until pos && valid_pos?(pos)
            puts "Please enter a coordinate e.g. 3,4"
            print ">"

            begin 
                pos = coords(gets.chomp)
            rescue 
                puts "Invalid position you entered!"
                puts ""
                sleep(2)
                pos = nil
            end 
        end 
        pos 
    end 



    def flag_or_clear(pos)
        puts "would you like to flag that spot? y/n"
        tile = tile(pos)

        ans = gets.chomp

        if  ans == 'y'
            tile.flagged 

        elsif tile.flagged?
            tile.unflag
        
        elsif tile.bomb
            lost

        elsif ans == 'n'
            clear(pos)

        end
    end 

    def coords(string)
        string.split(",").map {|char| Integer(char)}
    end 

    def valid_pos?(pos)
        pos.all? {|x| x.between?(0, board.grid.size - 1)}
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

    def won? 
        @board.won? 
    end 

    def lost? 
        @lost
    end 

    def lost
        system('clear')
        board.show_all_bombs 
        board.render
        puts 'You lose!'
        sleep(2)
        @lost = true
    end 

end 


game = Minesweeper.fill_board
game.play
