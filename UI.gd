extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("inventario"):
#		$inventario.rect_position.x = (get_viewport_rect().size.x - rect_size.x) / 2
#		$inventario.rect_position.y = get_viewport_rect().size.y - rect_size.y - 8
		$inventario.visible = !$inventario.visible
#		$inventario.initialize_inventory()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
