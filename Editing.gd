extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func loadFromJSON(json):
	$GumballSpawn.position.x = json.start[0]
	$GumballSpawn.position.y = json.start[1]
	$GumballFinish.position.x = json.end[0]
	$GumballFinish.position.y = json.end[1]
	$LineLoader.loadData(json.lines)
	$Control/LineEdit.text = json.name
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _make_post_request(url, data_to_send, callback):
	var request = HTTPRequest.new()
	add_child(request)
	
	
	# Convert data to json string:
	var query = JSON.stringify(data_to_send)
	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	request.request(url, headers, HTTPClient.METHOD_POST, query)
	request.request_completed.connect(func():
		request.queue_free()
		callback.call())




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
	objToSend.start = [$GumballSpawn.actual_position().x, $GumballSpawn.actual_position().y]
	objToSend.end = [$GumballFinish.actual_position().x, $GumballFinish.actual_position().y]
	objToSend.name = $Control/LineEdit.text
	print(objToSend)
	_make_post_request("https://Draw-to-life-backend.jblitzar.repl.co/upload", objToSend, func():get_parent().change_game_mode("StartMenuMode", {"PersistantObj":objToSend}))
	


func _on_reset_pressed():
	$LineLoader.resetLines()
	$DrawScreen.resetLines()


func _on_play_pressed():
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
	objToSend.start = [$GumballSpawn.actual_position().x, $GumballSpawn.actual_position().y]
	objToSend.end = [$GumballFinish.actual_position().x, $GumballFinish.actual_position().y]
	objToSend.name = $Control/LineEdit.text
	print(objToSend)
	get_parent().change_game_mode("GameLevelMode", {"PersistantObj":objToSend})


func _on_to_level_browse_pressed():
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
	objToSend.start = [$GumballSpawn.actual_position().x, $GumballSpawn.actual_position().y]
	objToSend.end = [$GumballFinish.actual_position().x, $GumballFinish.actual_position().y]
	objToSend.name = $Control/LineEdit.text
	get_parent().change_game_mode("StartMenuMode", {"PersistantObj":objToSend})
