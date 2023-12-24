#hashmap of characters to ignore
IGNORE = [" ", ".", "!", "?", "-", ";", "'", "`", "[", "]", "|", "\\", "<", 
            ">", "=", "+", "@", "#", "$", "%", "^", "&", 
            "*", "(", ")", "_", "{", "}", ":", "/", "~", 
            "1", "2","3", "4", "5", "6", "7", "8", "9", "0"]
            .map{|x| [x,true]}
            .to_h

#message = string to encrypt
#shift = positive number to shift message down the alphabet
def caesar_cipher(message, shift) 
    #limit shift to be at most one wrap around through the alphabet via remainder of 26
    shift > 26 ? shift = shift%26 : false

    shifted_chars = message.split("").map do |letter|

        #Skip non-alphabet characters
        if IGNORE.has_key?(letter) 
            letter = letter

        #Handle the character shifting
        else 
            #Handle lower case wrap
            if letter.ord < 123 and letter.ord > 96 
                letter.ord + shift > 122 ? 
                letter = letter.ord + shift - 26 : 
                letter = letter.ord + shift  

            #Handle upper case wrap
            else 
                letter.ord + shift > 89 ? 
                letter = letter.ord + shift - 26 :
                letter = letter.ord + shift      
            end
        end
    end

    #Convert the integers to their new characters, joins, and prints the new message
    puts shifted_chars.map{|x| x = x.chr }.join("")
end

caesar_cipher("What a string!", 5)


#az = 97|122
#AZ = 65|90