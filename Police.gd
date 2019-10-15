extends KinematicBody2D

# Declare member variables here. Examples:
export var walkspeed = -125
var gravity = 2000  # same as player's
var velocity = Vector2()
var terminal_velocity = 3500
export var left = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if not left:
		$Sprite.flip_h = true
		walkspeed = -walkspeed

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	var old_x = position.x
	
	# move left and right yeah
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1)) # i have no idea how the hell this works but im not gonan touch it
	velocity.y = clamp(velocity.y, -terminal_velocity, terminal_velocity)
	velocity.x = walkspeed
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	#debug
	print("oldx: " + str(old_x))
	print("current: " + str(position.x))
	
	if round(position.x) == round(old_x):  # if it didnt move
		$Sprite.flip_h = !$Sprite.flip_h  #opposite
		walkspeed = -walkspeed  # flip walkspeed direction
	