extends VehicleBody3D

@export var engine_force_value := 1000.0
@export var brake_force_value := 50.0
@export var steer_angle := 0.5


func _physics_process(_delta):
	var throttle = 0.0
	var steer = 0.0

	# Keyboard control
	if Input.is_action_pressed("ui_up"):
		throttle = -engine_force_value
	elif Input.is_action_pressed("ui_down"):
		throttle = engine_force_value * 0.5  # reverse/brake

	if Input.is_action_pressed("ui_left"):
		steer = steer_angle
	elif Input.is_action_pressed("ui_right"):
		steer = -steer_angle

	engine_force = throttle
	steering = steer

	# Brake (spacebar)
	if Input.is_action_pressed("ui_select"):
		brake = brake_force_value
	else:
		brake = 0.0
