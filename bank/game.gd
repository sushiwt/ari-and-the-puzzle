class_name Location extends Node2D

var puzzle = preload("res://basegame/puzzle.tscn")
var camera_enemy = preload("res://enemies/camera/camera_enemy.tscn")
var game_over_scene = preload("res://basegame/game_over_transition.tscn")
var table_layout = false

func _ready() -> void:
	#GameState.puzzle_requirement = 4
	#GameState.room = 0
	#GameState.score = 0
	
	start_game()

func _process(delta:float) -> void:
	if GameState.game_over:
		process_mode = Node.PROCESS_MODE_DISABLED
		
		var game_over_instance = game_over_scene.instantiate()
		
		# Adding it to the sibling instead of the child
		# ensures that the sound will play.
		add_sibling(game_over_instance)
	
	if $Player.position.y <= 0:
		var random_location = randi_range(0,100)
		print(random_location)
		
		if random_location <= 50:
			get_tree().change_scene_to_file("res://greybee/greybee_room.tscn")
		else:
			start_game()

func start_game():
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
	
	for i in range(GameState.room):
		var camera_enemy_instance = camera_enemy.instantiate()
		random_placement.x = randi_range(32, 288)
		random_placement.y = randi_range(48, 208)
		
		camera_enemy_instance.position = random_placement
		camera_enemy_instance.direction = randi_range(-180,180)
		add_child(camera_enemy_instance)
		
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
		
		
