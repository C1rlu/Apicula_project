extends Node3D

@export var Photo_data : PhotoData
@export var element : element_data
@onready var photo_element_root = $"."

@export var Movable_object_node : Node

@export var _On_View: Node
#@export var _On_Over: Node
@export var on_over_node : Node3D
@export var element_setter : Node



func _ready():

	_On_View.On_View.connect(focus_or_scanner)
	#_On_Over.On_Over.connect(On_Over)
	element.photoData = Photo_data

	if element_setter:
		element_setter.element = element 
		Movable_object_node.element = element
		
	element.element_board_node = self
	
func set_element(_element : element_data):
	element = _element
	if element_setter:
		element_setter.element = _element 
		
		
func focus_or_scanner():

	_global_datas.show_on_scanner.emit(true)

