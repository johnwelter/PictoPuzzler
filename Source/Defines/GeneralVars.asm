temp1  			.rs 1
temp2  			.rs 1
temp3  			.rs 1
temp4  			.rs 1
temp5			.rs 1
temp6			.rs 1
temp7			.rs 1
temp8			.rs 1
temp9			.rs 1
temp10			.rs 1
tempx 			.rs 1
tempy 			.rs 1
time 			.rs 1
scaledTime		.rs 1
sleeping 		.rs 1
mode_loadFlags  .rs 1
;;trcb n.ss
;;t = skip table read, use blank tile
MODELOAD_DRAWBLANK = %10000000
;;r = read from save copy 
MODELOAD_READSAVE = %01000000
;;c = write to save copy
MODELOAD_WRITESAVE = %00100000
MODELOAD_NOTWRITESAVE = %11011111
;;b = write black to palettes
MODELOAD_BLACKPAL = %00010000
;;n = skip rendering re-activation on mode load
MODELOAD_NORENDER = %00001000
;;ss = puzzle size
MODELOAD_PUZZLESIZE = %00000011

game_mode  		.rs 1
mode_state		.rs 1
NMI_locks 		.rs 1
game_locks 		.rs 1
pointer_address .rs 2
pointerB_address .rs 2
table_address  	.rs 2
objectTable_address .rs 2
jump_address  	.rs 2
temp_addAddress .rs 2
pointer_addOffset	.rs 2
ppu_startAddress .rs 2

;game modes
TITLE_IDX = $00
GAME_IDX = $01
GAMEOVER_IDX = $02
CREDITS_IDX = $03

;locks for input and rendering
BGLOAD_NMI_LOCK = %00000001
EFFECT_GAME_LOCK = %00000001



