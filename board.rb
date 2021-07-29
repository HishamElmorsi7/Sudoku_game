require_relative "tale.rb"

class Board
    attr_reader :board
    
    file = File.open("puzzles/sudoku1.txt")
    PUZZLE = file.map(&:chomp).join.split("")

    def puzzle
        PUZZLE
    end

    def initialize
        @board = Array.new(9){Array.new(9, 0)}
    end

    def board_indices
        indicies = []
        @board.each_with_index do |row,i|
            row.each_with_index do |ele, j|
                indicies << [i, j]
            end
        end
        indicies
    end


    def initialize_board
        n_loops = board_indices.count
        (0...n_loops).each do |i|

            first_idx = board_indices[i].first
            last_idx = board_indices[i].last
            value = puzzle[i]

            @board[first_idx][last_idx] = Tale.new(value)
        end
    end

    def board_values
        values = []
        @board.flatten.each { |tale| values << tale.value }
        values
    end

    def print_board
        puts
        (0..8).each do |row|
            (0..8).each do |col|
                print @board[row][col].value + " "
            end
            puts
        end
        puts
    end

    def changable?(position)
        tale = @board[position.first.to_i][position.last.to_i]

        return true if tale.changable  == true
        false
    end

    def value(position)
        @board[position.first][position.last]
    end
    
end