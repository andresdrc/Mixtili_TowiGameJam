extends Node2D

var nodos_areas : Array
var figuras_por_resolver : Dictionary
var figuras_resueltas : Dictionary

var pos_correcta : bool = false
var nodo_actual

var terminando_nivel = false
func _ready():
	
	var nodos = get_children()
	
	for nodo in nodos:
		if nodo is Area2D:
			nodos_areas.append(nodo)
			nodo.connect("area_entered", self, "_on_Area2D_entered",[nodo.get_name()])
			nodo.connect("area_exited", self, "_on_Area2D_exited", [nodo.get_name()])
		
			figuras_por_resolver[nodo.get_name()] = false
			figuras_resueltas[nodo.get_name()] = true


func _on_Area2D_entered(area, silueta_nombre):

	if silueta_nombre == area.get_parent().get_name():
		pos_correcta = true
		nodo_actual = silueta_nombre


func _on_Area2D_exited(area, silueta_nombre):
	if silueta_nombre == area.get_parent().get_name():
		pos_correcta = false
		figuras_por_resolver[nodo_actual] = false

func _input(event):
	if event is InputEventMouseButton and !terminando_nivel:
		if event.button_index == 1 :
			if !event.pressed and pos_correcta:
				figuras_por_resolver[nodo_actual] = true
			
				if figuras_por_resolver.hash() == figuras_resueltas.hash():
					print("Fin Nivel")
					var nombre_escena = get_tree().current_scene.name
					print("NOMBRE ESCENA: " + nombre_escena )
					match nombre_escena:
						"PuzzlePez":
							Global.nivel_2 = true
							print("desde silueta" + " "+ str(Global.nivel_2))
						"PuzzleGato":
							Global.nivel_3 = true
						"PuzzleDinosaurio":
							Global.nivel_4 = true
					
					terminando_nivel = true
					
					$"../AnimalFinal".show()
					$"../Fichas".hide()
					self.hide()
					
					$Timer.start()
					$"../MarginGanar".show()
					


func _on_Timer_timeout():
	print(get_tree().current_scene.name)
	get_tree().change_scene("res://MenuInicio/MenuSeleccionNivel.tscn")
