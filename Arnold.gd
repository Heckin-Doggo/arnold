extends AnimatedSprite

# Declare member variables here. Examples:
onready var current_pos = get("transfrom/pos")
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	#$CutScene.connect("arnold_move", self, "on_arnold_move")   # this didnt work for some reason. too lazy to diagnose
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func on_arnold_move():
	$Tween.interpolate_property(self, "transform/pos", current_pos, Vector2(current_pos.x+150, current_pos.y), 
	1.0, Tween.TRANS_BACK, Tween.EASE_OUT)

func _on_CutScene_moveArnold():
	$Tween.interpolate_property(self, "transform/pos", current_pos, Vector2(current_pos.x+150, current_pos.y), 
	1.0, Tween.TRANS_BACK, Tween.EASE_OUT)
