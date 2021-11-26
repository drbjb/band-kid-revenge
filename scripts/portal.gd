extends Node

export var path = "test"

func _portal_use():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	fader._fade_start(path)


func _on_trigger_area_player_entered():
	_portal_use()
