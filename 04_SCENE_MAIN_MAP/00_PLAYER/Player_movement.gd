extends RigidBody3D

@export var move_speed: float = 5.0
var speed : float
@export var maxSpeed = 10.0
@export var rotation_speed = 0.5

var using_pad : bool

var _lock_speed : bool = false

func _ready():
	
	_global_datas.using_pad.connect(_using_pad)
	speed = move_speed

func _using_pad(condition : bool):
	
	using_pad = condition	
func lock_speed(condition : bool):
	
	_lock_speed = condition
	
	if condition:
		speed = move_speed
				
func _input(event):
	
	
	if event.is_action_pressed("Speed_boat"):
		if !_lock_speed:
			speed = move_speed * 2	
	
	if event.is_action_released("Speed_boat"):
		speed = move_speed
		
		
	_global_datas._check_boat_zone.emit()
	
func _physics_process(_delta):
	
	if _global_datas.Player_In_Inventory:
		return
	
	if _global_datas.Player_InSubScene:
		return
		
		
	var translation = get_global_transform().origin
	_global_datas.player_position = translation

	if _global_datas.Player_InMenu:
		return
		
	if _global_datas.Player_InDialogue:
		return	
	
	if _global_datas._photo_checking:
		return
			
	
	
	move_c()
	
	#if using_pad:
		#
	#else:
		#move_a()
	
func move_c():
	





	var velocity = Input.get_vector("move_right", "move_left","move_backward" , "move_forward")
	 # Calculate the torque based on input velocity
	if velocity.length_squared() > 0.0:
		
		
		var target_rotation = atan2(velocity.x, velocity.y)
		var current_rotation = get_rotation().y

		# Calculate direction vector in X-Z plane based on rotation
		var direction_x = sin(target_rotation)
		var direction_z = cos(target_rotation)

		# Create a 3D vector for the force direction (assuming Y-axis is up)
		var force_direction = Vector3(-direction_x, 0.0, -direction_z).normalized()

		# Apply central force in the calculated direction
		apply_central_force(force_direction * speed)


		var rotation_limit = abs(target_rotation - current_rotation)
		var range_threshold = 0.1
		if rotation_limit <= range_threshold:
			#print("ROTATION DONE")	
			return
	
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
	
func move_a():
	
	
	var forward_value = 0.0
	if Input.is_action_pressed(("move_forward")):
		var forward_vector = -transform.basis.z
		apply_central_force(forward_vector * speed)
		forward_value = 1
	if Input.is_action_pressed(("move_backward")):
		var backward_vector = transform.basis.z
		apply_central_force(backward_vector * speed/1.5 )
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
