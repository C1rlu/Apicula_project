extends Node3D

@export var _sonar_speed = 2.0
@onready var timer = $Timer
@onready var _1 = $"01"
@onready var _2 = $"02"

func _ready():
	_global_datas._active_sonar.connect(active_sonar)
	self.scale = Vector3(0.1,0.1,0.1)
	_1.visible = false
	_2.visible = false
	
func active_sonar():
	if !timer.is_stopped():
		return 
	timer.start()
	_1.visible = true
	_2.visible = true
	
func _process(_delta):

	if 	timer.is_stopped():
		return
	var new_timer = (timer.wait_time - timer.time_left) *_sonar_speed 
	if new_timer < 0.1:
		return
	self.scale = Vector3(new_timer,new_timer,new_timer)
	

func _on_timer_timeout():
	self.scale = Vector3(0.1,0.1,0.1)
	_1.visible = false
	_2.visible = false
	#_global_datas._disable_sonar.emit()
