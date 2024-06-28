extends Node

@onready var letter_prefab = preload("res://12_INVENTORY/Letter/Start_note.tscn")
@onready var front_element = $"../Front_element"

func _ready():
	_global_datas._give_letter.connect(_intance_letter)
		
func _intance_letter(note_name: String):
	
	var constant_string = "res://12_INVENTORY/Words_note/" + note_name + ".tres"
	
	if !ResourceLoader.exists(constant_string):
		print("EMPTY NOTE IN WORDS NOTE OR LINK ERROR ")
		return
	
	var new_node = 	letter_prefab.instantiate()
	
	front_element.add_child(new_node)
	
	var screen_center = Vector2(1280.0 / 2.0, 720/ 2.0 )
	var random_angle = randf_range(-96.0, -84.0)
	
	new_node.rotation_degrees = random_angle
	new_node.position = screen_center
	
	var text = new_node.get_node_or_null("Update_words")	
	var load_data : Note_Data = load(constant_string)
	text._update_words(load_data.note_text,load_data.from)
	#_global_datas.note_archives.append(load_data)
	_global_datas.active_queste = load_data
