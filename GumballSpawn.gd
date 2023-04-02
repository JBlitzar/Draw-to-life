extends Node2D




var dragDown = false
var mouseIn = false
var doDrag = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
@export var editorMode = false
@export var interval: int = 2
@export var gumballScene: PackedScene

signal noDrag



signal my_signal
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = interval
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var inst = gumballScene.instantiate()
	add_child(inst)
	emit_signal("my_signal")



signal beingDragged
	
func _input(event):
	if editorMode:
		# Mouse in viewport coordinates.
		if event is InputEventMouseButton:
			dragDown = not dragDown
			if dragDown:
				#clicked in
				if mouseIn:
					doDrag = true
					print("emit beingDragged")
					emit_signal("beingDragged")
			elif not dragDown:
				#unclicked out
				doDrag = false
				emit_signal("noDrag")
				
		elif event is InputEventMouseMotion:#mouse moving
			if dragDown and doDrag:
				position = get_global_mouse_position()


func _on_area_2d_mouse_entered():
	mouseIn = true


func _on_area_2d_mouse_exited():
	mouseIn = false
