extends Node

@onready var process_link = $"../../../Process_link"
@onready var path_3d : Path3D = $"../../../Process_link/Path3D"


var _is_processing : bool = false
var start_position : Vector3

var curve

func _ready():

	curve = path_3d.get_curve()
	
func _process(delta):
	
	if !_is_processing:
		return

	var end_position = _global_datas._orbe_tool_origin_position

	curve.set_point_position(0, start_position)
	curve.set_point_position(1, end_position)


func _on_orbe_instancer_process_link(condition, start_point):
	
	process_link.visible = condition
	
	_is_processing = condition
	start_position = start_point

