extends Node


@export var Photo_Border : TextureRect

func _set_photo(image_texture : Texture2D):
	Photo_Border.texture = image_texture
