extends TextureButton
@onready var photo_circle = $Photo_circle

func _ready():
	var number : int = 0
	set_focus_mode(number)

func _on_pressed():
	_global_datas._take_photo.emit()
	_global_datas._show_dialogue_box.emit()

	visible = false
	photo_circle.visible = false



	
func _on_mouse_entered():
	photo_circle.visible = true


func _on_mouse_exited():
	photo_circle.visible = false
