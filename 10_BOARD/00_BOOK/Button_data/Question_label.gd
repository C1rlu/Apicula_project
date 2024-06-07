extends Label

@export var button_data : book_button_data
@export var on_over : Control
@onready var button = $"."

func _ready():

    button_data.button_on_over.connect(_on_over)
    button_data.button_signal.connect(push_button)
    button_data.update_text.connect(_update_text)
    
    var col : CollisionShape3D = button_data.button_area.get_node("col")
    col.disabled = false

func _on_over(condition):
    on_over.visible = condition		
    
func _update_text(new_text : String):
        button.text = new_text	
    
func push_button():
    print("PUSH PUSH PUSHHH")	
    _global_datas.responce_receiver_data.emit(button_data)
    _global_datas.start_choice.emit(true)


func _on_tree_exited():
    var col : CollisionShape3D = button_data.button_area.get_node("col")
    col.disabled = true
