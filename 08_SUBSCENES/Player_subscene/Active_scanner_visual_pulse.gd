extends Node

@export var scanner_tool_data : tool_data

@onready var _01 = $"../../Render_mesh/Scanner/01"
@onready var _02 = $"../../Render_mesh/Scanner/02"

@onready var timer = $Timer

var pulse : bool
var is_active : bool = false

func _ready():
	#scanner_tool_data.select_this_tool_scene_prefabs.connect(active_pulse)				
	scanner_tool_data.tool_active_signal.connect(active_pulse)		
func active_pulse(condition : bool):
	
	if condition:	
		timer.start()
	else:
		timer.stop()	
		_01.visible = false
		_02.visible = false
		
func _Alarm_pulse():
	
	pulse = !pulse
	_01.visible = pulse
	_02.visible = !pulse	


func _on_timer_timeout():
	_Alarm_pulse()	
