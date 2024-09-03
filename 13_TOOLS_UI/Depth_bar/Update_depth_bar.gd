extends Node

@onready var progress_bar : ProgressBar = $"../ProgressBar"



func _ready():
	_subscene_datas._update_depth_ui.connect(update_bar)
	_global_datas._end_ini_subscene.connect(show)
	_global_datas._backFrom_subscene.connect(hide)
	
	progress_bar.value_changed.connect(check_depth_bar)
	progress_bar.visible = false


func show():
	progress_bar.visible = true
	
func hide():
	progress_bar.visible = false
	
		
func update_bar():
	
	progress_bar.value = _subscene_datas._current_player_depth
	
	
func check_depth_bar(value : float):
	
	var pourcentage = ( value / progress_bar.max_value ) * 100
	if pourcentage >= 100:
		_subscene_datas._kill_player.emit()


