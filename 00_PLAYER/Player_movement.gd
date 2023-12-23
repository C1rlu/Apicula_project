extends RigidBody3D

@export var move_speed: float = 5.0
@export var maxSpeed = 10.0
@export var rotation_speed = 0.5

func _physics_process(_delta):
	
	move_a()

func move_a():
	
	var translation = get_global_transform().origin
	_global_datas.player_position = translation
	
	if _global_datas.Player_InBoard:
		return
	
	if _global_datas.Player_InSubScene:
		return
	if _global_datas.Player_InMenu:
		return
			
	var forward_value = 0.0
	if Input.is_action_pressed(("move_forward")):
		var forward_vector = -transform.basis.z
		apply_central_force(forward_vector * move_speed)
		forward_value = 1
	if Input.is_action_pressed(("move_backward")):
		var backward_vector = transform.basis.z
		apply_central_force(backward_vector * move_speed/2 )
		forward_value = -1
	var current_velocity = linear_velocity
	var current_speed = current_velocity.length()
	
	if Input.is_action_pressed(("move_right")):
		apply_torque(Vector3(0,-rotation_speed * current_speed * forward_value,0))
	if Input.is_action_pressed(("move_left")):
		apply_torque(Vector3(0,rotation_speed * current_speed * forward_value,0))
	
	if current_speed > maxSpeed:
		current_velocity = current_velocity.normalized() * maxSpeed
		linear_velocity = current_velocity
	
	self.transform.origin.y = 0.0


func move_b():
	
	var direction = Vector3.ZERO;
	var translation = get_global_transform().origin
	_global_datas.player_position = translation
	
	if Input.is_action_pressed(("move_right")):
		direction.x += 1
	if Input.is_action_pressed(("move_left")):  
		direction.x -= 1
	if Input.is_action_pressed(("move_forward")):
		direction.z -= 1	
	if Input.is_action_pressed(("move_backward")):
		direction.z += 1	
		
	# add movement	
	if(translation + direction != translation):
		look_at(translation + direction, Vector3.UP)
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()	
		
	apply_central_force(direction * move_speed)		
	self.transform.origin.y = 0.0
