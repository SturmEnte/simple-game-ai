extends Node2D

var player
var enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("Player")
	enemy = get_node("Enemy")
	
	if(enemy.has_method("move_to_random_position")):
		enemy.move_to_random_position()
	else:
		print("Error: Enemy does not have required method for the game to work")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
