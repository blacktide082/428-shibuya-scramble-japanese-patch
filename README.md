# Japanese Patch for 428 Shibuya Scramble

This is a bsdiff patch that will change the language of the Steam version of [428 Shibuya Scramble](https://store.steampowered.com/app/648580/428_Shibuya_Scramble/) from English to Japanese.

> Note: The `patch.exe` file is just the 32-bit `bspatch.exe` file from [this release](https://github.com/reitowo/bsdiff-win/releases/tag/v4.3) renamed to `patch.exe` so all the patch files stay together in the game's directory.

## Usage

1. Download the latest release from the [releases page](https://github.com/blacktide082/428-shibuya-scramble-japanese-patch/releases).
2. Extract the files into the game's directory at `<Steam Directory>/steamapps/common/428_shibuya_scramble_en`. You can easily open this folder by clicking the settings icon on the game's page in Steam and going to Manage > Browse local files.
3. Double click the `patch.bat` file to patch the game. This will back up the original file first so you can easily undo it.
4. (Optional) Delete the `patch.exe`, `patch.bsdiff`, and `patch.bat` files from your game's directory.
5. (Optional) Run the `Change Language to English.bat` script to change the game's language back to English. This script will rename itself back and forth between `Change Language to English.bat` and `Change Language to Japanese.bat` so you can easily tell which language you are switching to.
