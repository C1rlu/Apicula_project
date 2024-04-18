extends Node


@export var orber_tool : tool_data 
@export var scanner_spawner_tool : tool_data

@onready var process_link = $"../../../Process_link"
@onready var path_3d : Path3D = $"../../../Process_link/Path3D"


var _is_processing : bool = false
var start_position : Vector3

var curve

func _ready():
	
	curve = path_3d.get_curve()
	
	scanner_spawner_tool.tool_active_signal.connect(disable)
	
func _process(delta):
	
	if !_global_datas.Player_InSubScene:
		return
	if !_is_processing:
		return

	var end_position = _global_datas._orbe_tool_origin_position

	curve.set_point_position(0, start_position)
	curve.set_point_position(1, end_position)
	
	check_distance()
func check_distance():
	
	var end_position = _global_datas._orbe_tool_origin_position
	var distance = start_position.distance_squared_to(end_position)
	
	if distance > 4.0:
		disable_ray()
	#print(distance)
	
func _on_orbe_instancer_process_link(condition, start_point):
	
	
	process_link.visible = condition
	
	_is_processing = condition
	if !start_point:
		return
	start_position = start_point

func disable(condition):

	process_link.visible = false
	_is_processing = false
	orber_tool.cancel_action_signal.emit()
	


func disable_ray():

	process_link.visible = false
	_is_processing = false
	orber_tool.cancel_action_signal.emit()
	_global_datas._photo_flash.emit()
