
extends Node

@export var manget_tool : tool_data
@export var magnet_fx : GPUParticles3D
@export var collector_collider : CollisionShape3D
@onready var root = $".."
var magneting : bool = false
var list_of_magnetable : Array[Node]


func _ready():
	manget_tool.tool_active_signal.connect(_active)
	
	
func _active(condition : bool):

	magnet_fx.emitting = condition
	magneting = condition
	collector_collider.disabled = !condition
	

func _process(delta):
	
	if !magneting:
		return
		
	for m in list_of_magnetable:
		m.attract_me(delta,root.global_position)
	
	
			
func _magnet_enter(area_rid, area, area_shape_index, local_shape_index):
	
	if area:
		var magnetable = area.get_node_or_null("Attract_me")

		if magnetable:
			list_of_magnetable.append(magnetable)
			
	
func _magnet_exited(area_rid, area, area_shape_index, local_shape_index):
	
	if area:
		var magnetable = area.get_node_or_null("Attract_me")
		if magnetable:
			list_of_magnetable.erase(magnetable)
			

