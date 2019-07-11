
class Tile 


    def initialize(board, position)
        @board = board
        @revealed = false
        @value = ' '
        @bomb = false 
        @position = position
    end 

    attr_accessor :bomb, :revealed, :board


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

    def inspect 
         "#{@position}, #{@bomb}, #{@revealed},#{@value}"
    end 




end 