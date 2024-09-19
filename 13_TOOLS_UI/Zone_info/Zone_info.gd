extends Node3D

@export var zone_datas : ZoneData

@onready var progress_bar = $SubViewport/ProgressBar


func _ready():

	zone_datas.zone_progressBar = $SubViewport/ProgressBar
	zone_datas.Sprite_render = $Render

	progress_bar.value_changed.connect(_check_value)


func _check_value(value : float):
	
	if value >= 100:
		zone_datas.Boue_active = true
		$BouePrefab._active_boue()		
		zone_datas.Sprite_render.visible = false
		_global_datas._active_sonar.emit($BouePrefab.global_position)
