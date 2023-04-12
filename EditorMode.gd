extends GameMode

var PersistantObj = {}

func load_root_scene():
	var inst = rootScene.instantiate()
	add_child(inst)
	if PersistantObj != {}:
		inst.loadFromJSON(PersistantObj)


func change_game_mode(mode: String, args={}):
	if args.has("PersistantObj"):
		PersistantObj = args["PersistantObj"]
	emit_signal("switch_game_mode", mode)
