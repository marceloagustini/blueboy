extends Area2D

func _ready():
	pass # Replace with function body.

func _on_gate_body_entered(body):
	if "Felipe" in body.name:
		$AnimatedSprite.play("open")
		body.queue_free()
