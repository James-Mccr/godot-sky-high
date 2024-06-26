extends Area2D

func _on_body_entered(body):
	body.velocity.y = -800
	$AnimatedSprite2D.play("boing")
	await $AnimatedSprite2D.animation_finished
	$AnimatedSprite2D.play("default")
	
