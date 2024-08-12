
extends Node

@export var manget_tool : tool_data
@export var magnet_fx : GPUParticles3D
@export var tool_clock: tool_data

@onready var root = $".."
var magneting : bool = false
var list_of_magnetable : Array[Node]
@onready var timer = $Timer
@onready var magnet_zone = $"../Magnet_zone"

func _ready():
	manget_tool.tool_active_signal.connect(_active)
	
	
func _active(condition : bool):

	magnet_fx.emitting = condition
	magneting = condition
	
	#if condition:
		#timer.start()
	#else:
		#timer.stop()
		
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
			

func _on_timer_timeout():
	
	_active(false)
	for a in list_of_magnetable:
		a.Push(2)
