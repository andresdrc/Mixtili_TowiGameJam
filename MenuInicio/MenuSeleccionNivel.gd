extends Control

func _ready():
	$MarginContainer/HBoxContainer/TextureButton.self_modulate = Color(1,1,1,0)
	print(str(Global.nivel_1) +" "+ str(Global.nivel_2) +" "+ str(Global.nivel_3) )

	
	if !Global.nivel_2:
		$MarginContainer/HBoxContainer/TextureButton2.self_modulate = Color(1,1,1,0.7)
	else:
		$MarginContainer/HBoxContainer/TextureButton2.self_modulate = Color(1,1,1,0)
	if !Global.nivel_3:
		$MarginContainer/HBoxContainer/TextureButton3.self_modulate = Color(1,1,1,0.7)
	else:
		$MarginContainer/HBoxContainer/TextureButton3.self_modulate = Color(1,1,1,0)



func _on_TextureButton_pressed():
	if Global.nivel_1:
		get_tree().change_scene("res://Puzzle/pez/PuzzlePez.tscn")

func _on_TextureButton2_pressed():
	if Global.nivel_2:
		get_tree().change_scene("res://Puzzle/gato/PuzzleGato.tscn")

func _on_TextureButton3_pressed():
	if Global.nivel_3:
		get_tree().change_scene("res://Puzzle/dinosaurio/PuzzleDinosaurio.tscn")

func _on_TextureButton4_pressed():
	get_tree().change_scene("res://MenuInicio/MenuFiesta.tscn")


func _on_BotonSalir_pressed():
	get_tree().change_scene("res://MenuInicio/MenuInicio.tscn")

func _on_BotonCreditos_pressed():
	get_tree().change_scene("res://MenuInicio/Creditos.tscn")
