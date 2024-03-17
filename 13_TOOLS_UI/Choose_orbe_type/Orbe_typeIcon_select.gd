extends Panel


@export var orbe_data_type : orbe_data
@onready var orbe_type : Label = $orbe_type

@onready var select_on = $select_on
@onready var orbe_number = $orbe_number
	
func _ready():
	orbe_type.text = orbe_data_type.Orbe_kind		
	orbe_data_type.select_ui_icon.connect(select_me)


func select_me(condition : bool):
	
	select_on.visible = condition
	
	var orbe_inventory_amount = orbe_data_type.Orbe_max_amount - orbe_data_type.Orbe_scene_amount
	orbe_number.text = str(orbe_inventory_amount)
