require_relative "board.rb"
require_relative "player.rb"
require_relative "win_checker.rb"

class Game
    attr_reader :game_board
    
    def initialize
        @player = Player.new()
        @win_checker = Win_checker.new
        @board_obj = Board.new
        @game_board = []
    end

    def set_up
        board = Board.new
        @board_obj = board###for printing
        board.initialize_board
        @game_board = board.board
        
    end

    def print_board
        @board_obj.print_board
    end

    def []=(position, value)
        @game_board[position.first.to_i][position.last.to_i].value = value.to_s
    end
    
    #Checking rows
    def checking_all_rows
        @win_checker.checking_all_rows(@game_board)
    end
    #----------------------------------------------

    #Checking cols
    def checking_all_cols
        hash = @win_checker.extract_cols_values(@game_board)
        @win_checker.checking_algorithm_all_cols(hash)
    end
   #-----------------------------------------------

   #checking_squares
    def square_checker
        @win_checker.squares_checkers(@game_board)
    end
    #----------------------------------------------

    def is_board_solved?
        checking_all_rows && checking_all_cols && square_checker
    end

    def start_game
        self.set_up
        self.print_board
        
        until is_board_solved? do

            @player.alert_player_enter_position
            pos = @player.enter_a_position

            until @player.is_correct_position?(pos) do 
                @player.alert_player_to_enter_again
                pos = @player.enter_a_position
            end

            until @board_obj.changable?(pos) do 

                @player.alert_player_cannot_change
                pos = @player.enter_a_position

                until @player.is_correct_position?(pos) do 
                    @player.alert_player_to_enter_again
                    pos = @player.enter_a_position
                end
            end

            val = @player.enter_value
            until @player.correct_val?(val)
                val = @player.enter_value
            end

            self[pos] = val.to_i
            self.print_board
        end

        @player.congratulate_player
    end


end

game = Game.new
game.start_game()