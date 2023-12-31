extends Node3D

@export var _sonar_speed = 2.0
@onready var timer = $Timer
@onready var _1 = $"01"
@onready var _2 = $"02"
@onready var collision_shape_3d = $Sonar_Aera/CollisionShape3D
var t
func _ready():
	_global_datas._active_sonar.connect(active_sonar)
	self.scale = Vector3(0.1,0.1,0.1)
	_1.visible = false
	_2.visible = false
	
func active_sonar():
	timer.start()
	_1.visible = true
	_2.visible = true
	collision_shape_3d.disabled = false
	

func _change_scale(value : float):
	self.scale = Vector3(value,value,value)
	
func _stop():
	self.scale = Vector3(0.1,0.1,0.1)
	_1.visible = false
	_2.visible = false
	collision_shape_3d.disabled = true	
	
