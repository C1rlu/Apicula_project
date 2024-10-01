extends Node

#@export var _sonar_blue_color : Color
#@export var _sonar_yellow_color : Color

@export var Rg : RigidBody3D
@export var hit_node : Node3D


const DEBRIS_HIT_PARTICULE = preload("res://08_SUBSCENES/VFX/Debris_hit_particule.tscn")

var hit_index : int = 0
@onready var timer = $Timer

var vortex_index : int = 0


func _ready():
	
	if Rg:
		Rg.body_shape_entered.connect(_contact)
		

func _contact(body_rid, body, body_shape_index, local_shape_index):
	
	if body:
		
		if !timer.is_stopped():
				return
				
		var lootable = body.get_node_or_null("Breaking_me")	
		var vortex = body.get_node_or_null("Breaking_Vortex")
		
		#var Scannable = body.get_node_or_null("Scannable")
		var Ghost_light = body.get_node_or_null("Ghost_light")
		if Ghost_light:
			
			timer.start()
			check_player_speed(body.global_position)
			_global_datas._scan_mirror_xray.emit()
			_global_datas._photo_flash.emit()
			return		
			
		
		#if Scannable:
			#
				#Scannable._hit()
				#timer.start()
				#check_player_speed(body.global_position)
#
				#_global_datas.subscene_sonar_effect.emit(_global_datas.player_rg.position,_sonar_yellow_color)	
				#return		
		#
		if vortex:
			
			vortex._hit()
			
			timer.start()
			check_player_speed(body.global_position)
			add_debris_vfx()
			_global_datas.vertex_hit_effect.emit()
			return		
			
		if lootable:
			
			# removing the sonar effect for the moment
			#if hit_index >= 3:
				#hit_index = 0	
				#
			#if hit_index == 0:
				#_global_datas.subscene_sonar_effect.emit(_global_datas.player_rg.position,_sonar_blue_color)	
				#
			#hit_index += 1
			
			
			timer.start()
			check_player_speed(body.global_position)
			add_debris_vfx()
			lootable._hit()
			return	
			
func check_player_speed(body_position : Vector3):
	

	var current_velocity = Rg.linear_velocity	
	var current_speed = current_velocity.length()
	
	var dir = ( body_position - _global_datas.subbscene_playerPosition ).normalized() 
	#print(dir)
	if current_speed < 0.7:

		Rg.apply_central_force(-dir * 200)

		

func add_debris_vfx():
	
	var instance_vfx : GPUParticles3D = DEBRIS_HIT_PARTICULE.instantiate()	
	hit_node.add_child(instance_vfx)
	instance_vfx.global_position = hit_node.global_position
	instance_vfx.emitting = true
	
	
