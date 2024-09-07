extends Control

@export var quest_data : Note_Data
@onready var photo_render = $PhotoUi_Prefab/Photo_Border/Photo_render


func _ready():
	photo_render.texture = quest_data.Photo_data.image

