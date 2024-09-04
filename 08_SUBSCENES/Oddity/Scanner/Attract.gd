extends Node

@export var color_attracted : Color
@export var rg : RigidBody3D
@export var strenght : float = 200
@export var Fade_OnScanner : Node

var target_dir : Vector3


var attract : bool = false

func _ready():
	tree_exited.connect(remove_from_list)

func attract_me(delta,position):


	target_dir = position
	
	var direction = (target_dir  - rg.global_position).normalized()	
	rg.apply_central_force(direction * strenght * delta)
	
	
		
func Push(strengh):
		
	var target = (rg.global_position - _global_datas.subbscene_playerPosition).normalized()
	rg.apply_impulse(target  * strengh)
	
func _attract(condition: bool):
	attract = condition	
	
	if condition:
		Fade_OnScanner._fade_out(color_attracted)
		rg._collect_element(true)
		
	else:
		rg._collect_element(false)
		
func _process(delta):
	
	if attract:
		var direction = (_global_datas.subbscene_playerPosition  - rg.global_position).normalized()	
		rg.apply_central_force(direction * strenght * delta)	

func remove_from_list():
	_subscene_datas.list_of_magnetable.erase(self)

