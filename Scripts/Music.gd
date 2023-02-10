extends Node2D

var bg_music = load("res://SW/The lair under the cliffs.wav")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var state = 0 #SW, value to tracking whether player is attack now
var isWeapon = 0 #SW, checking whether have picked up a weapon
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


	
func play_music():
	$Music.stream = bg_music
	$Music.play()
