extends Node2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mouseIsBusy = false

var dragDown = false
var currentLine: Line2D
@export var LineScene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func makeNewLine():
	var line = Line2D.new()
	add_child(line)
	return line

func makeLine():
	var inst = LineScene.instantiate()
	remove_child(currentLine)
	inst.add_child(currentLine)
	inst.line = currentLine
	add_child(inst)

func handleClick():
	dragDown = not dragDown
	if not mouseIsBusy:
		if dragDown:
			currentLine = makeNewLine()
		elif not dragDown:
			if currentLine:
				makeLine()
				currentLine = null




func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		call_deferred("handleClick")
		
			
	elif event is InputEventMouseMotion:
		if dragDown and not mouseIsBusy and currentLine:
			currentLine.add_point(event.position)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_gumball_spawn_being_dragged():
	mouseIsBusy = true

func mouseNoBusy():
	mouseIsBusy = false

func _on_gumball_spawn_no_drag():
	mouseIsBusy = false


func _on_gumball_finish_being_dragged():
	mouseIsBusy = true


func _on_gumball_finish_no_drag():
	mouseIsBusy = false
func resetLines():
	var children = get_children()
	for child in children:
		child.queue_free()
