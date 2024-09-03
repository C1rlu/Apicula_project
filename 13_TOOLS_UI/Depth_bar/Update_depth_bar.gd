extends Node

@onready var progress_bar : ProgressBar = $"../ProgressBar"



func _ready():
	_subscene_datas._update_depth_ui.connect(update_bar)
	progress_bar.value_changed.connect(check_depth_bar)
	
func update_bar():
	
	progress_bar.value = _subscene_datas._current_player_depth
	
	
func check_depth_bar(value : float):
	
	var pourcentage = ( value / progress_bar.max_value ) * 100
	if pourcentage >= 100:
		_subscene_datas._kill_player.emit()

