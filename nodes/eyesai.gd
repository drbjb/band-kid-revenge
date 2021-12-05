extends KinematicBody

export var hears_sound = false

enum{
	EYESRUN
	DEFAULT
}

var state = DEFAULT
var path = []
var path_node = 0
var speed = 5
var target = player

onready var nav = get_node("/root/Spatial/Navigation")
onready var player = get_node("/root/Spatial/player")
onready var musicbox = get_node("/root/Spatial/Musicbox")
onready var ap = $AnimationPlayer


func _physics_process(delta):
	if path_node < path.size():
		var direction = (path[path_node] - global_transform.origin)
		if direction.length() < 1:
			path_node += 1
		else:
			move_and_slide(direction.normalized() * speed, Vector3.UP)
func _process(delta):
	match state:
		DEFAULT:
			ap.play("Default")
		EYESRUN:
			ap.play("eyesrun")
##look_at(player_node.global_transform.origin, Vector3.UP)

func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_node = 0
#	pass

##


func _on_Timer_timeout():
	print(player)
	if hears_sound == false:
			move_to(player.global_transform.origin)
			state = EYESRUN
	if hears_sound == true:
		print("yo")

		

