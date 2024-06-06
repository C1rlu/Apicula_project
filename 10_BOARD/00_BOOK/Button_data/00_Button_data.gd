extends Resource
class_name book_button_data

var button_area : Area3D

signal button_signal
signal button_on_over(condition:bool)
signal update_text(_new_text:String)

@export var responce_list : Array[String]

