extends Node3D

@export var _sonar_speed = 2.0

func _ready():
	_global_datas._active_sonar.connect(active_sonar)
	self.scale = Vector3(0.1,0.1,0.1)
	$"01".visible = false
	$"02".visible = false
	
func active_sonar():
	if !$Timer.is_stopped():
		return 
	$Timer.start()
	$"01".visible = true
	$"02".visible = true
	
func _process(_delta):
	if $Timer.is_stopped():
		return
	var timer = ($Timer.wait_time - $Timer.time_left) * _delta *_sonar_speed  
	if timer < 0.1:
		return
	self.scale = Vector3(timer,timer,timer)
	

func _on_timer_timeout():
	self.scale = Vector3(0.1,0.1,0.1)
	$"01".visible = false
	$"02".visible = false
	#_global_datas._disable_sonar.emit()
