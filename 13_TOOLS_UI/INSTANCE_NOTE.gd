extends Node

@onready var letter_prefab = preload("res://12_INVENTORY/Letter/Start_note.tscn")
@onready var front_element = $"../Front_element"

@export var all_N_note : Array[Note_Data]


func _ready():
	_global_datas._give_letter.connect(_intance_letter)



func _intance_letter(index : int):
	
	_global_datas._hide_dialogue_box.emit()
	
	var new_node = 	letter_prefab.instantiate()
	new_node.scale = Vector2.ONE
	front_element.add_child(new_node)
	
	var text = new_node.get_node_or_null("Update_words")	
	var load_data : Note_Data = all_N_note[index]
	load_data.is_onBoard = true
	text._update_words(load_data.note_text,load_data.from)


