extends Button

@export var _text : Label
func _ready():
	pressed.connect(_in_select_state)
	mouse_entered.connect(on_mouse)
	mouse_exited.connect(on_mouse_exit)
	
	_global_datas._open_letter_quest.connect(_enable)

func _in_select_state():
	_global_datas._in_select_element_state.emit(true)
	_global_datas._selected_button = self

		
func _enable(condition):
	if condition:
		disabled = true

		var utility : GameUtility = GameUtility.new()
		var n_timer = utility.create_timer(0.1,done,self)
		n_timer.start()
		
func done():
	disabled = false

func on_mouse():
	_global_datas._on_button_ui = true
	
func on_mouse_exit():
	_global_datas._on_button_ui = false
	
func _set_responce(responce : String):
	_text.visible_ratio = 0.0
	_text.text = responce
	var t
	t = create_tween()
	t.tween_method(_show,0.0,1.0,0.5)
	
func _show(value : float):
	
	_text.visible_ratio = value
	
	
