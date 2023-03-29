extends Line2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dragDown = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		dragDown = not dragDown
	elif event is InputEventMouseMotion:
		if dragDown:
			self.add_point(event.position)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
