= Liquid Cheer game engine, based on Flixel Community and Flixel Power Tools

== Development Setup
* Use IntelliJ if possible (I use 13 Ultimate), it's way better than FlashDevelop
* Install Flex SDK: http://www.adobe.com/devnet/flex/flex-sdk-download-all.html and set up in your IDE
* If starting a new game, fork this repo and tweak the following:
** Constants in /src/com/liquidenthusiasm/engine/Flixelgame.as
** Update registered class aliases in the Flixelgame constructor if you're using the SaveGameIndex for saving/loading
** /html-template/index.template.html if you want to change the page layout
* Add the .swc files from the project root as libraries to your project
* Run test/TestMain.as for unit/integration tests
* Run /src/com/liquidenthusiasm/engine/Flixelgame.as as the main entry point