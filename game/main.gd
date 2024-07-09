extends Node2D

var player
var target

var fields_x = 3
var fields_y = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("Player")
	target = get_node("Target")
	
	if(target.has_method("move_to_random_position")):
		target.move_to_random_position()
	else:
		print("Error: Target does not have required method for the game to work")

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
