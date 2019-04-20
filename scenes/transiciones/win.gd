extends Node2D

func _ready():
	$Timer.start()

func _on_Timer_timeout():
	if global.scene == 1:
		get_tree().change_scene("scenes/StageOne.tscn")
