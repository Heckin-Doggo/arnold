extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var globals = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_Police_body_entered")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Police_body_entered(body):
	if body.name == "Player":
		print("OOF")
		if not globals.player["died"]:
			globals.player["lives"] -= 1
			globals.player["died"] = true
			get_tree().reload_current_scene()