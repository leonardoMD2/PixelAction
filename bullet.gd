extends Area2D


@export var speed = 50
@export var damage = 20

func _physics_process(delta):
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * delta * speed



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()




func _on_body_entered(body):
	if body.is_in_group("enemy") and body.has_method("take_dmg"):
		body.take_dmg(damage)
		queue_free()
		
