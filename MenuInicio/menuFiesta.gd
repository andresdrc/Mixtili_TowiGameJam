extends Node2D

func _ready():
	if Global.nivel_2:
		$Pez1.show()
	if Global.nivel_3:
		$Gato1.show()
	if Global.nivel_4:
		$Dino1.show()
		$TowiFront.show()
		$Tuki.show()


func _on_BotonSalir_pressed():
	get_tree().change_scene("res://MenuInicio/MenuSeleccionNivel.tscn")
