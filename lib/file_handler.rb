module CreateGame


  def get_word
    array = []
    File.foreach('./lib/dictionary.txt') do |word|
      if word.length < 12 && word.length > 5
        array << word.chomp.downcase
      end
    end
    return array.sample
  end
  
  def get_name
    puts "Please enter your name..."
    return gets.chomp.capitalize
  end

end
