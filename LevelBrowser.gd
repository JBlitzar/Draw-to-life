extends Node2D
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
func reload_items():
	_make_get_request("https://Draw-to-life-backend.jblitzar.repl.co/levels", func(body):
		
		print(body.get_string_from_utf8())
		var json = JSON.parse_string(body.get_string_from_utf8())
		print(json)
		for key in json.keys():
			var label = Label.new()
			label.text = json[key]+"; ID: "+key
			$Control/ScrollContainer/VBoxContainer.add_child(label)
		
		
		)




# Called when the node enters the scene tree for the first time.
func _ready():
	reload_items()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_reload_pressed():
	reload_items()
