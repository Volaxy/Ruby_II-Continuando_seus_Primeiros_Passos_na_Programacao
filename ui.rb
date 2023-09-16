def show_board(mask, letters, errors)
    puts "Secret Word: #{mask}"
    puts "You kick the letters: #{letters}"
    puts "You have #{errors} errors"
end

def kick_letter
    puts "Choose a letter"

    gets.strip
end

def want_to_play?
    puts "Do you want to play again? (S/N)"

    gets.strip.upcase == "S"
end