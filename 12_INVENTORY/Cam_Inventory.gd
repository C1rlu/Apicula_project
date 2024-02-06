extends Camera2D

@export var move_speed: float = 5.0
@export var Max_zoom = 3.0
var zoomValue = 1.0
@onready var viewport_size = get_viewport().size
var unzoomPosition : Vector2

func _ready():
	_global_datas.open_inventory.connect(_activeCam)
	
	unzoomPosition = position
	
func _activeCam(condition : bool):
	pass
	#enabled = condition 
	


func camMovement(delta):
	
	if zoomValue == 1.0:
		position = unzoomPosition
		return
	var camera_position = position
	
	if Input.is_action_pressed(("move_right")):
		camera_position.x += move_speed * delta
	if Input.is_action_pressed(("move_left")):
		camera_position.x -= move_speed * delta
	if Input.is_action_pressed(("move_forward")):
		camera_position.y -= move_speed * delta
	if Input.is_action_pressed(("move_backward")):
		camera_position.y += move_speed * delta

	# Define your camera limits
	#var min_x = limit_left #0
	#var max_x = limit_right #1920
	#var min_y = limit_top #0
	#var max_y = limit_bottom #1080

	#var lerpO  = inverse_lerp(1.0,3.0,zoomValue)
	#var coef = lerp(2.0,6.0,lerpO)

	#camera_position.x = clamp(camera_position.x, min_x + max_x/coef , max_x - max_x/coef )
	#camera_position.y = clamp(camera_position.y, min_y + max_y /coef , max_y - max_y /coef )
	
	position = camera_position
	
	
	



func _physics_process(_delta):
	
	
	if _global_datas.Player_lock_click:
		return
	if !_global_datas.Player_In_Inventory:
		return
	
	camMovement(_delta)

	if Input.is_action_pressed(("Inventory_zoom_in")):
		zoomValue += 0.025
		zoomValue = clamp(zoomValue,1.0,Max_zoom)
		zoom = Vector2(zoomValue,zoomValue)
		
			
	if Input.is_action_pressed(("Inventory_zoom_out")):
		zoomValue -= 0.025
		zoomValue = clamp(zoomValue,1.0,Max_zoom)
		zoom = Vector2(zoomValue,zoomValue)
