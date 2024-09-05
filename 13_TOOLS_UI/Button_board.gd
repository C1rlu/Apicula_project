extends Button

@export var root : Control

func _ready():
	pressed.connect(_open_board)
	_global_datas.open_inventory.connect(_active)
	
	_global_datas._go_Subscene.connect( func() :_active(true))
	_global_datas._backFrom_subscene.connect(func(): _active(false))
	
func _open_board():
	
	_global_datas.open_inventory.emit(true)
	_global_datas.Player_In_Inventory = true

func _active(condition : bool):
	root.visible = !condition	
	
