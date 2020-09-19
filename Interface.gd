extends CanvasLayer

signal iniciarJuego

func mostrarMensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$mensajeTimer.start()


func juegoTerminado():
	mostrarMensaje("Game Over")
	yield($mensajeTimer, "timeout")
	$BotonInicio.show()
	$Mensaje.text = "Crazy Ball"
	$Mensaje.show()


func actualizarScore(Puntos):
	$ScoreLabel.text = str(Puntos)


func _on_mensajeTimer_timeout():
	$Mensaje.hide()


func _on_BotonInicio_pressed():
	$BotonInicio.hide()
	emit_signal("iniciarJuego")






