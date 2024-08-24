extends Node

@onready var quest_responce_panel = $".."

func _ready():
	pass
	#_global_datas.open_quest_info.connect(open_question_info)
	
	
func open_question_info(condition : bool , quest : Note_Data):

	quest_responce_panel.visible = condition
