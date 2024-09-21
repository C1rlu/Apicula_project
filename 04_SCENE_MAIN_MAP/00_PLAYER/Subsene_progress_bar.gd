extends Node

@export var _sprite_render : Sprite3D
@export var _subscene_progress_bar : TextureProgressBar
func _ready():
	_global_datas.subscene_progress_bar_sprite = _sprite_render
	_global_datas.subscene_progress_bar = _subscene_progress_bar
