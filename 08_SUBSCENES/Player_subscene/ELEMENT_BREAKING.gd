extends Node


@export var Rg : RigidBody3D
@export var hit_node : Node3D


const DEBRIS_HIT_PARTICULE = preload("res://08_SUBSCENES/VFX/Debris_hit_particule.tscn")
func _ready():
	
	if Rg:
		Rg.body_shape_entered.connect(_contact)
		
		
func _contact(body_rid, body, body_shape_index, local_shape_index):
	
	if body:
		print(body)
		
		check_player_speed()
		var lootable = body.get_node_or_null("Breaking_me")
		_global_datas.subscene_sonar_effect.emit(_global_datas.player_rg.position)
		#if lootable:
			#add_debris_vfx()
			#lootable._hit()

func check_player_speed():
	var current_velocity = Rg.linear_velocity	
	var current_speed = current_velocity.length()
	if current_speed > 0.7:
		return
	Rg.apply_central_force(current_velocity * 200)
		

func add_debris_vfx():
	
	var instance_vfx : GPUParticles3D = DEBRIS_HIT_PARTICULE.instantiate()	
	hit_node.add_child(instance_vfx)
	instance_vfx.global_position = hit_node.global_position
	instance_vfx.emitting = true
	
	
#func get_collision_point(body, body_shape_index, local_shape_index) -> Vector3:
	#var collision_shape = shape_owner_get_shape(local_shape_index, 0)
	#if collision_shape:
		#var space_state = get_world().direct_space_state
		#var result = space_state.intersect_shape(collision_shape, transform, 1, [], 1)
		#if result:
			#var contact_point = result.position
			#print("Contact point: ", contact_point)
			#return contact_point 
