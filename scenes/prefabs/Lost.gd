extends KinematicBody2D

const GRAVITY = 10
const SPEED = 60
const FLOOR = Vector2(0,-1)
export (Vector2) var startPos = Vector2(1,1)

var velocity = Vector2()
var direction = 1
var is_dead = false

func _ready():
	pass

func _timeout():
	is_dead = false
	position = (startPos)

func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$AnimatedSprite.play("die")
	#$CollisionShape2D.set_deferred("disabled", true)
	#timer with codes
	var t = Timer.new()
	self.add_child(t)
	t.set_one_shot(true)
	t.set_wait_time(1)
	t.connect("timeout", self, "_timeout")
	t.start()

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
		
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "hell" in get_slide_collision(i).collider.name:
				dead()
