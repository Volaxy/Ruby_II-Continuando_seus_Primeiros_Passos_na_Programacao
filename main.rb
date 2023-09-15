def set_word
    "Programmer"
end

def kick_word(letters, errors)
    puts "You kick the letters: #{letters}"
    puts "You have #{errors} errors"
    puts "Choose a letter"

    gets.strip
end

def play
    points = 0
    letters = []
    errors = 0

    secret_word = set_word

    while errors < 5
        kick = kick_word(letters, errors)

        if letters.include? kick
            puts "Have you already kicked this letter!"

            next # Cancela a iteração atual e vai para a próxima iteração
        end

        letters << kick

        if secret_word.count(kick) == 0
            "Letter not found!"
            errors += 1
        end
    end

    puts "You won #{points} points!"
end

def want_to_play?
    puts "Do you want to play again? (S/N)"

    gets.strip.upcase == "S"
end


loop do
    play

    break if !want_to_play?
end