extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 200
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
#	screen_size = get_child()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("derecha"):
		velocity.x += 1
	if Input.is_action_pressed("izquierda"):
		velocity.x -= 1
	if Input.is_action_pressed("abajo"):
		velocity.y += 1
	if Input.is_action_pressed("arriba"):
		 velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
#	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "derecha"
		$AnimatedSprite.flip_v = false
	# See the note below about boolean assignment.
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "arriba"
		$AnimatedSprite.flip_v = velocity.y > 0
		
	
	pass
