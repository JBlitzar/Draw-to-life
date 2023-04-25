extends GameMode
var persistID = ""
func change_game_mode(mode: String, args: Dictionary={}):
	if args.has("id"):
		persistID = args.id
	emit_signal("switch_game_mode", mode)
