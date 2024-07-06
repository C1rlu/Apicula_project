extends TextureButton

signal end_typing

func _on_pressed():
	end_typing.emit()
	visible = false

	

