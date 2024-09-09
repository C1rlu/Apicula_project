extends Node

@onready var main_scene_u = $".."
@export var buttons : Array[Button]
func _ready():
	_global_datas._show_mainScene_ui.connect(_show)
	
	
	
	_global_datas.open_inventory.connect( func(condition): _global_datas._show_mainScene_ui.emit(!condition))
	_global_datas._open_shop.connect(func(condition): _global_datas._show_mainScene_ui.emit(!condition))
	
	_global_datas._open_dialogue.connect(func(): _global_datas._show_mainScene_ui.emit(false))
	_global_datas._close_dialogue.connect(func(): _global_datas._show_mainScene_ui.emit(true))
	_global_datas._go_Subscene.connect(func(): _global_datas._show_mainScene_ui.emit(false))
	
	_global_datas._backFrom_subscene.connect(func(): _global_datas._show_mainScene_ui.emit(true))
	_global_datas._check_dialogue_photo.connect(func(): _global_datas._show_mainScene_ui.emit(false))
	
	_global_datas.sending_bird.connect(func(): _global_datas._show_mainScene_ui.emit(false))
	
func _show(condition : bool):

	main_scene_u.visible = condition	
	
	for b in buttons:
		b.disabled = !condition
