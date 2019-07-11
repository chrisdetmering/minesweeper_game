
class Tile 


    def initialize(board)
        @board = board
        @revealed = false
        @value = ' '
        @bomb = false 
    end 

    attr_accessor :bomb, :revealed


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

  
    def neighbor_bomb_count

    end 




end 