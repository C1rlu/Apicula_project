extends Node

@onready var tool_legend_root = $"../Tool_Legend_root"


@onready var label = $"../Tool_Legend_root/Label"


func _ready():
	show_legend(false)	

func show_legend(condition : bool):
	tool_legend_root.visible = condition
	
func update_tool_legend(tool : tool_data):
	
	label.text = tool.tool_legend


func _on_open_selector__fade(condition):
	show_legend(condition)


func _on_select_on_angle_select_tool(tool):
	update_tool_legend(tool)
