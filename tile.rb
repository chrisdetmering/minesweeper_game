
class Tile 


    def initialize(board)
        @board = board
        @bomb = false 
    end 

    attr_reader :bomb

#bomb? T/F

    def bomb_setter
        @bomb = true
    end 


#methods 
#reveal 
#neighbors 
#neighbor_bomb_count
#flagged? 




end 