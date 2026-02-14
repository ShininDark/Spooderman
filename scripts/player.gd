extends CharacterBody2D

var rope_active = false
var rope_anchor = Vector2.ZERO
var rope_length = 0

@onready var rope_line: Line2D = get_node("/root/Main/RopeLine")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if rope_active:
		var to_anchor = rope_anchor - global_position
		var distance = to_anchor.length()
		
		if distance > rope_length:
			var direction = to_anchor.normalized()
			global_position = rope_anchor - direction * rope_length

	if rope_active:
		rope_line.points = [global_position, rope_anchor]
	else:
		rope_line.points = []

	if Input.is_action_just_pressed("click"):
		var mouse_position = get_global_mouse_position()
		if not rope_active:
			attach_rope(mouse_position)
		else:
			rope_active = false
		
	move_and_slide()

func attach_rope(target_position: Vector2) -> void:
	var space = get_world_2d().direct_space_state #Access the 2d world
	var query = PhysicsRayQueryParameters2D.create(global_position, target_position) #creating a raw from player to mouse position
	query.exclude = [self] #to not hit player
	
	var result = space.intersect_ray(query)
	
	if result:
		rope_anchor = result.position
		rope_length = global_position.distance_to(rope_anchor)
		rope_active = true
