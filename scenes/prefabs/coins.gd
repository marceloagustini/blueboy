extends Node2D

func _ready():
	$Sprite/AnimationPlayer.get_animation("gira").set_loop(true)
	$Sprite/AnimationPlayer.play("gira")

func _on_Area2D_body_entered(body):
	hide()
	$Area2D.queue_free()
	global.coins = global.coins + 1
	print(global.coins)
