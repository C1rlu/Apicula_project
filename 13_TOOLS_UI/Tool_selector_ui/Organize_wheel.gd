@tool
extends Node

@export var button_radius = 100 
@export var offset_position : float = 100.0
var button_list : Array[Button]
@onready var center = $"../Center"

func _ready():
	_global_datas.open_tool_selector.connect(update)


func update(condition : bool):

	if condition:
		organize()	
		
		
func organize():
	update_list()	
	
	var angle_offset : float = (2*PI)/button_list.size() #in degrees
	var angle : float = 0
	for b in button_list:
		var button_pivot_offset = (b.size.x/2)
		b.position = Vector2(button_radius, 0).rotated(angle-offset_position) 
		b.position = Vector2(b.position.x - button_pivot_offset, b.position.y - button_pivot_offset)
		angle += angle_offset


func update_list():

	var all_b = center.get_children()	
	button_list.clear()
		
	
	for b in all_b:
		if b.visible:
			button_list.append(b)	

func _run():
	organize()	

func _process(delta):

	if Engine.is_editor_hint():
		organize()

