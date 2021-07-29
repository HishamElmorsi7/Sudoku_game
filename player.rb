require_relative "board.rb"

class String
    def is_integer?
      self.to_i.to_s == self
    end
  end
  
class Player

    def alert_player_cannot_change
        puts "this tale cannot be changed"
    end

    def alert_player_to_enter_again
        puts "Enter a correct position"
    end

    def alert_player_enter_position
        puts "Enter a position in the format => x y"
    end

    def enter_a_position
        gets.chomp.split(" ")
    end

    def congratulate_player
        puts "Congratulations you won ;) "
    end

    def is_correct_position?(pos)
        return false if !pos.all?{ |ele| ele.is_integer? }
        turned_to_int_pos = pos.map { |ele| ele.to_i}

        first_idx_pos = turned_to_int_pos.first
        last_idx_pos = turned_to_int_pos.last

        c1 = (0..8).any? { |n| n == first_idx_pos}
        c2 = (0..8).any? { |n| n == last_idx_pos}

        ( turned_to_int_pos.length == 2 ) && ( turned_to_int_pos.first.is_a?(Integer) ) && ( turned_to_int_pos.last.is_a?(Integer) ) && c1 && c2 
    end

    def enter_value
        puts "Enter a value"
        gets.chomp
    end

    def correct_val?(val)
        return false if !val.is_integer?
        ("1".."9").any? { |n| n == val }
    end
    

    

end