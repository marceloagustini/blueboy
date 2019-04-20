extends KinematicBody2D

export (int) var SPEED = 60
export (int) var HP = 1
export (bool) var rebota = false
export (Vector2) var size = Vector2(1,1)

const GRAVITY = 10
const FLOOR = Vector2(0,-1)
const FIREBALL = preload("res://scenes/prefabs/bullets/enemy_bullet_1.tscn")

var velocity = Vector2()
var direction = 1
var is_dead = false


func _ready():
	scale = size
	pass

func shoot(x):
	if rebota:
		var fireball = FIREBALL.instance()
		print(x)
		print(self.position.x)
		
		if self.position.x > x:
			fireball.set_fireball_direction(-1)
		else:
			fireball.set_fireball_direction(1)
		add_child(fireball)
	
func dead(x):
	HP = HP - 1
	if HP <= 0:
		is_dead = true
		velocity = Vector2(0,0)
		$AnimatedSprite.play("die")
		$CollisionShape2D.set_deferred("disabled", true)
		shoot(x)
		$Timer.start()

func _physics_process(delta):
	if is_dead == false:
		velocity.x = SPEED * direction
		
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
			
		$AnimatedSprite.play("walk")
		velocity.y += GRAVITY
		velocity = move_and_slide(velocity,FLOOR)
		
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1
		
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1
		
	if get_slide_count() > 0:
		for i in range (get_slide_count()):
			if "player" in get_slide_collision(i).collider.name:
				get_slide_collision(i).collider.dead()

func _on_Timer_timeout():
	queue_free()
