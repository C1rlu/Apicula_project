extends Node3D

@export var all_VFX : Array[GPUParticles3D]



func _ready():
	
	for vfx in all_VFX:
		vfx.emitting = true	
	
	all_VFX[0].finished.connect(destroy_at_end)

func destroy_at_end():
	queue_free()	
	
