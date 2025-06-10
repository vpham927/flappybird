extends CharacterBody2D

var player_jump_force: int = 1000
var player_gravity: int = 1000

var game_over: bool = false


func _physics_process(delta) -> void:
	# Player gravity applies first
	velocity.y += player_gravity * delta
	# Check if the player is out of bounds
	var screen_height = get_viewport_rect().size.y
	if position.y < 0 or position.y > screen_height:
		_game_over()
		
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		print("Collided with : ", collision.get_collider().name)
		if collider.name.ends_with("Pipe"):
			_game_over()
		

	#If player presses space, call the flap function
	if Input.is_action_just_pressed("flap"):
		flap()	

func flap() -> void:
	velocity.y -= player_jump_force

func _restart_game():
	var game_over_scene = preload("res://game_over.tscn").instantiate()
	get_tree().root.add_child(game_over_scene)

func _game_over():
	if not game_over:
				game_over = true
				get_tree().paused = true
				_restart_game()
				$"../GameOver".visible = true
