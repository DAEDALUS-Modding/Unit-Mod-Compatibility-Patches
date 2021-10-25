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

## Potential Future Mod Support
- Bugs
- Union
- Assimilation
