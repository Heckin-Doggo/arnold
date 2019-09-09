extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var globals = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	# reset
	globals.player = {"lives": 5,"hit_points": 3,"died": false}
	globals.collectables = {"eraser" : false,"expendables2": false,"expendables3": false,"predator": false,"terminator1": false,"terminator2": false,"terminator3": false,"the6thday": false}
	
	$StartButton.connect("pressed", self, "_on_StartButton_pressed")
	$ControlsButton.connect("pressed", self, "_on_ControlsButton_pressed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_StartButton_pressed():
	print("STARTING GAME")
	get_tree().change_scene("res://CutScene.tscn")
	
func _on_ControlsButton_pressed():
	print("Controls Menu")
	get_tree().change_scene("res://Demo.tscn")
