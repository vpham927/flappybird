extends Node2D

# Spawn the pipes
var pipe_scene = preload("res://scenes/pipes/pipes.tscn")
var score = 0;

func _ready():
	# Spawn the pipes
	$Timer.start()
	

func _on_timer_timeout() -> void:
	var pipe = pipe_scene.instantiate()
	#Declare the pipe position / we want the y position to be random
	var pipe_x = 700
	var pipe_min_y = 100
	var pipe_max_y = 600
	var pipe_y = randf_range(pipe_min_y, pipe_max_y)
	pipe.position = Vector2(pipe_x, pipe_y)
	pipe.scored.connect(scored)
	print("Connected pipe signal!")
	get_parent().add_child(pipe)

func scored():
	score +=1
	var label = get_node("CanvasLayer/ScoreLabel")
	label.text = "Score: %d" % score


 
