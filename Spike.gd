extends Area2D
signal player_entered

# Load Global variables
onready var globals = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("spikes")  # initialize
	connect("body_entered", self, "_on_Spike_body_entered")

#func _process(delta):
#	pass

func _on_Spike_body_entered(body):
	if body.name == "Player":
		print("OOF")
		if not globals.player["died"]:
			globals.player["lives"] -= 1
			globals.player["died"] = true
			get_tree().reload_current_scene()