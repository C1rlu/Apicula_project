extends Resource
class_name tool_data

@export var Tool_Name = "Tool_Name_Here"
@export var tool_legend : String = "set a tool legend here for descriptions"
@export var ui_img : Texture2D

signal tool_active_signal(condition : bool)
signal cancel_action_signal
signal select_this_tool_scene_prefabs(condition : bool)
var selector_button : Button



