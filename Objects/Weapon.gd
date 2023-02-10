extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if "Player" in body.name:	
		emit_signal("pickUp")	
		$Collect.play()
		Music.isWeapon = 1 #SW tracking whether picked up a weapon 
		yield(get_tree().create_timer(0.1),"timeout")
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
