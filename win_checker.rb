class Win_checker
  
    def extract_obj_values(arr)
        values = []
        arr.each { |ele| values << ele.value }
        values
    end

    #This is for checking rows if the player won
    def checking_algorithm_one_row(row_values)
        (1..9).all? do |num|
            row_values.include?(num.to_s)
        end
    end

    def checking_all_rows(board)
        board.all? do |row|
            extracted_values = extract_obj_values(row)
            checking_algorithm_one_row(extracted_values)
        end
    end
    #-------------------------------------------

    #Now this is for checking cols

    def hash_of_cols
        hash_of_cols = Hash.new(0)

        (0..8).each do |col_n|
            hash_of_cols[col_n] = Array.new
        end

        hash_of_cols
    end

    def extract_cols_values(board)
        hash_of_cols = hash_of_cols()

        board.each_with_index do |row, i|
            row.each_with_index do |col, j|
                hash_of_cols[j] << board[i][j].value
            end
        end

        hash_of_cols
    end

    def checking_algorithm_one_col(col)
        (1..9).all? do |num|
            col.include?(num.to_s)
        end
    end

    def checking_algorithm_all_cols(hash)
        cols = hash.values
        cols.all? { |col| checking_algorithm_one_row(col) }
    end
    
    def extract_values_of_square(i_row, j_row, i_col, j_col, board)
        square_values = []

        (i_row..j_row).each do |row_idx|
            (i_col..j_col).each do |col_idx|

                square_values << board[row_idx][col_idx].value

            end
        end

        square_values
    end

    def extract_val_first_square(board)
        extract_values_of_square(0, 2, 0, 2, board)
    end
    def extract_val_sec_square(board)
        extract_values_of_square(0, 2, 3, 5, board)
    end
    def extract_val_third_square(board)
        extract_values_of_square(0, 2, 6, 8, board)
    end
    def extract_val_fourth_square(board)
        extract_values_of_square(3, 5, 0, 2, board)
    end
    def extract_val_fifth_square(board)
        extract_values_of_square(3, 5, 3, 5, board)
    end
    def extract_val_sixth_square(board)
        extract_values_of_square(3, 5, 6, 8, board)
    end
    def extract_val_seventh_square(board)
        extract_values_of_square(6, 8, 0, 2, board)
    end
    def extract_val_eighth_square(board)
        extract_values_of_square(6, 8, 3, 5, board)
    end
    def extract_val_ninth_square(board)
        extract_values_of_square(6, 8, 6, 8, board)
    end

    def squares_checkers(board)
        (1..9).all? do |num|
            c1 = extract_val_first_square(board).include?(num.to_s)
            c2 = extract_val_sec_square(board).include?(num.to_s)
            c3 = extract_val_third_square(board).include?(num.to_s)
            c4 = extract_val_fourth_square(board).include?(num.to_s)
            c5 = extract_val_fifth_square(board).include?(num.to_s)
            c6 = extract_val_sixth_square(board).include?(num.to_s)
            c7 = extract_val_seventh_square(board).include?(num.to_s)
            c8 = extract_val_eighth_square(board).include?(num.to_s)
            c9 = extract_val_ninth_square(board).include?(num.to_s)

            c1 && c2 && c3 && c4 && c5 && c6 && c7 && c8 && c9
        end
    end
   


end