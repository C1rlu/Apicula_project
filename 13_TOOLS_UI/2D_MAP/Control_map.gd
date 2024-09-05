extends Node

@onready var Camera : Camera2D  = $"../SubViewport/Camera2D"

var speed : float = 200
var _is_active : bool  = false
var zoomTarget : Vector2
var positionTarget : Vector2
var unZoom_position : Vector2

func _ready():
	_global_datas._open_player_map.connect(func(condition): _is_active = condition)
	zoomTarget = Camera.zoom
	positionTarget = Camera.position
	unZoom_position	= Camera.position	
	

func _process(delta):
	
	if _is_active:
		_zoom(delta)
		_pan(delta)
	

func _zoom(delta):
	
	if Input.is_action_just_pressed("Board_zoom_in"):
		zoom_in()
	if Input.is_action_just_pressed("Board_zoom_out"):
		zoom_out()
		
	Camera.zoom = lerp(Camera.zoom,zoomTarget,5 * delta)	
	
func zoom_in():
	zoomTarget = Vector2(3,3)
	#_global_datas._add_back_call.emit(zoom_out)	
func zoom_out():
	zoomTarget = Vector2(1,1)
	positionTarget = unZoom_position		
		
func _pan(delta):
	
	if zoomTarget == Vector2(3,3):
		if Input.is_action_pressed(_global_datas.move_right):
			var _magnitude = Input.get_action_strength(_global_datas.move_right)
			positionTarget.x += speed * _magnitude * delta
		if Input.is_action_pressed(_global_datas.move_left):
			var _magnitude = Input.get_action_strength(_global_datas.move_left)
			positionTarget.x -= speed * _magnitude * delta
		if Input.is_action_pressed(_global_datas.move_forward):
			var _magnitude = Input.get_action_strength(_global_datas.move_forward)
			positionTarget.y -= speed * _magnitude * delta
		if Input.is_action_pressed(_global_datas.move_backward):
			var _magnitude = Input.get_action_strength(_global_datas.move_backward)
			positionTarget.y += speed * _magnitude * delta
	
	positionTarget.x = clamp(positionTarget.x,490,800)
	positionTarget.y = clamp(positionTarget.y,100,600)

	Camera.position = lerp(Camera.position,positionTarget,10 * delta)	
