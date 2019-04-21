extends Node2D

func _ready():
	$Timer.start()

func _on_Timer_timeout():
	if global.scene == 1:
		get_tree().change_scene("scenes/levels/lvl2/level2.tscn")
		global.scene = 2
