extends Node

func _ready():
	var viewport = get_viewport()
	$SubViewportContainer.position = Vector2(viewport.size.x/2-$SubViewportContainer/SubViewport.size.x/2, $SubViewportContainer/SubViewport.size.y/2)
	Signals.win.connect(win)
	
func win():
	$Hud.visible = true
	get_tree().paused = true
	await get_tree().create_timer(5.0).timeout
	get_tree().quit()
