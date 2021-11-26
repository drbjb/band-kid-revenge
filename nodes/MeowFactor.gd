extends Panel


export var meowfactor = 0

func _ready():
	$MeowTeller.text = "Meows: " + str(meowfactor)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
