extends Node

@export var focus_data : boardCamState_data
@export var Main_root : Node3D
@export var On_Move : Node 
@export var broke_root : Node3D
@export var Particul_hit_root : Node3D
const HIT_PARTICULE_EFFECT = preload("res://10_BOARD/Element_Broke/Hit_particule_effect.tscn")

var unbroken_element : MeshInstance3D
var broken_element : Array[MeshInstance3D]

var element : element_data

func _ready():
	On_Move.On_Move.connect(broke_me)	
	broken_element.append_array(get_all_mesh(broke_root))
	broken_element.erase(unbroken_element)

func set_element(_element : element_data):
	element = _element
	
func get_all_mesh(scene) -> Array:
	var meshs: Array = []

	for node in scene.get_children():
		if node.name == "Result":
			unbroken_element = node
		if node is MeshInstance3D:
			meshs.append(node)
		# Recursively check children
		meshs += get_all_mesh(node)
		
	return meshs
	
func broke_me(condition):
	#print("BROKE ME")
	
	if unbroken_element.visible:
		for b in broken_element:
			b.visible = true	
		set_particule()
		unbroken_element.visible = false
		
		_global_datas.camera_focus_On.emit(focus_data)
		_global_datas.focus_this_on_board.emit(Main_root.global_position)
		return 
		
	
	if broken_element.size() == 1:
		element.Object_broke = true
		Main_root.queue_free()			
		
		
	_global_datas.camera_focus_On.emit(focus_data)
	_global_datas.focus_this_on_board.emit(Main_root.global_position)
	
	var random_hit = randi_range(0,broken_element.size()-1)
	broken_element[random_hit].queue_free()
	broken_element.erase(broken_element[random_hit])
	
	
	set_particule()

func set_particule():
	
	var instance_fx : GPUParticles3D = HIT_PARTICULE_EFFECT.instantiate()
	Particul_hit_root.add_child(instance_fx)	
	instance_fx.global_position = Particul_hit_root.global_position
	instance_fx.emitting = true
	
