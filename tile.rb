
class Tile 


    def initialize(board, position)
        @board = board
        @revealed = false
        @value = '_'
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
        neighbors = []

        x, y = @position

        (x - 1..x + 1).each do |x| 
            (y - 1..y + 1).each do |y| 
                tile = @board[x][y]

                if tile != nil 
                    neighbors << tile
                end 
            end 
        end 

       neighbors
    end 

    def neighbor_bomb_count
        bomb_count = 0 

        neighbors.each do |tile| 
            if tile.bomb
                bomb_count +=1 
            end 
        end 
    

       bomb_count > 0 ? @value = "#{bomb_count}" : @value 
    end 

    def inspect 
         "#{@position}, #{@bomb}, #{@revealed},#{@value}"
    end 




end 