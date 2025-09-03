require_relative 'lib/game'
require_relative 'lib/gameplay'
require 'yaml'
include PlayGame


#Gameplay setup and welcome display
welcome

if game_type == 'N'

  player = Game.new(get_word)
  player.load_match_array#Populates @matches with '_' according to length of secret word

else

  player = Game.load_file

end

quit = false#Quick and dirty bugfix to exit game loop upon save
loop do
  #Main gameplay cycle(auto exits when player runs out of incorrect guesses)
  loop do
    #Display matches, wrong guesses and chances remaining
    puts "
    \n\nMatches: #{player.matches.join(' ')}  Incorrect: #{player.incorrect_guesses[0].join(' ')}   Chances Remaining: #{player.incorrect_guesses[1].to_s}"
    
    #Shows win message and exits gameplay if a full match is made or lose message if chances are used up
    break if check_win(player.matches, player.secret_word) || check_lose(player.incorrect_guesses[1][0], player.secret_word)

    #Collects a letter or saves current state and exits
    choice = guess_or_save

    if choice == '1'
      player.save
      quit = true
      break
    else
      player.try_letter(choice)
    end

  end
  
  #Prevents play_again from running if player chose to save game
  break if quit == true
  #Starts game again with new object(effectively a reset)
  if play_again
    player = nil#Allows player object to be picked up by garbage collector
    player = Game.new(get_word)
    player.load_match_array
  else
    puts "\n\nGoodbye!"
    break
  end

end
