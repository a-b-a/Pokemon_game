#####################ToDO-COMPLETE:
#Somehow make taking a turn into a class DONE
#Add pokemon type DONE
#Add tech type DONE
#add interaction between tech type and pokemon type DONE
#critical chance DONE
#####Sat 18 Feb####
#make new files for the class lists and shit DONE
  #Have to make new objects in game.rb though
#put moves into an array DONE
#use gems paint for pokemon names DONE
#use gems paint for move names DONE
#use gems terminal for tables DONE
#add new moves, pokemon DONE
#choose pokemon DONE
#####Sun 19 Feb####
#health counter colour changer DONE
#add STDIN.getch
#random damage is determined when the move object is created. make it so damage is randomised eery time
#slowly roll text out


#####TODo
#README
#Error output when you input not 1/2/3/4
#use Hashes
#taking turns
#2nd player
#types weakness/strengths should be in arrays (squirtle isnt weak to grass right now)
#make a database of pokemon/spells, and the game pull the data from there.
#chance to critical changes per move
#move poke picker into a class
#do pictures for each move?
#add def self.all to the game initiator
#add catpix gemsr
  #clear from a certain spot (ie doesnt clear the pictures of the pokemon, but clears the text i put)
#use class inheritance
#pokemon music

require "./classes"
require "./data"
require "paint"
require "terminal-table"
require "IO/console"

system 'clear'
#########Type List
electric = Type.new(Paint["Electric", :yellow], "electric", "water", "grass")
water = Type.new(Paint["Water", :blue], "water", "fire", "electric")
normal = Type.new(Paint["Normal", [168, 168, 168]], "none", "none", "none")
fire = Type.new(Paint["Fire", :red], "fire", "grass", "water")
grass = Type.new(Paint["Grass", :green], "grass", "water", "fire")

#########Moves list
thundershock = Move.new(Paint["Thundershock", :yellow], 10, 20, electric)
thunderbolt = Move.new(Paint["Thunderbolt", :yellow], 15, 25, electric)
headbutt = Move.new("Headbutt", 5, 10, normal)
fart = Move.new("Fart", 1, 5, normal)
water_gun = Move.new(Paint["Water Gun", :blue], 10, 20, water)
bubblebeam = Move.new(Paint["Bubblebeam", :blue], 15, 25, water)
ember = Move.new(Paint["Ember", :red], 10, 20, fire)
flamethrower = Move.new(Paint["Flamethrower", :red], 15, 25, fire)
razor_leaf = Move.new(Paint["Razor Leaf", :green], 10, 20, grass)
solar_beam = Move.new(Paint["Solar Beam", :green], 15, 25, grass)

##### Pokemon List
pikachu = Pokemon.new(Paint["Pikachu", :yellow], 100, electric, [thundershock, thunderbolt, headbutt, fart])
squirtle = Pokemon.new(Paint["Squirtle", :blue], 100, water, [water_gun, bubblebeam, headbutt, fart])
charmander = Pokemon.new(Paint["Charmander", :red], 100, fire, [ember, flamethrower, headbutt, fart])
bulbasaur = Pokemon.new(Paint["Bulbasaur", :green], 100, grass, [razor_leaf, solar_beam, headbutt, fart])

new_game = InitializeGame.new(1)

pokemons = []

slow_text("Player 1 - Would you like to be 1.Pikachu, 2.Squirtle, 3.Charmander, or 4.Bulbasaur?")
chosen_pokemon = STDIN.getch.to_i
case chosen_pokemon
  when 1
    pokemons.push(pikachu)
  when 2
    pokemons.push(squirtle)
  when 3
    pokemons.push(charmander)
  when 4
    pokemons.push(bulbasaur)
  else
    slow_text("You did not enter a valid command!")
end

slow_text("Player 2 - Would you like to be 1.Pikachu, 2.Squirtle, 3.Charmander, or 4.Bulbasaur?")
chosen_enemy = STDIN.getch.to_i
case chosen_enemy
  when 1
    pokemons.push(pikachu)
  when 2
    pokemons.push(squirtle)
  when 3
    pokemons.push(charmander)
  when 4
    pokemons.push(bulbasaur)
  else
    slow_text("You did not enter a valid command!")
end

new_game.begin_turn(pokemons.at(0), pokemons.at(1))
