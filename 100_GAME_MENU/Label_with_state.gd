extends Label

@export var language_state : Array[String]
@onready var label = $"."



func _ready():
	_global_datas._change_language_state.connect(change_ls_state)

func change_ls_state(state : int):
	label.text = language_state[state]		
	
