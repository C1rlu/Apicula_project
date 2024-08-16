extends Node

@onready var tool_legend_root = $"../Tool_Legend_root"


@onready var label = $"../Tool_Legend_root/Label"


func _ready():
	_global_datas.open_tool_selector.connect(show_legend)

func show_legend(condition : bool):
	tool_legend_root.visible = condition
	
func update_tool_legend(tool : tool_data):
	
	label.text = tool.tool_legend



func _on_select_on_angle_select_tool(tool):
	update_tool_legend(tool)
