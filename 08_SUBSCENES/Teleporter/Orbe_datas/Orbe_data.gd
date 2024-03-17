extends Resource
class_name orbe_data

@export var Orbe_kind : String
@export var Orbe_descriptions : String ="set orbe description here"
@export var Orbe_prefab : PackedScene
@export var Orbe_max_amount : int = 3
@export var Orbe_scene_amount : int = 0

signal select_ui_icon(condition : bool)
