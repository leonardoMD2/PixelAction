extends Node2D


@export var enemy: PackedScene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn():
	var new_enemy = enemy.instantiate()
	new_enemy.global_position = $Marker2D.global_position
	add_child(new_enemy)
	




func _on_timer_timeout():
	spawn() # Replace with function body.
