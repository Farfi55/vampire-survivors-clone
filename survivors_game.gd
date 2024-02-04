extends Node2D
@onready var path_follow_2d: PathFollow2D = %PathFollow2D

func _ready() -> void:
	for x in 5:
		spawn_mob()

func spawn_mob() -> void:
	var new_mob = preload("res://characters/mob.tscn").instantiate()
	path_follow_2d.progress_ratio = randf()
	new_mob.global_position = path_follow_2d.global_position
	add_child(new_mob)
	
	


func _on_timer_timeout() -> void:
	spawn_mob()


func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true
