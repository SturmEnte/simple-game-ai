extends Node2D

var player
var target

var fields_x = 3
var fields_y = 3

@export var websocket_url = "ws://localhost:8765"
var socket = WebSocketPeer.new()

func _ready():
	player = get_node("Player")
	target = get_node("Target")
	
	if(target.has_method("move_to_random_position")):
		target.move_to_random_position()
	else:
		print("Error: Target does not have required method for the game to work")
	
	# Websocket
	var err =  socket.connect_to_url(websocket_url)
	if err != OK:
		print("Unable to connect")
		set_process(false)
	else:
		print("connected")

func _process(delta):
	if player.pos_x == target.pos_x and player.pos_y == target.pos_y:
		target.move_to_random_position()
	
	# Websocket
	socket.poll()
	var state = socket.get_ready_state()
	if state == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			_on_message_received(socket.get_packet())
	elif state == WebSocketPeer.STATE_CLOSING:
		# Keep polling to achieve proper close.
		pass
	elif state == WebSocketPeer.STATE_CLOSED:
		var code = socket.get_close_code()
		var reason = socket.get_close_reason()
		_on_closed(code, reason)

func _on_message_received(packet: PackedByteArray):
	var message = packet.get_string_from_utf8()
	print("WebSocket message received: %s" % message)

func _on_closed(code, reason):
	print("WebSocket closed with code: %d, reason %s. Clean: %s" % [code, reason, code != -1])
	set_process(false) # Stop processing.

func _send_message(message : String):
	var state = socket.get_ready_state()
	if state == WebSocketPeer.STATE_OPEN:
		socket.send_text(message)
