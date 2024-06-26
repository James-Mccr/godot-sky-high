extends CharacterBody2D

var speed = 50
const GRAVITY = 150

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (Input.is_action_pressed("ui_left")):
		velocity.x = -speed
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")
	elif (Input.is_action_pressed("ui_right")):
		velocity.x = speed
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk")
	else:
		velocity.x = 0
		$AnimatedSprite2D.play("default")
		
	if (is_on_floor() && Input.is_action_pressed("ui_accept")):
		velocity.y = -2.5*speed
	else:
		if (velocity.y < 0 && !Input.is_action_pressed("ui_accept")):
			velocity.y *= 0.95
		velocity.y += GRAVITY*delta
	move_and_slide()
