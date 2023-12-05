extends Area3D


@onready var mesh = $mesh
@onready var material : Material = mesh.get_active_material(0)

var inZone = false

func _see_it():
	inZone = true
	$Timer.start()

func _process(_delta):
	
	if $Timer.is_stopped():
		return
	var timer = $Timer.time_left 
	
	material.set_shader_parameter("Distance",timer)

func _on_timer_timeout():
	if !inZone:
		return
	$Timer.start()


func _on_epave_zone_see_int():
	_see_it()


func _on_epave_zone_see_out():
	inZone = false
