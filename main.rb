require 'pry-byebug'
require_relative 'lib/game'
require_relative 'lib/file_handler'
require 'yaml'
include CreateGame
player = Game.new(get_word, 'Clint', [], [])
binding.pry
puts "hi"
