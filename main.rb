require 'pry-byebug'
require_relative 'lib/game'
require_relative 'lib/file_handler'
require 'yaml'
include PlayGame


#Gameplay setup and welcome display
welcome

if game_type == 'N'

  player = Game.new(get_word)
  player.load_match_array

else

  player = Game.load_file

end
loop do
  #Main gameplay cycle(auto exits when player runs out of incorrect guesses)
  loop do
    #Display matches, wrong guesses and chances remaining
    puts "\n\nMatches: #{player.matches.join(' ')}  Incorrect: #{player.incorrect_guesses[0].join(' ')}   Chances Remaining: #{player.incorrect_guesses[1].to_s}"
    
    #Shows win message and exits gameplay if a full match is made or lose message if chances are used up
    break if check_win(player.matches, player.secret_word) || check_lose(player.incorrect_guesses[1][0], player.secret_word)

    #Collects a letter or saves current state and exits
    choice = guess_or_save

    if choice == '1'
      player.save
      break
    else
      player.try_letter(choice)
    end

  end
  
  #Starts game again with new object(effectively a reset)
  if play_again
    player = nil#Allows player object to be picked up by garbage collector
    player = Game.new(get_word)
  else
    break
  end

end
puts "hi"
