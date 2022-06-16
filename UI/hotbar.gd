extends GridContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree(), "idle_frame")
	rect_position.x = (get_viewport_rect().size.x - rect_size.x) / 2
	rect_position.y = get_viewport_rect().size.y - rect_size.y - 8
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
