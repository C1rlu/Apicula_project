@tool
extends Node3D

@export var photo_data : PhotoData

@export var img_symbol : CompressedTexture2D
@export var img_page_alpha : CompressedTexture2D

@onready var render_page = $Symbols_page_prefab/Render_page
@onready var render_symbols = $Symbols_page_prefab/Render_symbols

@onready var page_mat : Material = render_page.get_surface_override_material(0)
@onready var symb_mat : Material = render_symbols.get_surface_override_material(0)

func _run():
	page_mat.set_shader_parameter("Alpha",img_page_alpha)
	symb_mat.set_shader_parameter("Symbols",img_symbol)

func _ready():
	page_mat.set_shader_parameter("Alpha",img_page_alpha)
	symb_mat.set_shader_parameter("Symbols",img_symbol)

