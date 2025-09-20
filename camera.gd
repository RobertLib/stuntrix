extends Camera3D

@export var target: Node3D  # Car to follow
@export var distance := 8.0  # Distance behind the car
@export var height := 3.0  # Height above the car
@export var follow_speed := 10.0  # Follow speed
@export var look_ahead := 1.0  # How much to look ahead


func _ready():
	if not target:
		# If target is not set, find the car automatically
		target = get_node("../Car")


func _process(delta):
	if not target:
		return

	# Calculate target position behind the car
	var car_transform = target.global_transform
	var target_position = car_transform.origin

	# Camera position behind the car (in car's local coordinates)
	var offset = Vector3(0, height, distance)
	var camera_target = target_position + car_transform.basis * offset

	# Smooth position following
	global_position = global_position.lerp(camera_target, follow_speed * delta)

	# Look target (slightly ahead of the car)
	var look_target = target_position + car_transform.basis * Vector3(0, 0, -look_ahead)
	look_at(look_target, Vector3.UP)
