extends CharacterBody2D


@export var SPEED = 300.0
@export var damage = 25
@export var bullet :PackedScene
@onready var mark = $Marker2D


func get_input():
	look_at(get_global_mouse_position())
	velocity = transform.x * Input.get_axis("ui_down", "ui_up") * SPEED
	
	if Input.is_action_just_pressed("right_click"):
		shoot()

func _physics_process(delta):
	get_input()
	print(position)
	move_and_slide()


func shoot():
	var new_bullet_scene = bullet.instantiate()
	new_bullet_scene.global_position = mark.global_position
	new_bullet_scene.global_rotation = mark.global_rotation
	new_bullet_scene.damage = damage
	get_parent().add_child(new_bullet_scene)
	
	
func back_drop():
	position -= Vector2(-20,-20) * 1.3
	print("back")


	


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		back_drop()
		print("dmg")
