extends Node

@export var photoData : PhotoData
@export var information : info_data

signal scaning_done

func scanning_done():
	
	scaning_done.emit()

	
	_global_datas.selected_photoData = photoData
	_global_datas.flash_scanner.emit()
	photoData.intrige_state = photoData.intrigue_s.started
	
	if information:
		_global_datas.information_added.emit(information)




