extends Node



@export var _tool : tool_data
@onready var timer = $Timer


func _ready():
	
	_tool.tool_active_signal.connect(call_sonar)

func call_sonar(condition):
	
	
	if !timer.is_stopped():
		return
	
	timer.start()	
	if condition:
		_global_datas.subscene_sonar_effect.emit(_global_datas.player_rg.position)
