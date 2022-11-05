extends Node2D

var nodos_areas : Array
var figuras_por_resolver : Dictionary
var figuras_resueltas : Dictionary

var pos_correcta : bool = false
var nodo_actual

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
	if event is InputEventMouseButton:
		if event.button_index == 1 :
			if !event.pressed and pos_correcta:
				figuras_por_resolver[nodo_actual] = true
			
				if figuras_por_resolver.hash() == figuras_resueltas.hash():
					print("Fin Nivel")

