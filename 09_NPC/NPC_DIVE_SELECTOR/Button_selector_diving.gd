extends TextureButton

func _on_pressed():
	_global_datas._call_back.emit()
	_global_datas._go_Subscene.emit() 
	
