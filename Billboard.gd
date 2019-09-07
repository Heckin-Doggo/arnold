extends Node2D

# Declare member variables here. Examples:
export var words = "Sample Text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = words

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
