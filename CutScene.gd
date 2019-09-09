extends Control

# Declare member variables here. Examples:
onready var label_text = $PanelContainer/Label.text
var time = 0
var number = 1
export var tick_delay = 0.042
onready var arnoldTween = $Arnold/Tween
signal moveArnold

# Called when the node enters the scene tree for the first time.
func _ready():
	print("cutscene is ready")
	# yield(get_tree().create_timer(.001), "timeout")
	main()  # main has the actual cutscene.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta # count this up every second
	if time > 1:
		time -= 1
		label_text = str(number)
		# print(number)
		number +=1


func main():
	print("ACT 1 - Arnold Intro")
	display_text("There once was a young Austrian lad named Arnold.")
	yield(get_tree().create_timer(6), "timeout") # delay so people can read.
	
	print("ACT 2 - Arnold Dad")
	for i in range(100):
		yield(get_tree().create_timer(.005), "timeout") # delay between the move steps. I wish the Tween would work :(
		$Arnold.position.x += 2
	$Father.visible = true
	display_text("His father, Gustav, was a tad bit abusive though.")
	yield(get_tree().create_timer(6), "timeout") # another delay
	display_text("...")
	$Bat.visible = true  # wackin preparation
	yield(get_tree().create_timer(1), "timeout")
	$Bat.visible = false
	$BatBonk.visible = true
	$Bonk.play()
	$Arnold.animation = "sad"  # this might not be correct syntax
	yield(get_tree().create_timer(1), "timeout")
	$BatBonk.visible = false
	$Bat.visible = true
	yield(get_tree().create_timer(1), "timeout")
	#clean up act
	$Bat.visible = false
	$Father.visible = false
	
	print("ACT 3 - Arnold Leaves")
	for i in range(100):
		yield(get_tree().create_timer(.005), "timeout") # delay between the move steps. I wish the Tween would work :(
		$Arnold.position.x += -2
	display_text("Youch. That's gonna leave a mark.")
	yield(get_tree().create_timer(4), "timeout")
	
	$Arnold.animation = "default"  # he's chill again
	display_text("But eventually, Arnold decides to leave.\nOff to the United States!")
	for i in range(400):
		yield(get_tree().create_timer(.005), "timeout") # delay between the move steps. 
		$Arnold.position.x += -2
	
	get_tree().change_scene("res://maps/Map1.tscn") # begin the game.
		
	


func ticker(dialog):  # returns a list of all the ticked (1 char at a time) dialog
	var ticker_list = []
	var current_string = ""
	for c in dialog:
		current_string = current_string + c # add the letter to the current string
		ticker_list.append(current_string) # add the current string to the ticker list.
	return ticker_list


func dialog(dialog_list):
	for tick in dialog_list:  # tick is the segment of the dialog. 1 character more than last tick
		yield(get_tree().create_timer(tick_delay), "timeout") # delay between ticks.
		$PanelContainer/Label.text = tick
		$Tick.play()
		print("ticked")
	print("done ticking dialog")
		

func display_text(words):
	var dialog_list = ticker(words)
	dialog(dialog_list)
	print("Displayed: " + words)
	





