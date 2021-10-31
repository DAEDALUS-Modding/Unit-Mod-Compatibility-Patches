# DAEDALUS Compatibility Patches (ComPatches)

Unless using the Merge Mod feature of a mod like Community Mods, multiple unit-adding mods cannot be used together unless one of the following is true:
- One mod requires another to work (so the last-to-load mod is aware of the mod it requires)
- A compatibility patch is used to make the mods aware of each other

Such a compatibility patch should:
- Be a server mod
- Have a lower priority value (so it loads last)
- Include the union of the values in `unit_list.json` and `commander_list.json` files if relevant

The DAEDALUS ComPatches aim to accomplish this in a simple, consistent way.

## Current Mods Supported

The DAEDALUS ComPatches aim to support any combination of:
- [Legion](https://github.com/Legion-Expansion/Legion-Expansion)
- [Second Wave (2W)](https://github.com/Anonemous2/pa.mla.unit.addon)
- [Section 17 (S17)](https://github.com/DAEDALUS-Modding/Section-17)

## Usage

Any combination of mods requires a specific ComPatch, head over to the Releases section and look for the ComPatch which fits your desired setup.

## Installation Guide for new CMM

The new CMM is missing the ability to merge multiple unit mods, which means that these compatibility patches will continue to be relevant until this feature is re-added to CMM. Since many users of new CMM are not familiar with manual mod installations, here is a basic tutorial:
- Navigate to where your `server_mods` folder **should** be. For most Windows users, this is probably `C:/Users/[username]/AppData/Local/Uber Entertainment/Planetary Annihilation`
- If you do not see a folder called `server_mods` at this location, make a folder called `server_mods`.
- Extract any desired ComPatches into this folder. Make sure that each ComPatch has its own folder and that each of these folders has a file called `modinfo.json` in them. If `modinfo.json` is instead inside a folder nested within a folder in `server_mods`, this mod will not be identified. `modinfo.json` MUST BE at the top level of the mod's folder.
- Make sure that mod folders do not have any capital letters in their names. This broke old CMM. I haven't been able to test with new CMM yet, but it's likely to still break new CMM.
- The mod is installed now. Go to CMM and click on the "Installed" tab; look for the ComPatch in your list of installed mods. It should probably be "installed" but not "activated". Click on the mod and click the "Activate" button.
- Make sure to only have **ONE** ComPatch active at a time. Multiple active ComPatches may lead to undefined behavior.
- If you deactivate or activate a new unit-adding mod, make sure to deactivate the current ComPatch and activate a new one (if necessary).

## Potential Future Mod Support
- Bugs
- Union
- Assimilation
