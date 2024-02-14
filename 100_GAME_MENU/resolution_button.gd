extends OptionButton



func _ready():
	add_item("1280x720")	
	add_item("1920*1080")

func _on_item_selected(index):
	var current_selected = index
	
	if current_selected == 0:
		DisplayServer.window_set_size(Vector2(1280,720))
	if current_selected == 1:
		DisplayServer.window_set_size(Vector2(1920,1080))
