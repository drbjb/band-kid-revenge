extends Spatial
onready var ap = $AnimationPlayer
enum{ 
	TALKING
	IDLE 
}

var state = TALKING

func _process(delta):
	match state:
		TALKING:
			ap.play("Talking")
		IDLE:
			ap.play("Idle")




func _on_trigger_area_player_entered():
	Game.show_dialog("e18fc3c4-38cb-4dcf-90a3-447d93bb3671")
	print("touched")
	pass # Replace with function body.
