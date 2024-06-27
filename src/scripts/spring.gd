extends Area2D

const base_power = 200

func _on_body_entered(body):
	if (int(rotation_degrees) == 0):
		body.velocity.y = -base_power
	elif (int(rotation_degrees) == 90):
		body.velocity.x = base_power
	elif(int(rotation_degrees) == 180):
		body.velocity.y = base_power
	else:
		body.velocity.x = -base_power
	body.jump_override = true
	$AnimatedSprite2D.play("boing")
	
func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.play("default")
