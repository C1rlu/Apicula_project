extends Node


@export var Rg : RigidBody3D
@export var hit_node : Node3D

const DEBRIS_HIT_PARTICULE = preload("res://08_SUBSCENES/VFX/Debris_hit_particule.tscn")

var hit_index : int = 0
func _ready():
	
	if Rg:
		Rg.body_shape_entered.connect(_contact)
		
		
func _contact(body_rid, body, body_shape_index, local_shape_index):
	
	if body:
	
		var lootable = body.get_node_or_null("Breaking_me")	
		if lootable:
			
			if hit_index >= 3:
				hit_index = 0	
			
			if hit_index == 0:
				_global_datas.subscene_sonar_effect.emit(_global_datas.player_rg.position)	
				
			hit_index += 1
			

		
			check_player_speed()
			add_debris_vfx()
			lootable._hit()
			return	
			
func check_player_speed():
	

	var current_velocity = Rg.linear_velocity	
	var current_speed = current_velocity.length()
	if current_speed > 0.7:
		return

	Rg.apply_central_force(current_velocity * 400)
		

func add_debris_vfx():
	
	var instance_vfx : GPUParticles3D = DEBRIS_HIT_PARTICULE.instantiate()	
	hit_node.add_child(instance_vfx)
	instance_vfx.global_position = hit_node.global_position
	instance_vfx.emitting = true
	
	
