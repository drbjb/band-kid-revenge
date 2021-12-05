# This defines the global Game object

extends Node

# use Game.dialog to check if a dialog is open (so you can ignore input)
var dialog = null
var hears_sound = false
#audioplayercollisioncheckthing
var audioplayer = ("res://nodes/audio_player.tscn")

#these variables available in dialog 
var has_met_ur_bestie = false

# show a SayWhat dialog
func show_dialog(id: String) -> void:
	dialog = yield(DialogueManager.get_next_dialogue_line(id), "completed")
	if dialog != null:
		var balloon = ResourceLoader.load("res://scenes/Dialog.tscn").instance()
		balloon.handle(dialog)
		add_child(balloon)
		show_dialog(yield(balloon, "dialog_actioned"))

func _ready():
	# load the saywhat dialog file
	DialogueManager.resource = preload("res://dialog/Game.tres")
	DialogueManager.game_state = Game
# manage game-wide input
# this is very simple camera, normally you would put stuff in _process
# and have a point that the camera moves towards


