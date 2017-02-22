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

#####TODo
#add STDIN.getch
#Error output when you input not 1/2/3/4
#use Hashes
#random damage is determined when the move object is created. make it so damage is randomised eery time
#taking turns
#2nd player
#types weakness/strengths should be in arrays (squirtle isnt weak to grass right now)
#make a database of pokemon/spells, and the game pull the data from there.
#chance to critical changes per move
#move poke picker into a class
#add def self.all to the game initiator
#add catpix gemsr
  #clear from a certain spot (ie doesnt clear the pictures of the pokemon, but clears the text i put)
#use class inheritance

require "./classes"
require "./data"
require "paint"
require "terminal-table"

system 'clear'
#########Type List
electric = Type.new(Paint["Electric", :yellow], "electric", "water", "grass")
water = Type.new(Paint["Water", :blue], "water", "fire", "electric")
normal = Type.new(Paint["Normal", [168, 168, 168]], "none", "none", "none")
fire = Type.new(Paint["Fire", :red], "fire", "grass", "water")
grass = Type.new(Paint["Grass", :green], "grass", "water", "fire")

#########Moves list
thundershock = Move.new(Paint["Thundershock", :yellow], rand(10..20), electric)
thunderbolt = Move.new(Paint["Thunderbolt", :yellow], rand(15..25), electric)
headbutt = Move.new("Headbutt", rand(5..10), normal)
fart = Move.new("Fart", rand(1..5), normal)
water_gun = Move.new(Paint["Water Gun", :blue], rand(10..20), water)
bubblebeam = Move.new(Paint["Bubblebeam", :blue], rand(15..25), water)
ember = Move.new(Paint["Ember", :red], rand(10..20), fire)
flamethrower = Move.new(Paint["Flamethrower", :red], rand(15..25), fire)
razor_leaf = Move.new(Paint["Razor Leaf", :green], rand(10..20), grass)
solar_beam = Move.new(Paint["Solar Beam", :green], rand(15..25), grass)

##### Pokemon List
pikachu = Pokemon.new(Paint["Pikachu", :yellow], 100, electric, [thundershock, thunderbolt, headbutt, fart])
squirtle = Pokemon.new(Paint["Squirtle", :blue], 100, water, [water_gun, bubblebeam, headbutt, fart])
charmander = Pokemon.new(Paint["Charmander", :red], 100, fire, [ember, flamethrower, headbutt, fart])
bulbasaur = Pokemon.new(Paint["Bulbasaur", :green], 100, grass, [razor_leaf, solar_beam, headbutt, fart])

new_game = Initialize_game.new(1)

pokemons = []

puts "Would you like to be 1.Pikachu, 2.Squirtle, 3.Charmander, or 4.Bulbasaur?"
chosen_pokemon = gets.chomp.to_i
puts "Would you like your opponent to be 1.Pikachu, 2.Squirtle, 3.Charmander, or 4.Bulbasaur?"
chosen_enemy = gets.chomp.to_i
case chosen_pokemon
  when 1
    pokemons.push(pikachu)
  when 2
    pokemons.push(squirtle)
  when 3
    pokemons.push(charmander)
  when 4
    pokemons.push(bulbasaur)
end

case chosen_enemy
  when 1
    pokemons.push(pikachu)
  when 2
    pokemons.push(squirtle)
  when 3
    pokemons.push(charmander)
  when 4
    pokemons.push(bulbasaur)
end

new_game.begin_turn(pokemons.at(0), pokemons.at(1))
