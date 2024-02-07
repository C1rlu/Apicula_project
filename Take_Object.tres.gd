extends RigidBody3D

var click = false


@export var close_to_eyes_value : float = 0.7

func _ready():
	angular_velocity = Vector3.ZERO
	linear_velocity = Vector3.ZERO
			
func _process(_delta):
	

	if !_global_datas.Player_InBoard:
		return

	if !click:
		return
			
	var mousePos = get_viewport().get_mouse_position()
	var from = _global_datas.board_camera.project_ray_origin(mousePos)
	var dir = from -_global_datas.mouseRaycastPosition 
	var dir_normalized = dir .normalized()
	var new_direction = dir_normalized * close_to_eyes_value

	global_position = from - new_direction
	


func _on_input_event(camera, event, _position, normal, shape_idx):

	if !_global_datas.Player_In_Inventory:
		return
	if _global_datas.Player_lock_click:
		return
	if event.is_action_pressed("Click"):
		
		click = true

	if event.is_action_released("Click"):
		
		click = false	
		_ontable()	
			
func _input(event):
	
	if !_global_datas.Player_In_Inventory:
		return
	if _global_datas.Player_lock_click:
		return
	if !click:
		return
	
	if event.is_action_released("Click"):
		click = false	
		_ontable()

				

func _ontable():
	
	angular_velocity = Vector3.ZERO
	linear_velocity = Vector3.ZERO
	_global_datas.mouse_raycast.emit()
	var posePosition = Vector3(_global_datas.mouseRaycastPosition.x,_global_datas.mouseRaycastPosition.y,_global_datas.mouseRaycastPosition.z)
	global_position = posePosition
	click = false




