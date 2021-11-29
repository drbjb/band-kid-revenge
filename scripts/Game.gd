# This defines the global Game object

extends Node

# use Game.dialog to check if a dialog is open (so you can ignore input)
var dialog = null
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
func _input(event):
	# if there is no dialog, use keys to move camera
	if dialog == null:
		# find the current viewport camera
		var camera = get_node("/root").get_viewport().get_camera()
		
		if event.is_action_pressed('ui_up'):
			camera.transform.origin.z -= 1

		if event.is_action_pressed('ui_down'):
			camera.transform.origin.z += 1
		
		if event.is_action_pressed('ui_left'):
			camera.transform.origin.x -= 1

		if event.is_action_pressed('ui_right'):
			camera.transform.origin.x += 1

