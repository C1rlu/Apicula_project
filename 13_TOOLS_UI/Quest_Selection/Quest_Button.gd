extends Button


@export var quest_data : Note_Data
@onready var photo_render = $PhotoUi_Prefab/Photo_Border/Photo_render

@onready var timer = $Timer

func _ready():
	text = quest_data.Photo_data.name
	pressed.connect(_select_this)
	photo_render.texture = quest_data.Photo_data.image
	visibility_changed.connect(_active)
	timer.timeout.connect(_enable)
func _select_this():
	#_global_datas._open_quest_on_board.emit(false)	
	#_global_datas._select_quest_on_board.emit(quest_data)
	_global_datas._show_selected_quest.emit(true, quest_data)


func _active():
	disabled = true
	timer.start()

func _enable():
	disabled = false	
	
	
