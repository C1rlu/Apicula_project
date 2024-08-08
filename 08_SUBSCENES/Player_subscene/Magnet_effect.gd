
extends Node

@export var manget_tool : tool_data
@export var magnet_fx : GPUParticles3D

@export var tool_clock: tool_data
@onready var root = $".."

var magneting : bool = false

var list_of_magnetable : Array[Node]
var loader_oxy = false

func _ready():
	manget_tool.tool_active_signal.connect(_active)
	
	
func _active(condition : bool):

	magnet_fx.emitting = condition
	magneting = condition
	
	if loader_oxy:
		tool_clock.tool_active_signal.emit(condition)	

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
			
		var _loader = area.get_node_or_null("Loading_oxygene")
		if _loader:
			loader_oxy = true
			if magneting:
				tool_clock.tool_active_signal.emit(true)		
func _magnet_exited(area_rid, area, area_shape_index, local_shape_index):
	
	if area:
		var magnetable = area.get_node_or_null("Attract_me")
		if magnetable:
			list_of_magnetable.erase(magnetable)
			
		var _loader = area.get_node_or_null("Loading_oxygene")
		if _loader:
			loader_oxy = false
			tool_clock.tool_active_signal.emit(false)	
		
