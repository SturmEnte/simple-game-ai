extends Node2D

var player
var target

var fields_x = 3
var fields_y = 3

func _ready():
	player = get_node("Player")
	target = get_node("Target")
	
	if(target.has_method("move_to_random_position")):
		target.move_to_random_position()
	else:
		print("Error: Target does not have required method for the game to work")

func _process(delta):
	
	if player.pos_x == target.pos_x and player.pos_y == target.pos_y:
		target.move_to_random_position()
