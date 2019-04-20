extends Area2D
const SPEED = 300
var velocity =  Vector2()
var direction = 1

func _ready():
	pass 
	
func set_fireball_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$AnimatedSprite.play("shot")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Fireball_body_entered(body):
	if "Enemy" in body.name:
		body.dead(position.x)
	if "player" in body.name:
		body.dead()
	if "TileMap" in body.name:
		body.remove_wall(get_position())
	queue_free()
