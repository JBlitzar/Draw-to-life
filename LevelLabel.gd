extends HBoxContainer

signal selected_level(id:String)
var id: String = ""
var level_name: String = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = level_name + " ID: "+id

func _on_button_pressed():
	selected_level.emit(name)
