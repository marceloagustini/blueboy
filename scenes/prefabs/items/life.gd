extends Area2D

func _ready():
	$AnimatedSprite.play("idle")

func _on_BrickCrash_body_entered(body):
	if "player" in body.name:
		global.life = global.life + 1
		queue_free()