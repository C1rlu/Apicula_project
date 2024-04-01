extends Node

@onready var orbe_base_prefab = $".."

var offset : Vector2
var target 
var is_moving = false
func _ready():
	
	set_random()
	
func _process(delta):

	if !is_moving:
		return
		
	orbe_base_prefab.position = lerp(orbe_base_prefab.position,target,delta)

	set_random()
	
func set_random():

	offset = Vector2(randf_range(-0.05,0.05),randf_range(-0.05,0.05))
	target = orbe_base_prefab.position + Vector3(offset.x,offset.y,0.0)
