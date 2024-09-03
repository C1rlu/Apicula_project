extends RigidBody3D



@export var orbe_tool : tool_data

@export var actual_speed: float = 5.0
@export var hight_speed: float = 5.0
@export var normal_speed: float = 5.0
@export var maxSpeed = 10.0

@export var startPos : Vector3

var _canMove = false

@onready var PlayerMesh = $Render_mesh
@onready var light_position = $Render_mesh/Light_Position



func _ready():

	_global_datas._start_ini_subscene.connect(ini_Pos)
	_global_datas._end_ini_subscene.connect(can_Move)
	_global_datas._backFrom_subscene.connect(cant_Move)

	_global_datas.player_rg = self
	orbe_tool.tool_active_signal.connect(speed_up)
	
	
func speed_up(condition : bool):
	
	if condition:
		actual_speed = hight_speed
	else:
		actual_speed = normal_speed		
	
func ini_Pos():
	_canMove = true
	transform.origin = startPos
	PlayerMesh.rotation_degrees = Vector3.ZERO
	splash()

	
func push():
	var current_velocity = linear_velocity	
	var current_speed = current_velocity.length()

	if current_speed > 1.3:
		return
	apply_central_force(current_velocity * 200)

func can_Move():
	_canMove = true
func cant_Move():
	_canMove = false

func splash():
	apply_central_force(Vector3.DOWN * 600)
	
	
func _physics_process(_delta):
	
	if !_canMove:
		return 
	if _global_datas.Player_InMenu:
		return	
	if _global_datas.Player_In_Inventory:
		return 
	
	if _global_datas.Player_InDialogue:
		return 

	if !_global_datas.Player_InSubScene:
		return
		

	_global_datas.subbscene_playerPosition = transform.origin	
	
	
	if Input.is_action_pressed((_global_datas.move_right)):
		var goingRight = transform.basis.x
		apply_central_force(goingRight * actual_speed)
		player_dir(_delta,90.0,27.0)
	if Input.is_action_pressed((_global_datas.move_left)):
		var goingLeft = -transform.basis.x
		apply_central_force(goingLeft * actual_speed)
		player_dir(_delta,-90.0,27.0)
	if Input.is_action_pressed((_global_datas.move_forward)):
		player_dir(_delta,0.0,-27.0)
	if Input.is_action_pressed((_global_datas.move_backward)):
		player_dir(_delta,0.0,27.0)
		
	if Input.is_action_pressed((_global_datas.move_forward)):
		var goingUp = transform.basis.y
		apply_central_force(goingUp * actual_speed)
		player_dir(_delta,0.0,-27.0)
	if Input.is_action_pressed((_global_datas.move_backward)):
		var goingDown = -transform.basis.y
		apply_central_force(goingDown * actual_speed)
		player_dir(_delta,0.0,27.0)
	
	var current_velocity = linear_velocity
	var current_speed = current_velocity.length()
			

	if current_speed > maxSpeed:
		current_velocity = current_velocity.normalized() * maxSpeed
		linear_velocity = current_velocity 
	
	
func player_dir(_delta, angle,angle_x):
	
	var New_rotation = Vector3(angle_x,angle,0.0)
	PlayerMesh.rotation_degrees = lerp(PlayerMesh.rotation_degrees,New_rotation,2.0 * _delta)


