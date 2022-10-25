extends Node

export(int) var speed := 200

func _physics_process(delta):
	var movement_vec = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		movement_vec.x += speed * delta
	if Input.is_action_pressed("ui_left"):
		movement_vec.x -= speed * delta
	get_parent().position += movement_vec
