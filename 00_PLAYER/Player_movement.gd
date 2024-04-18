extends RigidBody3D

@export var move_speed: float = 5.0
@export var maxSpeed = 10.0
@export var rotation_speed = 0.5

var using_pad : bool

var _Turn_logic : bool = false

func _ready():
	
	_global_datas.using_pad.connect(_using_pad)
	_global_datas.using_turnLogic.connect(Turn_logic)
	
func Turn_logic(condition : bool):
	_Turn_logic = condition	
	
func _using_pad(condition : bool):
	
	using_pad = condition	
	
	
func _physics_process(_delta):
	
	if _global_datas.Player_In_Inventory:
		return	
	if _global_datas.Player_InSubScene:
		return
	if _global_datas.Player_InMenu:
		return	
	if _global_datas.Player_InDialogue:
		return	
		
	var translation = get_global_transform().origin
	_global_datas.player_position = translation
	_global_datas.player_boat_rotation = rotation
	
	
	if _Turn_logic:
		move_c()
		return
	
	if !using_pad:
		move_a()
	else:
		move_b()

func move_a():
	
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
	

	var velocity = Input.get_vector("move_right", "move_left","move_backward" , "move_forward")

	var engine : int
	if Input.is_action_pressed("boat_engine_forward"):
		engine = 1
		var forward_vector = -transform.basis.z
		apply_central_force(forward_vector * 5 * engine)	
		
	if Input.is_action_pressed("boat_engine_backward"):
		engine = -1	
		var forward_vector = transform.basis.z
		apply_central_force(-forward_vector * 5 * engine)			
		
	 # Calculate the torque based on input velocity
	if velocity.length_squared() > 0.0:
		var target_rotation = atan2(velocity.x, velocity.y)
		var current_rotation = get_rotation().y

		# Calculate the difference in rotation
		var rotation_difference = wrap_angle(target_rotation - current_rotation)

		 # Determine the direction of torque (1 or -1)
		var torque_direction = 0.0
		if rotation_difference > 0.0:
			torque_direction = 1.0
		elif rotation_difference < 0.0:
			torque_direction = -1.0
		else:
			torque_direction = 0.0  # No torque needed if rotation_difference is zero


		var current_velocity = linear_velocity
		var current_speed = current_velocity.length()
		# Apply torque to rotate towards the target rotation
		var torque_vector = Vector3(0.0, torque_direction * current_speed * rotation_speed, 0.0)
		apply_torque(torque_vector)

	self.transform.origin.y = 0.0
	
	
func move_c():
	
	
	if _global_datas.Player_In_Inventory:
		return
	
	if _global_datas.Player_InSubScene:
		return
	if _global_datas.Player_InMenu:
		return
		
	if _global_datas.Player_InDialogue:
		return	
	
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
	
	
	
# Helper function to smoothly interpolate between angles
func lerp_angle(from, to, weight):
	var difference = wrap_angle(to - from)
	return from + difference * weight

# Helper function to wrap angle to -180 to 180 degrees range
func wrap_angle(angle):
	if angle > PI:
		return angle - PI*2
	elif angle < -PI:
		return angle + PI*2
	else:
		return angle
	#
#func _input(event):
	#
	#if event is InputEventJoypadMotion:
		#print(
				#"Device: %s. Joypad Axis Index: %s. Strength: %s."
				#% [event.device, event.axis, event.axis_value]
		#)
