extends Sprite2D

var pos_x = 1
var pos_y = 1

var rng = RandomNumberGenerator.new()

#func _ready():
	#pass # Replace with function body.
#
#func _process(delta):
	#pass

func move_to_random_position():
	while true:
		pos_x = round(rng.randf_range(1, get_parent().fields_x))
		pos_y = round(rng.randf_range(1, get_parent().fields_y))
		
		if get_parent().player.pos_x != pos_x and get_parent().player.pos_y != pos_y:
			break
	
	update_position()

func update_position():
	position = Vector2((texture.get_width() * scale.x / 2) + (pos_x - 1) * texture.get_width() * scale.x, (texture.get_height() * scale.y / 2) + (pos_y - 1) * texture.get_height() * scale.y)
