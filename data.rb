# require "./classes"
# require "paint"
#
# #########Type List
# electric = Type.new(Paint["Electric", :yellow], "electric", "water", "none")
# water = Type.new(Paint["Water", :blue], "water", "none", "electric")
# normal = Type.new(Paint["Normal", [168, 168, 168]], "none", "none", "none")
#
# #########Moves list
# thundershock = Move.new(Paint["Thundershock", :yellow], rand(10..20), electric)
# thunderbolt = Move.new(Paint["Thunderbolt", :yellow], rand(15..25), electric)
# headbutt = Move.new("Headbutt", rand(5..10), normal)
# fart = Move.new("Fart", rand(1..5), normal)
# water_gun = Move.new(Paint["Water Gun", :blue], rand(10..20), water)
# bubblebeam = Move.new(Paint["Bubblebeam", :blue], rand(15..25), water)
#
# ##### Pokemon List
# pikachu = Pokemon.new(Paint["Pikachu", :yellow], 100, electric, [thundershock, thunderbolt, headbutt, fart])
# squirtle = Pokemon.new(Paint["Squirtle", :blue], 100, water, [water_gun, bubblebeam, headbutt, fart])
