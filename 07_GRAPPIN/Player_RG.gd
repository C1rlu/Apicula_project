extends RigidBody3D

@export var speed : float = 10.0
func _ready():
	pass 

func _process(delta):
	move(delta)



func move(delta):
	
	#if !_subscene_datas.player_in_subscene:
		#return
		
	if Input.is_action_pressed("Click"):
		var goingUp = -transform.basis.y
		apply_central_force(goingUp * delta * speed)
		
	if Input.is_action_pressed("Back_call"):
		var goingDown = transform.basis.y
		apply_central_force(goingDown * delta * speed)
	
	if Input.is_action_pressed((_global_datas.move_left)):
		var goingLeft = -transform.basis.x
		apply_central_force(goingLeft * delta * speed)
	
	
	if Input.is_action_pressed((_global_datas.move_right)):
		var goingRight = transform.basis.x
		apply_central_force(goingRight * delta * speed)
	

		
	if Input.is_action_pressed((_global_datas.move_forward)):
		var goingForward = -transform.basis.z
		apply_central_force(goingForward * delta * speed)
	
	if Input.is_action_pressed((_global_datas.move_backward)):
		var goingBackward = transform.basis.z
		apply_central_force(goingBackward * delta * speed)
	
	
	#var current_velocity = linear_velocity
	#var current_speed = current_velocity.length()
	#linear_velocity = current_speed
	
		
