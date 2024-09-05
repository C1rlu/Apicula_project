extends Button

@export var button_control : Control
@onready var on_over = $"../../On_Over"

func _ready():
	
	pressed.connect(_open_map)
	mouse_entered.connect(_over)
	mouse_exited.connect(_over_off)
	
	_global_datas._open_player_map.connect(func(condition): button_control.visible = !condition )
	_global_datas._show_mainScene_ui.connect(func(condition): if !condition: _global_datas._open_player_map.emit(false))
	_global_datas._open_player_map.connect(func(condition): _global_datas.Player_InMenu = condition)
	
func _open_map():
	
	_global_datas._open_player_map.emit(true)
	
	

func _over():
	on_over.visible = true	
	
func _over_off():
	on_over.visible = false
