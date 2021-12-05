extends Area

var active = true
export var one_shot = false
onready var hears_sound

func _body_entered(var body):
	if body.is_in_group("badguy") and active:
		hears_sound = true
		if one_shot:
			active = false

func _body_exited(var body):
	if body.is_in_group("badguy") and active:
		emit_signal("badguy_done")
		if one_shot:
			active = false
