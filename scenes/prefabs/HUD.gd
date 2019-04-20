extends CanvasLayer

func _ready():
	pass # Replace with function body
	
func _process(delta):
	$VBoxContainer/HBoxContainer/coins.set_text(str(global.coins))
	$VBoxContainer/HBoxContainer3/life.set_text(str(global.life))
	$VBoxContainer/HBoxContainer2/weapon.set_text(global.weapon)