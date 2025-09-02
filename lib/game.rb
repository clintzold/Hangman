

class Game

  attr_accessor :name, :secret_word, :incorrect_guesses, :matches

  def initialize(word, name, incorrect_guesses, matches)
    @name = name
    @secret_word = word
    @incorrect_guesses = incorrect_guesses
    @matches = matches
  end

  def save
    File.open("./saves/hangman_save_#{self.name}.yml", "w") do |file|
      file.puts YAML.dump({
        :name => @name,
        :secret_word => @secret_word,
        :incorrect_guesses => @incorrect_guesses,
        :matches => @matches
      })
    end
  end

  def self.load_file(selected_file)
    file = File.read("./saves/#{selected_file}.yml") 
    data = YAML.unsafe_load file
    p data
    self.new(data[:secret_word], data[:name], data[:incorrect_guesses], data[:matches])

  end

end
