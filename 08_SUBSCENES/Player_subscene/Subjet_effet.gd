extends Node

@export var subjet_effect : tool_data


var _push_top : bool = false

func _ready():

	subjet_effect.tool_active_signal.connect(_active)
	_global_datas._backFrom_subscene.connect(reset)
	
	
func reset():

	_push_top = false
		
func _active(condition : bool):
	pass
