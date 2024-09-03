extends Node


@export var min_distance_to_see : float  = 2.5
@export var speed : float

@onready var rapatrier_rg : RigidBody3D = $".."
var target : Vector3
var follow_target : bool  = false
var real_speed : float
@onready var mirror_element_oddity = $"../Mirror_element_oddity"

func _ready():

	_global_datas._photo_flash.connect(_check_if_player_is_close)
	
func _check_if_player_is_close():
	

	if mirror_element_oddity.State_selected != _global_datas.player_state:
		return
		
	var distance_to_player = rapatrier_rg.global_position.distance_to(_global_datas.subbscene_playerPosition) 
	
	if distance_to_player > min_distance_to_see :
		return
	if distance_to_player < 0.8:
		return	
		
	real_speed = speed * (distance_to_player / 1.5)
	if distance_to_player < 0.8:
		real_speed = speed * (distance_to_player / 8.0)
	follow_target = true	
	target = _global_datas.subbscene_playerPosition
	print("CHECK LIGHT")

		
	
func _process(delta):
	
	if !_global_datas.Player_InSubScene:
		return
	if _global_datas.Player_In_Inventory:
		return
	
	if mirror_element_oddity.State_selected != _global_datas.player_state:
		return
		
	_folow_player(delta)
	

func _folow_player(delta):
	
	
	if !follow_target:
		return
	var direction = (target  - rapatrier_rg.global_position).normalized()	
	rapatrier_rg.apply_central_force(direction * real_speed * delta)		
	
	var distance_to_target = rapatrier_rg.global_position.distance_to(target) 
		
	if distance_to_target < 0.5:
		follow_target = false	
		
	
