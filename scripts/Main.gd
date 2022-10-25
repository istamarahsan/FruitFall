extends Node

const apple_scene = preload("res://Apple.tscn")
var rng := RandomNumberGenerator.new()

onready var display := $Display

var score := 0
var missed := 0

func _ready():
	rng.randomize()
	display.SetScore(score)
	display.SetMissed(missed)

func _on_SpawnTimer_timeout():
	var spawn_position := rng.randf_range(0.0, 1.0)
	$SpawnPath/SpawnLocation.unit_offset = spawn_position
	
	var apple = apple_scene.instance()
	add_child(apple)
	move_child(apple, $Display.get_index()-1)
	apple.position = $SpawnPath/SpawnLocation.position
	apple.position.y -= 30


func _on_Ground_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.is_in_group("Apples"):
		missed += 1
		display.SetMissed(missed)

func _on_Bucket_AppleCaught(apple):
	apple.visible = false
	apple.sleeping = true
	apple.queue_free()
	score += 1
	display.SetScore(score)
