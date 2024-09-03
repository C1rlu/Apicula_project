extends Button


@export var Shop_behaviour : Node
@export var shop_to_open : Control

func _ready():
	pressed.connect(open_this)
	
	
func open_this():
	Shop_behaviour.open_this_shop.emit(shop_to_open)
