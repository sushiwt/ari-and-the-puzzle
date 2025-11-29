extends CanvasLayer

var location = "res://locations/bank/bank.tscn"
var progress_array = []
var status = ResourceLoader.load_threaded_get_status(location, progress_array)

func _ready() -> void:
	status = ResourceLoader.load_threaded_get_status(location, progress_array)
	
	if status == ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_file(location)
		return
	
	ResourceLoader.load_threaded_request(location, "")
		
	set_process(true)
	
func _process(_delta) -> void:
	status = ResourceLoader.load_threaded_get_status(location, progress_array)
	var progress = progress_array[0] if progress_array.size() > 0 else 0
	
	print(progress)
	
	if status == ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_file(location)
	else:
		$LoadingBar.size.x = progress * 320
