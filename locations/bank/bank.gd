class_name Location extends Node2D

var puzzle = preload("res://basegame/puzzle.tscn")
var camera_enemy = preload("res://enemies/camera/camera_enemy.tscn")
var game_over_scene = preload("res://gameover/game_over_transition.tscn")
var you_cant_go_back = preload("res://locations/bank/you_cant_go_back.tscn")
var table_layout = false

var ycgb_toggle = false

func _ready() -> void:
	#GameState.puzzle_requirement = 4
	#GameState.room = 0
	#GameState.score = 0
	
	reset_room()

func _process(_delta:float) -> void:
	if GameState.game_over:
		process_mode = Node.PROCESS_MODE_DISABLED
		
		var game_over_instance = game_over_scene.instantiate()
		
		# Adding it to the sibling instead of the child
		# ensures that the sound will play.
		add_sibling(game_over_instance)
	
	
	# Finished Room Code
	if $Player.position.y <= 0:
		var random_location = randi_range(0,100)
		print(random_location)
		
		if random_location <= 5 && GameState.room >= 5 && GameState.the_boolean_that_checks_if_youve_entered_the_greybuzgian_room == false:
			GameState.the_boolean_that_checks_if_youve_entered_the_greybuzgian_room = true
			get_tree().change_scene_to_file("res://locations/greybee/greybee_room.tscn")
		else:
			reset_room()
	
	# Behind Room Code
	if $Player.position.y >= 240:
		if GameState.room == 8:
			get_tree().change_scene_to_file("res://locations/campfire/campfire.tscn")
		elif ycgb_toggle == false:
			var ycgb_instance = you_cant_go_back.instantiate()
			add_child(ycgb_instance)
			ycgb_toggle = true
	else:
		ycgb_toggle = false
	

func reset_room():
	GameState.room += 1
	GameState.room_timer = 0
	GameState.puzzles_collected = 0
	
	$Player.position = Vector2(160,216)
	$Door.position = Vector2(128,0)
	$EnvironmentLight.light_timer = 1
	
	var enemies = get_tree().get_nodes_in_group("Enemy")
	var random_placement = Vector2.ZERO
	
	# Deletes every single enemy to make room
	# for new ones
	for node in enemies:
		node.queue_free()
	
	# Place the camera enemies in a random position based on
	# the room counter
	for i in range(GameState.room):
		var camera_enemy_instance = camera_enemy.instantiate()
		random_placement.x = randi_range(32, 288)
		random_placement.y = randi_range(48, 208)
		
		camera_enemy_instance.position = random_placement
		camera_enemy_instance.direction = randi_range(-180,180)
		add_child(camera_enemy_instance)
	
	# Place the puzzle pieces based on the puzzle_requirement variable
	# This implies that there will be more or less than 4 puzzles for 1
	# room, but it isn't done for now.
	for i in range(GameState.puzzle_requirement):
		var puzzle_instance = puzzle.instantiate()
		random_placement.x = randi_range(52, 268)
		random_placement.y = randi_range(68, 176)
		
		puzzle_instance.position = random_placement
		puzzle_instance.puzzle_frame = i
		add_child(puzzle_instance)
	
	# For Changing the Table Layouts. this is TEMPORARY.
	table_layout = !table_layout
	if table_layout:
		$TableLayout.position.x -= 320
	else:
		$TableLayout.position.x += 320
		
		
