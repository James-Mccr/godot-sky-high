extends CharacterBody2D

var jump_override = false
var acc_h = 10
var speed_h = 50
var speed_v = -100
const GRAVITY = 150

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_slide()
	
	if (Input.is_action_pressed("ui_left")):
		if (velocity.x > -speed_h):
			velocity.x -= acc_h
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")
	elif (Input.is_action_pressed("ui_right")):
		if (velocity.x < speed_h):
			velocity.x += acc_h
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk")
	else:
		if (velocity.x != 0):
			velocity.x *= 0.95
		$AnimatedSprite2D.play("default")
		
	if (is_on_floor() && Input.is_action_pressed("ui_accept")):
		jump_override = false
		velocity.y = speed_v
	else:
		if (!jump_override && velocity.y < 0 && !Input.is_action_pressed("ui_accept")):
			velocity.y *= 0.95
		velocity.y += GRAVITY*delta
