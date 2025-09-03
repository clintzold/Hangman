

class Game

  attr_accessor :name, :secret_word, :incorrect_guesses, :matches

  def initialize(word, incorrect_guesses = [[], [6]], matches = [])
    
    @secret_word = word.split('')
    @incorrect_guesses = incorrect_guesses
    @matches = matches
  
  end

  #Loads blank match array with '_' according to secret word length
  def load_match_array
    
    self.secret_word.each do 
      self.matches << '_'
    end
    return self.matches
  
  end

  #Saves current game state in YAML format
  def save
    
    File.open("./saves/last_game.yml", "w") do |file|
      file.puts YAML.dump({
        
        :secret_word => @secret_word.join(''),
        :incorrect_guesses => @incorrect_guesses,
        :matches => @matches
     
      })
    end
    puts "Game was saved. See you next time!"

  end

  #Checks for match, populates match array or incorrect array accordingly. Also decrements guesses left
  def try_letter(choice)

    if self.secret_word.any? {|letter| letter == choice}
      self.secret_word.each_with_index do |letter, index|
        self.matches[index] = letter if letter == choice
      end
    else 
      self.incorrect_guesses[0] << choice
      self.incorrect_guesses[1][0] -= 1
    end

  end
  #Loads the previous game object's state into new object
  def self.load_file
    
    file = File.read("./saves/last_game.yml") 
    data = YAML.unsafe_load file
    self.new(data[:secret_word], data[:incorrect_guesses], data[:matches])
  
  end

  
end
