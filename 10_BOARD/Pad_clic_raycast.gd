extends Node

var _active : bool = false
@onready var pad_target = $"../BOARD_UI/SubViewport/Pad_target"
@onready var  Camera = $"../Camp_root_XRay/Camera_xray"

func _ready():
	_global_datas.using_pad.connect(_active_raycast)
	
func _active_raycast(condition : bool):
	_active = condition			

func _input(event):
	
	if !_active:
		return
		
	if !_global_datas.Player_In_Inventory:
		return	
			
	if event.is_action_pressed("Click"):
		check_cast()
		

func check_cast():
		
	var targetPos = pad_target.position
	var rayLengh = 1000.0
	var from = Camera.project_ray_origin(targetPos)
	var to = from + Camera.project_ray_normal(targetPos) * rayLengh
	var space = Camera.get_world_3d().direct_space_state
	var rayQuery = PhysicsRayQueryParameters3D.new()
	rayQuery.from = from
	rayQuery.to = to
	rayQuery.collide_with_areas = true
	rayQuery.collide_with_bodies = false

	var result = space.intersect_ray(rayQuery)
	if !result:
		_global_datas.show_board_description.emit(false,"")	
		return
	var selectable = result.collider.get_node_or_null("Select_this")	
	
	if selectable:	
		selectable.show_legend(true)

	
