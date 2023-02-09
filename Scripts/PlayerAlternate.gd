extends KinematicBody2D

onready var anim = $AnimationPlayer

func _ready():
	anim.play("Idle")

var speed = 200
var velocity = Vector2()

func _physics_process(delta):
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	
	move_and_slide(velocity)
	look_at(get_global_mouse_position())
