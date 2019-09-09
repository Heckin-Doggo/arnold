extends Control

# Declare member variables here. Examples:
onready var label_text = $PanelContainer/Label.text
onready var globals = get_node("/root/Globals")
var time = 0
var number = 1
export var tick_delay = 0.042
onready var arnoldTween = $Arnold/Tween
var movies = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("cutscene is ready")
	# yield(get_tree().create_timer(.001), "timeout")
	# movie check
	if globals.collectables["terminator1"]:
		$Terminator1.visible = true
		movies += 1
	if globals.collectables["terminator2"]:
		$Terminator2.visible = true
		movies += 1
	if globals.collectables["terminator3"]:
		$Terminator3.visible = true
		movies += 1
	if globals.collectables["expendables2"]:
		$Expendables2.visible = true
		movies += 1
	if globals.collectables["expendables3"]:
		$Expendables3.visible = true
		movies += 1
	if globals.collectables["eraser"]:
		$Eraser.visible = true
		movies += 1
	if globals.collectables["the6thday"]:
		$The6thDay.visible = true
		movies += 1
	if globals.collectables["predator"]:
		$Predator.visible = true
		movies += 1
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
	# $Arnold.animation = "happy"
	display_text("So Arnold did in fact make it to California.")
	yield(get_tree().create_timer(6), "timeout")
	
	print("ACT 2 - Movie Tally")
	# bad ending
	if movies == 0:
		display_text("But he never really persued an acting career...")
		yield(get_tree().create_timer(6), "timeout")
		$Arnold.animation = "sad"
		display_text("Therefore, nobody knew about him and he didn't become\n the governor of California. Sad!")
		yield(get_tree().create_timer(10), "timeout")
	
	#perfect ending
	elif movies == 8:
		$Arnold.animation = "happy"
		display_text("Along his journey, he made a series of blockbusters. \n He became very well known.")
		yield(get_tree().create_timer(8), "timeout")
		$Arnold.position = Vector2(9999,9999)  # get rid of the chap
		$Governator.visible = true  # hasta la vista, baby
		display_text("So much so, in fact, that he became elected \n the Governor of California! \n Amazing!")
		yield(get_tree().create_timer(10), "timeout")
		display_text("Arnold Schwarzenegger truly got to\n live out the American Dream.")
		yield(get_tree().create_timer(7), "timeout")
		
	else:
		$Arnold.animation = "happy"
		display_text("Along his journey, he acted in some movies. ")
		yield(get_tree().create_timer(6), "timeout")
		display_text(str(movies) + " of them, in fact. They turned out well.")
		yield(get_tree().create_timer(7), "timeout")
		$Arnold.animation = "default"
		display_text("Unfortunately, this wasn't enough to get him \n elected as Governor of California.")
		yield(get_tree().create_timer(8), "timeout")
		$Arnold.animation = "happy"
		display_text("It may not be the end goal, \nbut he made a good living in the process.")
		yield(get_tree().create_timer(8), "timeout")
	
	#roll credits
	display_text("Thanks for Playing.")
	yield(get_tree().create_timer(5), "timeout")
	display_text("A game by Neil & Bode.")
	yield(get_tree().create_timer(5), "timeout")
	display_text("Neil - Programming, Organizing, Designs, Sounds")
	yield(get_tree().create_timer(6), "timeout")
	display_text("Bode - Levels, Textures, Ideas/Concepts")
	yield(get_tree().create_timer(6), "timeout")
	display_text("Our 3 Sources are located in a Google Docs.\n Should ship separately.")
	yield(get_tree().create_timer(6), "timeout")
	display_text("Thanks for playing!")
	yield(get_tree().create_timer(90), "timeout")
	display_text("You're still here? Alrighty then.")
		
		
		
		
		
	


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
	





