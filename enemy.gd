extends CharacterBody2D

@onready var player = $"../player"
@export var speed = 1000
@export var health = 100
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed 
	move_and_slide()


func take_dmg(damage):
	if(health > 0):
		health -= damage
	else:
		death()

func death():
	queue_free()
