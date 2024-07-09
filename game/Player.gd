extends Sprite2D

# Old
var pos1 = 160
var pos2 = 160 * 3
var pos3 = 160 * 5

var pos = 1

# New position system
var fields_x = 3
var fields_y = 3

var pos_x = 1
var pos_y = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	var x = 0
	var y = 0
	
	if Input.is_action_just_pressed("ui_left"):
		x -= 1
	if Input.is_action_just_pressed("ui_right"):
		x += 1
	if Input.is_action_just_pressed("ui_up"):
		y += 1
	if Input.is_action_just_pressed("ui_down"):
		y -= 1
	
	move(x, y)

# dir_x: x-Direction - negative: left, positive: right
# dir_y: y-Direction - negativ: down, positive: up
func move(dir_x, dir_y):
	# Left
	if dir_x < 0 and pos_x > 1:
		pos_x -= 1
	
	# Right
	if dir_x > 0 and pos_x < fields_x:
		pos_x += 1
	
	# Down
	if dir_y < 0 and pos_y < fields_y:
		pos_y += 1
	
	# Up
	if dir_y > 0 and pos_y > 1:
		pos_y -= 1
	
	update_position()

func update_position():
	position = Vector2((texture.get_width() * scale.x / 2) + (pos_x - 1) * texture.get_width() * scale.x, (texture.get_height() * scale.y / 2) + (pos_y - 1) * texture.get_height() * scale.y)

# Old
#func move(direction):
	#if(direction < 0):
		#if(pos == 1):
			#return
		#pos -= 1	
	#if(direction > 0):
		#if(pos == 3):
			#return
		#pos += 1
	#update_position()

#func update_position():
	#if(pos == 1):
		#position.x = pos1
	#elif(pos == 2):
		#position.x = pos2
	#elif(pos == 3):
		#position.x = pos3
