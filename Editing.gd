extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _make_post_request(url, data_to_send):
	var request = HTTPRequest.new()
	add_child(request)
	
	
	# Convert data to json string:
	var query = JSON.stringify(data_to_send)
	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	request.request(url, headers, HTTPClient.METHOD_POST, query)
	request.request_completed.connect(func():request.queue_free())




func _on_button_pressed():#Pressed uplaod button
	var children = $DrawScreen.get_children()
	var childPoints = []
	
	for child in children:
		#print(child.points)
		#print(Array(child.points))
		var linePoints = []
		for point in Array(child.points):
			linePoints.append([point.x, point.y])
		if linePoints != []:
			childPoints.append(linePoints)
	var objToSend = {}
	objToSend.lines = childPoints
	objToSend.start = [$GumballSpawn.position.x, $GumballSpawn.position.y]
	objToSend.end = [$GumballFinish.position.x, $GumballFinish.position.y]
	print(objToSend)
	_make_post_request("https://Draw-to-life-backend.jblitzar.repl.co/upload", objToSend)
	
