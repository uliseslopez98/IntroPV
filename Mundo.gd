extends Node
export (PackedScene) var Triangulo
export (PackedScene) var Cuadrado

var Score = 0

func _ready():
	randomize()
	$Spawnea.hide()
	$Spawnea2.hide()
	$Spawnea3.hide()

func nuevoJuego():
	Score = 0
	$Jugador.inicio($Position2D.position)
	Spawn()
	$Interface/ScoreLabel.show()
	$inicioTimer.start()
	$Interface.mostrarMensaje("Comencemos!")
	$Interface.actualizarScore(Score)

func Spawn():
	instanciarSpaw($Spawnea)
	instanciarSpaw($Spawnea2)
	instanciarSpaw($Spawnea3)
	
func instanciarSpaw(sp):
	#seleccionar un lugar aleatorio en el camino
	$camino/aparicion.set_offset(randi())
	sp.show()
	sp.position = $camino/aparicion.position

func gameOver():
	$trianguloTimer.stop()
	$CambioSpawn.stop()
	$PuntosTimer.stop()
	$Interface.juegoTerminado()
	

func _on_inicioTimer_timeout():
	$trianguloTimer.start()
	$CambioSpawn.start()
	$PuntosTimer.start()

func _on_trianguloTimer_timeout():
	instTriangulo($Spawnea)
	instTriangulo($Spawnea2)
	instTriangulo($Spawnea3)

func instTriangulo(spawn):
	var T = Triangulo.instance()
	add_child(T)
	var d =  spawn.rotation + PI /4
	T.position = spawn.position
	d  += rand_range(-PI, PI)
	T.rotation = d
	T.set_linear_velocity(Vector2(rand_range(T.velocidad_min, T.velocidad_max), 0).rotated(d))

func _on_PuntosTimer_timeout():
	$Lugar/Agarrar.set_offset(randi())
	var P = Cuadrado.instance()
	add_child(P)
	P.position = $Lugar/Agarrar.position

func _on_Jugador_punto():
	Score += 1
	$Interface.actualizarScore(Score)

func _on_CambioSpawn_timeout():
	Spawn()
