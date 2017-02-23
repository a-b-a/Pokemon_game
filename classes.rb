require "paint"
require "terminal-table"
require "./data"
require "IO/console"

class InitializeGame
  def initialize(players)
    @players = players
  end

  attr_accessor :players

# This will need to be made when i can put type/move/poke list in a diff file
  # def choose_pokemon
  #   puts "Would you like to be 1.Pikachu or 2.Squirtle?"
  #   chosen_pokemon = STDIN.getch.to_i
  #   case chosen_pokemon
  #   when 1
  #     @players.begin_turn(pikachu, squirtle)
  #   when 2
  #     @players.begin_turn(squirtle, pikachu)
  #   end
  # end

  def begin_turn(your_pokemon, enemy_pokemon)
    your_pokemon.choose_turn(your_pokemon, enemy_pokemon)
  end

end

class Pokemon
  def initialize(name, health, type, movelist)
    @name = name
    @health = health
    @type = type
    @movelist = movelist
  end

  attr_accessor :name, :health, :type, :movelist
# enemy squirtle, thundershock
  def choose_turn(your_pokemon, enemy_pokemon)
    slow_text("#{your_pokemon.name}'s starting health is #{your_pokemon.health}. His type is #{your_pokemon.type.type_name}.")
    slow_text("#{enemy_pokemon.name}'s starting health is #{enemy_pokemon.health}. Her type is #{enemy_pokemon.type.type_name}.")

    while enemy_pokemon.health > 0 do
      slow_text("Which move would you like to do?")
      table = Terminal::Table.new do |t|
        t << ["1. #{your_pokemon.movelist.at(0).move_name}", "2. #{your_pokemon.movelist.at(1).move_name}"]
        t << :separator
        t.add_row ["3. #{your_pokemon.movelist.at(2).move_name}","4. #{your_pokemon.movelist.at(3).move_name}"]
      end
      puts (table)
      action = STDIN.getch.to_i
      case action
      when 1
        your_pokemon.take_turn(your_pokemon, enemy_pokemon, your_pokemon.movelist.at(0))
      when 2
        your_pokemon.take_turn(your_pokemon, enemy_pokemon, your_pokemon.movelist.at(1))
      when 3
        your_pokemon.take_turn(your_pokemon, enemy_pokemon, your_pokemon.movelist.at(2))
      when 4
        your_pokemon.take_turn(your_pokemon, enemy_pokemon, your_pokemon.movelist.at(3))
      end
      #slow_text("#{enemy_pokemon.name}'s health is now #{enemy_pokemon.health}")
    end
    slow_text("#{enemy_pokemon.name} has fainted!")
  end

  def take_turn(your_pokemon, enemy_pokemon, move_used)
    system 'clear'
    slow_text("#{your_pokemon.name} used #{move_used.move_name}!")
    enemy_type = enemy_pokemon.type #water - the type of the opposing pokemon
    damage_dealt = rand(move_used.min_damage..move_used.max_damage) #the damage to be dealt to pokemon
    move_type = move_used.move_type #electric the type of the move used
    #squirtle, water, damage dealth, electric
    take_damage(enemy_pokemon, enemy_type, damage_dealt, move_type)
  end
                  #squirtle, water, damage dealth, electric
  def take_damage(pokemon, pokemon_type, original_damage_dealt, move_type) #move_type should be the string of the spell
    #checks if the move used is strong against enemy pokemon type
    damage_modifier = move_type.weakness_test(pokemon_type, move_type)
    #2% crit chance is done here
    if rand(1-100) <= 2
      damage_modifier += 1
      slow_text("Critical Hit!")
    end
    #applies the crit and weakness modifiers to the final damage
    full_damage_dealt = (original_damage_dealt * damage_modifier)
    #removes full damage from enemy pokemon health
    pokemon.update_health(pokemon, full_damage_dealt)
    #just for testing the damage purposes
    slow_text("original damage dealt is #{original_damage_dealt}, damage modifier is #{damage_modifier}, thus full damage dealt is #{full_damage_dealt}")
  end

  def update_health(pokemon, damage)
      pokemon.health -= damage
      slow_text("You dealt #{damage}")
      if pokemon.health > 74
        slow_text("#{pokemon.name}'s health is now #{Paint[pokemon.health, :green]}")
      elsif pokemon.health > 24
        slow_text("#{pokemon.name}'s health is now #{Paint[pokemon.health, :yellow]}")
      else
        slow_text("#{pokemon.name}'s health is now #{Paint[pokemon.health, :red]}")
      end
      #slow_text("original damage dealt is #{original_damage_dealt}, damage modifier is #{damage_modifier}, thus full damage dealt is #{full_damage_dealt}")
  end

end

class Move
  def initialize(move_name, min_damage, max_damage, move_type)
    @move_name = move_name
    @min_damage = min_damage
    @max_damage = max_damage
    @move_type = move_type
  end
  attr_accessor :move_name, :min_damage, :max_damage, :move_type
end

class Type
  def initialize(type_name, type_is, type_strength, type_weakness)
    @type_name = type_name
    @type_is = type_is
    @type_strength = type_strength
    @type_weakness = type_weakness
  end

  attr_accessor :type_name, :type_is, :type_strength, :type_weakness

  def weakness_test(pokemon_type, move_type)
    #water name string, electric strength string
    if pokemon_type.type_is == move_type.type_weakness
      slow_text("It's not very effective..")
      return 0.5
    elsif pokemon_type.type_is == move_type.type_strength
      slow_text("It's super effective!")
      return 1.5
    else
      return 1
    end
  end

end

def slow_text(string_to_slow)
  string_to_slow.concat("\n").each_char {|c| putc c ; sleep 0.005; $stdout.flush }
end
