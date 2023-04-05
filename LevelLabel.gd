extends Label

var clickedDown = false
var mouseIn = false
# Called when the node enters the scene tree for the first time.
func _ready():
	focus_entered.connect(func(): when_focus_entered())
	focus_exited.connect(func(): when_focus_exited())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _input(event):
	if event is InputEventMouseButton:
		clickedDown = !clickedDown
		if clickedDown and mouseIn:
			print("CLICKED YAYAYAY")
func when_focus_entered():
	mouseIn = true
	print("mousein")
func when_focus_exited():
	mouseIn = false
	print("mouseout")
