extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	getById(1)
func _make_get_request(url, callback):
	var request = HTTPRequest.new()
	add_child(request)
	
	

	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	request.request(url, headers, HTTPClient.METHOD_GET)
	request.request_completed.connect(func(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray):
		
		request.queue_free()
		
		callback.call(body)
		
		
		)





func getById(id):
	_make_get_request("localhost:3000/getlevel?id="+str(id), func(body):
		
		var json = JSON.parse_string(body.get_string_from_utf8())
		$GumballSpawn.position.x = json.start.x
		$GumballSpawn.position.y = json.start.y
		$GumballFinish.position.x = json.end.x
		$GumballFinish.position.y = json.end.y
		$LineLoader.loadData(json.lines)
		)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
