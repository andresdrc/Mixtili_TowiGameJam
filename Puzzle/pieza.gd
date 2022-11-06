extends Sprite


var mouse_en_area : bool = false
var presionado : bool = false
var pos_mouse : Vector2 = Vector2.ZERO

var pos_ini_pieza : Vector2 = Vector2.ZERO

var en_pos_correcta : bool = false
var pos_correcta : Vector2 = Vector2.ZERO




func _ready():
	
	pos_ini_pieza = self.global_transform.origin
	
	$Area2D.connect("mouse_entered",self, "_on_Area2D_mouse_entered")
	$Area2D.connect("mouse_exited",self, "_on_Area2D_mouse_exited")
	$Area2D.connect("area_entered",self, "_on_Area2D_entered")
	$Area2D.connect("area_exited",self, "_on_Area2D_exited")


func _on_Area2D_mouse_entered():
	mouse_en_area = true

func _on_Area2D_mouse_exited():
	if !presionado:
		mouse_en_area = false


func _on_Area2D_entered(area):
	if area.get_name() == self.name:
#		print("mismo nombre")
		en_pos_correcta = true
		pos_correcta = area.global_transform.origin
	
func _on_Area2D_exited(area):
	if area.get_name() == self.name:
#		print("sali del lugar")
		en_pos_correcta = false


func _unhandled_input(event):
	if event is InputEventMouseButton and mouse_en_area:
		if event.button_index == 1:
			if event.is_pressed():
#				print("presionado")
				presionado = true
			if !event.is_pressed():
#				print("Soltado")
				presionado = false


func _process(delta):
	if mouse_en_area and presionado:
		self.global_position = get_viewport().get_mouse_position()
	if !presionado :
		if en_pos_correcta:
			self.global_position = pos_correcta
		else:
			self.global_position = pos_ini_pieza



