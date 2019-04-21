extends Area2D

func _ready():
	pass # Replace with function body.

func _timeout():
	get_tree().change_scene("scenes/transiciones/win.tscn")

	
func _on_gate_body_entered(body):
	if "Felipe" in body.name:
		$AnimatedSprite.play("open")
		body.queue_free()
		var t = Timer.new()
		self.add_child(t)
		t.set_one_shot(true)
		t.set_wait_time(2)
		t.connect("timeout", self, "_timeout")
		t.start()

