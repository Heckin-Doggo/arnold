extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var globals = get_node("/root/Globals")
export var movie = "terminator1"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Cover.animation = movie # set cover sprite to the movie being collected
	connect("body_entered", self, "_on_Movie_body_entered")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Movie_body_entered(body):
	if body.name == "Player":
		globals.collectables[movie] = true
		$CollectSound.play()
		yield(get_tree().create_timer(.1), "timeout")
		print("Collected: " + movie)
		hide()
		queue_free() # delete from current scene