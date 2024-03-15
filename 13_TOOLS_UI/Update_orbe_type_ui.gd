extends Node

@onready var label = $"../Panel/Label"


func _ready():
	_global_datas._update_orbe_ui_type.connect(_update_ui)
	
	
func _update_ui(orbe_type : orbe_data):
	
	label.text = orbe_type.Orbe_kind	
