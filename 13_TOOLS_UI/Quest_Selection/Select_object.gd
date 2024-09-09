extends Button

@onready var timer = $Timer

func _ready():
	pressed.connect(_in_select_state)
	disabled = true
	timer.timeout.connect(done)
	_global_datas._open_quest_on_board.connect(_enable)

func _in_select_state():
	_global_datas._in_select_element_state.emit(true)
	_global_datas._selected_button = self

func _enable(condition):
	if condition:
		disabled = true
		timer.start()
func done():
	disabled = false
