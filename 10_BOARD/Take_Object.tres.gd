extends RigidBody3D

@export var close_to_eyes_value : float = 0.7
var _origin_position : Vector3
var legend

var _is_select : bool = false

func _ready():
	
	angular_velocity = Vector3.ZERO
	linear_velocity = Vector3.ZERO
	_origin_position = global_position		
	legend = get_node_or_null("legend")
	
func show_legend(condition : bool):
	
	if condition:
		if legend:
			var legend_text = legend.get_legend()
			_global_datas._show_object_legend.emit(true,legend_text)
		else:
			var legend_text = "please add a legend node to this item"
			_global_datas._show_object_legend.emit(true,legend_text)	
	else: 
		_global_datas._show_object_legend.emit(false,"")
	
				
func _on_input_event(camera, event, _position, normal, shape_idx):

	if !_global_datas.Player_In_Inventory:
		return
	
	if event.is_action_pressed("Click"):
		
		_is_select =!_is_select
	
		if _is_select:
			_global_datas.Inventory_board_Object_isSelect = true
			show_legend(true)	
		else:
			_global_datas.Inventory_board_Object_isSelect = false
			show_legend(false)		
				
func _input(event):
	
	if _is_select:
		if event.is_action_pressed("Click"):		
			show_legend(false)
	
func show_obj():
	
	var dir = _global_datas.board_camera.get_camera_transform().basis.z
	var forward = -dir 
	global_position = _global_datas.board_camera.global_position + forward * 0.5
	show_legend(true)

func _ontable():
	
	angular_velocity = Vector3.ZERO
	linear_velocity = Vector3.ZERO
	#_global_datas.mouse_raycast.emit()
	#var posePosition = Vector3(_global_datas.mouseRaycastPosition.x,_global_datas.mouseRaycastPosition.y,_global_datas.mouseRaycastPosition.z)
	global_position = _origin_position

	_global_datas.Inventory_board_Object_isSelect = false
	show_legend(false)

