extends Button

@export var root : Control
@onready var board_map_button_img_over = $"../BoardMapButtonImg_Over"

func _ready():
	pressed.connect(_open_board)
	mouse_entered.connect(_over)
	mouse_exited.connect(_over_off)
	
func _open_board():
	
	_global_datas.open_inventory.emit(true)
	_global_datas.Player_In_Inventory = true


func _over():
	board_map_button_img_over.visible = true	
	
func _over_off():
	board_map_button_img_over.visible = false
