extends Node3D

@export var smooth_speed = 3.0
var offset: Vector3
var active_target : Vector3
var zoom_index = 0
@onready var Player_position = $"../CamTarget"

@export var active_zoom = false

var zoomIndex = 0.0
func _ready():
	var playerPosition = Player_position.transform.origin
	offset = self.transform.origin - playerPosition
	active_target = offset

	
func _input(event: InputEvent) -> void:
	if !active_zoom:
		return
	
	if event.is_action_pressed("Board_zoom_in"):
		if zoomIndex == -0.3:
			return
		zoomIndex = -0.3
		$Camera3D.translate(Vector3(0.0,0.0,zoomIndex))
		
	if event.is_action_pressed("Board_zoom_out"):
		if zoomIndex == 0.3:
			return
		zoomIndex = 0.3
		$Camera3D.translate(Vector3(0.0,0.0,zoomIndex))
			
			

	

		
func _physics_process(_delta):
	if !_global_datas._open_board:
		return		
	var playerPosition = Player_position.transform.origin
	self.transform.origin = lerp(self.transform.origin, playerPosition + active_target, smooth_speed * _delta)
