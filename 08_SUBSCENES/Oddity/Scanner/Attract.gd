extends Node

@export var color_attracted : Color
@export var rg : RigidBody3D
@export var strenght : float = 200


var target_dir : Vector3


func _ready():
	tree_exited.connect(remove_from_list)

		
func Push(strengh):
		
	var target = (rg.global_position - _global_datas.subbscene_playerPosition).normalized()
	rg.apply_impulse(target  * strengh)
	
func _attract(delta,_position):

	target_dir = _position
	
	var direction = (target_dir  - rg.global_position).normalized()	
	rg.apply_central_force(direction * strenght * delta)
	

		
func remove_from_list():
	_subscene_datas.list_of_magnetable.erase(self)

