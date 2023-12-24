#message = string to encrypt
#shift = positive number to shift message down the alphabet
def caesar_cipher(message, shift) 
    #limit shift to be at most one wrap around through the alphabet via remainder of 26
    shift > 26 ? shift = shift%26 : false

    shifted_chars = message.split("").map do |letter|
            #Handle lower case wrap
            if letter.ord > 96 and letter.ord < 123
                letter.ord + shift > 122 ? 
                letter = letter.ord + shift - 26 : 
                letter = letter.ord + shift  

            #Handle upper case wrap
            elsif letter.ord > 64 and letter.ord < 91
                letter.ord + shift > 89 ? 
                letter = letter.ord + shift - 26 :
                letter = letter.ord + shift
            #Handle special characters and spaces  
            else
                letter = letter
            end
    end

    #Convert the integers to their new characters, joins, and prints the new message
    puts shifted_chars.map{|x| x = x.chr }.join("")
end

caesar_cipher("What a string!", 5)