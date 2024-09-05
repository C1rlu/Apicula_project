extends Button

@export var button_control : Control

func _ready():
	
	pressed.connect(_open_map)
	_global_datas._open_player_map.connect(_enable_button)
	_global_datas.open_inventory.connect(_enable_button)
	
	
	_global_datas._go_Subscene.connect( func() :_enable_button(true))
	_global_datas._backFrom_subscene.connect(func(): _enable_button(false))
	
func _open_map():
	
	_global_datas._open_player_map.emit(true)
	

func _enable_button(condition : bool):
	
	button_control.visible = !condition	
