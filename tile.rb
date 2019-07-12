
class Tile 


    def initialize(board, position)
        @board = board
        @revealed = true
        @value = ' '
        @bomb = false 
        @position = position
    end 

    attr_accessor :bomb, :revealed, :board, :value
    attr_reader :position


    def bomb_setter
        @bomb = true
        @value = 'B'
    end 

    def to_s 
       if @revealed == false
            return "*"
       else 
            return @value
       end 
    end 

    def revealed 
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

    def neighbor_bomb_count
        bomb_count = 0 

        neighbors.each do |tile| 
            if tile.bomb
                bomb_count +=1 
            end 
        end 
    

        @value = "#{bomb_count}"
    end 

    def inspect 
         "#{@position}, #{@bomb}, #{@revealed},#{@value}"
    end 




end 