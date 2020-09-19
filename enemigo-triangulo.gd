extends RigidBody2D

export (int) var velocidad_min = 100
export (int) var velocidad_max = 350

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_VisibilityNotifier2D_screen_exited():
	get_parent().remove_child(self)
	queue_free()
