;this is our pointer table.  Each entry is a pointer to a song header                
song_headers:
	
    .word song0_header
	.word $A0D8 ;;bank song
	.word Title_header
    .word drawImg_header  
	.word endScreen_header
	.word menuCursor_header
	.word puzzleCursor_header
	.word noiseBlip_header
		
    .include "Source/Content/Sound/Music/silence.i"  ;holds the data for song 0 (header and data streams)
	.include "Source/Content/Sound/Music/Title.asm"  ;holds the data for song 1
    .include "Source/Content/Sound/SFX/puzzleSolvedDrawImage.i"  ;holds the data for song 1
	.include "Source/Content/Sound/Music/EndScreen.i"
	.include "Source/Content/Sound/SFX/menuCursor.i"  ;holds the data for song 1
	.include "Source/Content/Sound/SFX/puzzleCursor.i"  ;holds the data for song 1
	.include "Source/Content/Sound/SFX/noiseBlip.i" 