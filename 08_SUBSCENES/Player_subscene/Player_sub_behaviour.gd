extends RigidBody3D

@export var move_speed: float = 5.0
@export var maxSpeed = 10.0

@export var startPos : Vector3
@export var endPos : Vector3

var _canMove = false

@onready var PlayerMesh = $CollisionShape3D

func _ready():
	_global_datas._speedUp.connect(_speedUp)
	_global_datas._speedDown.connect(_speedDown)
	_global_datas._start_ini_subscene.connect(ini_Pos)
	_global_datas._splash.connect(splash)
	_global_datas._end_ini_subscene.connect(can_Move)
	_global_datas.Player_Rg = self
	
func ini_Pos():
	_canMove = false
	transform.origin = startPos

func can_Move():
	_canMove = true
	
func splash():
	apply_central_force(Vector3.DOWN * 500)
	
func _player_ResetPosition():
	transform.origin = Vector3.ZERO

func _speedUp():
	move_speed += 5
func _speedDown():
	move_speed -= 5
	
func _physics_process(_delta):
	
	
	if !_canMove:
		return
			
	if _global_datas.Player_InBoard:
		return
	if !_global_datas.Player_InSubScene:
		return
		
	if Input.is_action_pressed(("move_forward")):
		var goingUp = transform.basis.y
		apply_central_force(goingUp * move_speed)
		player_dir(_delta,0.0,-27.0)
	if Input.is_action_pressed(("move_backward")):
		var goingDown = -transform.basis.y
		apply_central_force(goingDown * move_speed)
		player_dir(_delta,0.0,27.0)
	if Input.is_action_pressed(("move_right")):
		var goingRight = transform.basis.x
		apply_central_force(goingRight * move_speed)
		player_dir(_delta,90.0,27.0)
	if Input.is_action_pressed(("move_left")):
		var goingLeft = -transform.basis.x
		apply_central_force(goingLeft * move_speed)
		player_dir(_delta,-90.0,27.0)
	var current_velocity = linear_velocity
	var current_speed = current_velocity.length()
	
	if current_speed > maxSpeed:
		current_velocity = current_velocity.normalized() * maxSpeed
		linear_velocity = current_velocity

	#if current_speed > 0.1 :
	#	$"../OXYGENE_MANAGER/Timer".paused = false
	#else :
	#	$"../OXYGENE_MANAGER/Timer".paused = true
		
	_global_datas.subbscene_playerPosition = transform.origin	

func _on_ini_subscene_ini_pos():
	_player_ResetPosition()

func player_dir(_delta, angle,angle_x):
	
	var New_rotation = Vector3(angle_x,angle,0.0)
	PlayerMesh.rotation_degrees = lerp(PlayerMesh.rotation_degrees,New_rotation,2.0 * _delta)
