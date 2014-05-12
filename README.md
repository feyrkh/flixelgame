# Liquid Cheer game engine, based on Flixel Community and Flixel Power Tools

## Development Setup
* Use IntelliJ if possible (I use 13 Ultimate), it's way better than FlashDevelop
* Install Flex SDK: http://www.adobe.com/devnet/flex/flex-sdk-download-all.html and set up in your IDE
* If starting a new game, fork this repo and tweak the following:
** Constants in /src/com/liquidenthusiasm/engine/Flixelgame.as
** Update registered class aliases in the Flixelgame constructor if you're using the SaveGameIndex for saving/loading
** /html-template/index.template.html if you want to change the page layout
* Add the .swc files from the project root as libraries to your project
* In the IntelliJ Project structure, make sure you have a module named 'Release' under Settings/Modules/flixelgame
** General tab
*** Name: Release
*** Main class: com.liquidenthusiasm.engine.Flixelgame
*** Output file name: <whatever>.swf
*** Output folder: (create a folder for your build output)
*** Use HTML wrapper: checked
*** Folder with template: (browse for the html-template directory in your source)
** Dependencies tab
*** Flex/AIR SDK: Choose the SDK if it's already set up, otherwise click New and browse for the directory you unzipped your Flex SDK to earlier
*** Target player: 11.1 or higher
*** Component set: Spark only
*** Framework linkage: Merged into code
*** Make sure all of the .swc files are showing up in the box below Framework linkage. If not, press the + button at the bottom, choose 'New Library' and select all of the .swcs in the root directory.
** Compiler Options:
*** Generate debuggable SWF: Unchecked
*** Conditional compiler definitions
**** CONFIG::release=true
**** CONFIG::debug=false
* After creating the 'Release' module, copy it and name the new copy 'Debug'. Change the following settings:
** General tab
*** Name: Debug
*** Output file name: <whatever>_debug.swf
** Compiler options:
*** Conditional compiler definitions:
**** CONFIG::release=false
**** CONFIG::debug=true
* Run test/TestMain.as for unit/integration tests
** Choose the Debug module configuration configured earlier to get the following:
*** TheMiner toolbar shows up on startup, allowing you to debug and get performance stats from inside the game
*** Monster Debugger integration (just start Monster Debugger, then the game, and it should connect automatically if you enable it in TheMiner's config options)
*** Memory leak tracing - you have to set up what you want to trace in code, and then periodically do something like this:
```
CONFIG::debug 
{
  MemoryTracker.track(_requestedState, "Switching from "+_state+" to "+_requestedState);
  MemoryTracker.stage = FlxG.stage;
  MemoryTracker.gcAndCheck();
}
```
Whenever gcAndCheck() is called, it will force garbage collection and then print out (to the trace log)
any tracked objects that haven't been GCed yet along with whatever label you give them when they are added to tracking.
Don't call this every frame - a good place would be in stage changes, or on particular button presses.
** Choose the Release module configuration if you want that stuff excluded
* Run /src/com/liquidenthusiasm/engine/Flixelgame.as as the main entry point
