require 'byebug'


class Tile 


    def initialize(board, position)
        @board = board
        @revealed = false
        @value = ' '
        @flagged = false
        @bomb = false 
        @position = position
    end 

    attr_accessor :bomb, :board, :value
    attr_reader :position


    def bomb_setter
        @bomb = true
        @value = 'B'
    end 

    def to_s 
    
        
       if @flagged && !@revealed
            return "F"
       elsif !@revealed 
            return "*"
       else 
            return @value
       end 
    end 

    def flagged? 
        @flagged
    end 

    def flagged 
        @flagged = true
    end 

    def unflag 
        @flagged = false
    end 

    def revealed? 
        @revealed
    end 

    def reveal
         @revealed = true
    end 

    def board=(value)
        @board = value
    end 

    def neighbors  

        def adjacent(array, row, col)
            rows_ndx = array.each_index.select { |i| (i-row).abs < 2 }
            cols_ndx = array.first.size.times.select { |j| (j-col).abs < 2 }
            rows_ndx.each_with_object([]) do |i,a| 
            cols_ndx.each { |j| a << array[i][j] unless [i,j] == [row,col] }
            end
        end

        row, col = @position
        array = @board 

        return adjacent(array, row, col)
    end 

    def bomb_count
        bomb_count = 0 

        neighbors.each do |tile| 
            if tile.bomb
                bomb_count +=1 
            end 
        end 
    
        bomb_count == 0  ?  @value = " " :  @value = "#{bomb_count}"
    end 

    def inspect 
         "#{@position}, #{@bomb}, #{@revealed},#{@value}"
    end 




end 