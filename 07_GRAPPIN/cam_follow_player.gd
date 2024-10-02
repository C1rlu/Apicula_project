extends Node

@export var Camera : Camera3D
@export var player_rg : RigidBody3D
@export var smmooth_speed : float = 3.0




func _ready():
	pass # Replace with function body.


func _process(delta):

	#if !_subscene_datas.player_in_subscene:
		#return
	Camera.position = lerp(Camera.position, player_rg.position, smmooth_speed * delta)
