extends Area2D

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_Punto_area_entered(area):
	queue_free()
