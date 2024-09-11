extends Node3D

@export var speed : float
var target_position : Vector3

@export var x_limit : Vector2
@export var y_limit : Vector2

var _active : bool = false
var reset_position : Vector3
func _ready():
	_global_datas._open_boad_Focus.connect(_enable)
	reset_position = position
	
func _enable(condition : bool, element ):
	
	
	if condition:
		global_transform.origin = reset_position
		target_position = reset_position
		var utility = GameUtility.new()
		var n_timer = utility.create_timer(0.5,func(): _active = true,self)
		n_timer.start()
	else:
		_active = false
func _process(delta):
	
	if !_active:
		return
	
	move(delta)	
	
	
func move(delta):
	
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		var _magnitude = Input.get_action_strength("move_right")
		direction += global_transform.basis.x * _magnitude  # Move right
	if Input.is_action_pressed("move_left"):
		var _magnitude = Input.get_action_strength("move_left")
		direction -= global_transform.basis.x * _magnitude  # Move left
	if Input.is_action_pressed("move_forward"):
		var _magnitude = Input.get_action_strength("move_forward")
		direction += global_transform.basis.y * _magnitude  # Move forward
	if Input.is_action_pressed("move_backward"):
		var _magnitude = Input.get_action_strength("move_backward")
		direction -= global_transform.basis.y * _magnitude  # Move backward

	# Apply movement
	direction = direction.normalized() * speed * delta
	target_position += direction
	
	
	target_position.x = clamp(target_position.x, x_limit.x, x_limit.y)
	target_position.y = clamp(target_position.y,  y_limit.x, y_limit.y)
	# Update the global position
	#print(target_position)
	global_transform.origin = target_position
	
		
