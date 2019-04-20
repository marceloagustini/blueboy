extends CanvasLayer
export (bool) var IS_VISIBLE = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$btnLeft.visible = IS_VISIBLE
	$btnLeft2.visible = IS_VISIBLE
	$btnJump.visible = IS_VISIBLE
	$btnShot.visible = IS_VISIBLE