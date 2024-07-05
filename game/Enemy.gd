extends Sprite2D

var pos1 = 160
var pos2 = 160 * 3
var pos3 = 160 * 5

var pos = 1

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func move_to_random_position():
	pos = round(rng.randf_range(1, 3))
	update_position()

#func move(direction):
#	if(direction < 0):
#		if(pos == 1):
#			return
#		pos -= 1	
#	if(direction > 0):
#		if(pos == 3):
#			return
#		pos += 1
#	update_position()

func update_position():
	if(pos == 1):
		position.x = pos1
	elif(pos == 2):
		position.x = pos2
	elif(pos == 3):
		position.x = pos3
