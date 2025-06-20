# Starbound mod: Dynamic Status Effect Objects

This mod is an add-on to the [Status Effect Objects](README.md) mod, and requires that mod. It adds status effects to certain objects that can be switched off and on. When a dynamic object is switched off, its status effects cease to apply. When it is switched back on, the status effects being to apply once more.

Currently, the only status effect added is immunity to [deadly chill](https://starbounder.org/Deadly_Chill), implemented within varying ranges of heat-generating base game objects:
* egyptian lamps
* foundry lights
* medieval fireplaces
* sturdy torch stands

For a complete and up-to-date list, view the object patch files in the source code [here](https://github.com/rl-starbound/rl_statuseffectobjects/tree/main/rl_statuseffectobjects_dynamic/objects).

This mod only changes base game objects. Objects added by other mods will not be affected. Please see the [modder's guide](modders-guide.md) to learn how to apply these effects to other objects.

*Note that most of the gallery images have an area of effect superimposed over the image. This is for demonstration purposes only and is not included in the distributed mod for performance reasons.*

## Performance

This mod re-implements in Lua the core engine's algorithm for applying status effects via objects. The Lua code has equivalent complexity compared to the core engine's algorithm, so performance should be reasonable. That said, Lua is fundamentally slower than C++, so there will be a performance penalty. After extensive testing, I haven't noticed any significant performance loss, but I imagine that given some extreme arrangements of objects, lag could be possible. Therefore, I've packaged this mod separately from the base Status Effect Objects mod, so that it can be removed separately if it's found to cause performance issues.

## Compatibility

If there are other mods that add status effects to the same objects, they may clash. I am not aware of incompatibilities at this time.

## Uninstallation

This mod should be safe to install or uninstall as desired, subject to the caveat below. When it is installed, objects that have already been placed will gain status effects automatically. When it is uninstalled, objects that have already been placed will lose status effects automatically.

**When this mod is uninstalled, any characters that were experiencing status effects due to dynamic objects will find those status effects permanently attached to themselves. To avoid this, you should move all of your characters away from any dynamic status effect objects before quitting the game and removing this mod. If this has already affected your characters, it can be fixed easily by re-installing this mod, moving the characters to unaffected locations, and then quitting and uninstalling this mod once more.**

## Collaboration

If you have any questions, bug reports, or ideas for improvement, please contact me via [Chucklefish Forums](https://community.playstarbound.com/members/rl-starbound.885402/), [Github](https://github.com/rl-starbound), [Reddit](https://www.reddit.com/user/rl-starbound/), or Discord (rl.steam). Steam users may wish to subscribe to my [workshop profile](https://steamcommunity.com/profiles/76561198808510456/myworkshopfiles/) for updates on this and my other mods. Also please let me know if you plan to republish this mod elsewhere, so we can maintain open lines of communication to ensure timely updates.

## License

Permission to include this mod or parts thereof in derived works, to distribute copies of this mod verbatim, or to distribute modified copies of this mod, is granted unconditionally to Chucklefish LTD. Such permissions are also granted to other parties automatically, provided the following conditions are met:
* Credit is given to the author(s) specified in this mod's `_metadata` file;
* A link is provided to the [Chucklefish Forum page](TBD) or the [source repository](https://github.com/rl-starbound/rl_statuseffectobjects) in the accompanying files or documentation of any derived work;
* The names "Dynamic Status Effect Objects" and "rl\_statuseffectobjects\_dynamic" are not used as the metadata friendlyName and name, respectively, of any derived mod without explicit consent of the author(s); however, the name may be used in verbatim distribution of this mod. For the purposes of this clause, minimal changes to metadata files to allow distribution on Steam shall be considered a verbatim distribution so long as authorship attribution remains.
