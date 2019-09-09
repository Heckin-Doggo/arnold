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

# the end cutscene
func main():
	print("ACT 1 - Arnold makes it out")
	$Arnold.animation = "happy"
	display_text("So Arnold makes it to California.")
		
	


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
	





