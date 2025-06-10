extends Node2D

var move_speed: int = 200
var off_screen_limit: int = -100

signal scored
var score = 0 

func _process(delta) -> void:
	position.x -= move_speed * delta
	
	if position.x < off_screen_limit:
		queue_free()
		print("deleted pipe")
		
	#score - Check if the player y passes the pipes y, then increase score

func _on_score_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		scored.emit()
		print("player has scored")
		
# Restart game on hit with collision
