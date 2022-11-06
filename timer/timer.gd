extends Control

export var tiempo : int = 0

onready var label = $MarginContainer/Label
onready var timer = $Timer
onready var texture_progres = $MarginContainer/TextureProgress
var salir_nivel = false


func _ready():
	label.text = str(tiempo)
	timer.wait_time = tiempo
	timer.start()
	
	texture_progres.max_value = tiempo
	
	print(timer.wait_time)

func _process(delta):
	if !salir_nivel:
		label.text = str(int($Timer.time_left))
		texture_progres.value = int($Timer.time_left)


func _on_Timer_timeout():
	if salir_nivel:
		get_tree().change_scene("res://MenuInicio/MenuInicio.tscn")
	else:
		timer.stop()
		timer.wait_time = 4
		timer.start()
		salir_nivel = true
		
		label.hide()
	
	print("perdiste . . .")
	$MarginPerder.show()


