
extends Node2D

var bullet = preload("res://rocket/rocket.xml")

var spread = 20
var power = 18

var cooldown = 3
var currentCooldown = cooldown
var root

func setRoot(r):
	root = r
	

func _input(ev):
	
	if ((ev.type == InputEvent.MOUSE_BUTTON) and (ev.button_index == 2) and ev.is_pressed() and (currentCooldown >= cooldown)):
		currentCooldown = 0

		for i in range(18):
			var bi = bullet.instance()
			var pos = ev.pos
			var element = get_parent().get_name()
			var vector = (ev.pos - get_parent().getCurrentPoint()).normalized()
			var randx = (randf() - 0.5) * 0.5
			var randy = (randf() - 0.5) * 0.5
			vector.x += randx
			vector.y += randy
			bi.set_pos(get_parent().get_pos() + (spread + 10) * vector + Vector2(spread * randf() - spread / 2.0, spread * randf() - spread / 2.0))
			
			get_parent().get_parent().add_child(bi)
			bi.set_direct(vector)
		
func _process(delta):
	if currentCooldown < cooldown:
		currentCooldown += delta
	root.update_shotgun(currentCooldown / cooldown)
	
func _ready():
	
	set_process_input(true)
	set_process(true)


