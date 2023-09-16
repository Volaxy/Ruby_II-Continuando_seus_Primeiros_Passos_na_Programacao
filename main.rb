require_relative "ui"

def set_word
    words = File.read("dictionary.txt") # Essa função lê um arquivo da pasta local
    words = words.split "\n" # Transforma em um array separando a string pelos "\n"

    words[rand(words.size)].downcase # Transforma o texto em lowercase
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

        if mask == secret_word
            puts "You Won!"

            break
        end
    end
end

loop do
    play

    break if !want_to_play?
end