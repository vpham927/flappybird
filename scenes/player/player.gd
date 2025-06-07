extends CharacterBody2D

var player_jump_force: int = 1000
var player_speed: int = 10
var player_gravity: int = 1000


func _physics_process(delta) -> void:
	# Player gravity applies first 
	velocity.y += player_gravity * delta
	velocity.x = player_speed
	move_and_slide()

	#If player presses space, call the flap function
	if Input.is_action_just_pressed("flap"):
		flap()
		
	

func flap() -> void:
	velocity.y -= player_jump_force
