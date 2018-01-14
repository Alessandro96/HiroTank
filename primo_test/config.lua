local aspectRatio = display.pixelHeight / display.pixelWidth
application = {
   content = {
      width = aspectRatio > 1.5 and 1080 or math.ceil( 1920 / aspectRatio ),
      height = aspectRatio < 1.5 and 1920 or math.ceil( 1080 * aspectRatio ),
      scale = "LetterBox",
      fps = 60,

      imageSuffix = {
         ["@2x"] = 1.8,
      },
   },
	LevelDirectorSettings = 
	{
		imagesSubFolder = "images",
		levelsSubFolder = "levels",
	}
	
}