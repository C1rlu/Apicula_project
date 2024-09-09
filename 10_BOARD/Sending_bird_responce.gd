extends Node



func _ready():
	_global_datas.sending_bird.connect(_sending_brird)
	
	
func _sending_brird():
	_global_datas.open_inventory.emit(false)
	_global_datas.Player_In_Inventory = false
	print("SENDIN BIRD ")
