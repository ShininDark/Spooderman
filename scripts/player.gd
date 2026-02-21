extends CharacterBody2D

var rope_active = false
var rope_anchor = Vector2.ZERO
var rope_length = 0

# for better gravity
var gravity_scale = 0.3
const MAX_VELOCITY = 500

@onready var rope_line: Line2D = get_node("/root/Main/RopeLine")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * gravity_scale
		velocity.y = min(velocity.y, MAX_VELOCITY)

	if rope_active:
		var to_anchor = rope_anchor - global_position
		var distance = to_anchor.length()
		var current_swing_direction = velocity.normalized()
		var swing_boost = 50
		
		velocity += current_swing_direction * swing_boost * delta
		
		if distance > rope_length:
			var direction = to_anchor.normalized()
			global_position = rope_anchor - direction * rope_length
			
			var dot = velocity.dot(direction)
			if dot < 0:
				velocity -= direction * dot

	if rope_active:
		rope_line.points = [global_position, rope_anchor]
		$AnimatedSprite2D.play("swing")
	else:
		rope_line.points = []
		$AnimatedSprite2D.play("idle")

	if Input.is_action_just_pressed("click"):
		var mouse_position = get_global_mouse_position()
		if not rope_active:
			attach_rope(mouse_position)
		else:
			rope_active = false
		
	move_and_slide()

func attach_rope(target_position: Vector2) -> void:
	var space = get_world_2d().direct_space_state #Access the 2d world
	var query = PhysicsRayQueryParameters2D.create(global_position, target_position) #creating a ray from player to mouse position
	query.collision_mask = 2 # only hits buildings
	query.exclude = [self] #to not hit player
	
	var result = space.intersect_ray(query)
	
	if result:
		rope_anchor = result.position
		rope_length = global_position.distance_to(rope_anchor)
		rope_active = true
