extends Node2D




var dragDown = false
var mouseIn = false
var doDrag = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
@export var editorMode = false
@export var gumballScene: PackedScene

signal noDrag



signal my_signal
# Called when the node enters the scene tree for the first time.

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
				$Area2D.global_position = get_global_mouse_position()


func _on_area_2d_mouse_entered():
	mouseIn = true


func _on_area_2d_mouse_exited():
	mouseIn = false


func _on_area_2d_body_entered(body):
	
	if body.get_visibility_layer_bit(0):
		body.call_deferred("queue_free")
