require_relative "ui" # O "require_relative" referencia arquivos locais

def set_word
    "Programmer"
end

def update_mask(secret_word, letters, mask)
    mask = ""
    
    for char in secret_word.chars
        if letters.include? char
            mask << char
        else
            mask << "_"
        end
    end

    mask
end

def play
    points = 0
    letters = []
    errors = 0
    secret_word = set_word
    mask = ""
    
    mask = update_mask(secret_word, letters, mask)
    
    while errors < 5
        show_board(mask, letters, errors)
        kick = ""
        
        loop do
            kick = kick_letter

            if !letters.include? kick
                break
            end

            puts "Have you already kicked this letter!"
        end

        letters << kick

        if secret_word.count(kick) == 0
            "Letter not found!"
            errors += 1
        else
            mask = update_mask(secret_word, letters, mask)
        end
    end

    puts "You won #{points} points!"
end

loop do
    play

    break if !want_to_play?
end