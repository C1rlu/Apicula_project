
extends Node
@export var manget_tool : tool_data

@export var magnet_fx : GPUParticles3D
func _ready():
	manget_tool.tool_active_signal.connect(_active)
	
	
func _active(condition : bool):

	magnet_fx.emitting = condition
