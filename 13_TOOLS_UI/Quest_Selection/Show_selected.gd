extends Node

@onready var show_selected = $"../Show_Selected"
@onready var label = $"../Show_Selected/Label"

func _ready():
	_global_datas._show_selected_quest.connect(_show_selected_quest)
	_show_selected_quest(false,null)
	
func _show_selected_quest(condtiion : bool, quest_data : Note_Data):
	
	show_selected.visible = condtiion	
	if condtiion:
		_global_datas._add_back_call.emit(back_call)
		label.text = quest_data.quest_orders
		
func back_call():	
	_show_selected_quest(false,null)	
