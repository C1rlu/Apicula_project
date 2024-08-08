extends Node

@export var subjet_effect : tool_data

@onready var player_sub = $".."

var _push_top : bool = false

func _ready():
	
	subjet_effect.tool_active_signal.connect(_active)
	
func _active(condition : bool):

	player_sub.stop_control = condition
	_push_top = condition
	
func _process(delta):
	
	if _push_top:
		var goingUp = player_sub.transform.basis.y
		player_sub.apply_central_force(goingUp * 12)
