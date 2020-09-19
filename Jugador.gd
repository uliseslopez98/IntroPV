extends Area2D

export (int) var Speed = 200
var limite
signal golpe
signal punto

func _ready():
	hide()
	limite = get_viewport_rect().size

func _process(delta):
	_update_position(delta)

func _update_position(delta):
	var mouse = get_global_mouse_position()
	look_at(mouse)
	var vec_target = (mouse - global_position)
	if vec_target.length() > $CollisionShape2D.shape.radius/3:
		var dir = vec_target.normalized()
		position += dir * Speed * delta
	
	if Input.is_action_just_pressed("ui_accept"):
		dash()
	
	position.x = clamp(position.x, 55, limite.x - 55)
	position.y = clamp(position.y, 55, limite.y - 55)

func _on_Jugador_body_entered(body):
	emit_signal("golpe")
	hide()
	$CollisionShape2D.disabled = true


func _on_Jugador_area_entered(area):
	emit_signal("punto")

func inicio(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func dash():
	Speed = Speed * 3
	$TimerDash.start()

func _on_TimerDash_timeout():
	Speed = Speed / 3
