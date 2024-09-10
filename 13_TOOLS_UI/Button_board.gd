extends Button



func _ready():
	pressed.connect(_open_board)

func _open_board():
	
	_global_datas.open_inventory.emit(true)
	_global_datas.Player_In_Inventory = true

