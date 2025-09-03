module PlayGame

  def welcome

    puts "\n\nWelcome to HANGMAN!\n"

  end

  def get_word

    array = []

    File.foreach('./lib/dictionary.txt') do |word|
      
      if word.length < 12 && word.length > 5

        array << word.chomp.downcase

      end

    end
    
    return array.sample
 
  end
  

  def game_type
   
    puts "Start a (N)ew Game or (L)oad a previous session?"
    
    loop do
    
      type = gets.chomp.upcase
      
      if type == 'N' || type == 'L'
      
        return type
      
      else 
      
        puts "\nInvalid choice. Select (N)ew Game or (L)oad previous session"
      
      end
    
    end
  
  end

  def guess_or_save
  
    puts "\nEnter a letter to make a guess, or (1) to Save Game"

    loop do
      choice = gets.chomp.downcase
      if choice.length > 1
        puts "Please enter ONE letter..."
        next
      else 
        return choice
      end
    end
  
  end

  def check_win(matches, word)

    if matches == word
      puts "\nYou win! Secret Word was '#{word.join('')}'!"
      return true 
    else
      return false
    end

  end

  def check_lose(chances, word)

    if chances == 0
      puts "\nYou lose! Secret Word was '#{word.join('')}'!"
      return true
    else
      return false
    end

  end

  def play_again
    
    loop do
      puts "\nWould you like to play again? (Y) or (N)?"
      choice = gets.chomp.upcase
      if choice == 'Y'
        return true
      elsif choice == 'N'
        return false
      else
        next
      end
    end

  end

end
