# Starbound mod: Status Effect Objects

This mods adds status effects to some base game objects, so that the player is affected by those effects when within a specified range of the objects. This is implemented efficiently, with virtually no impact on game performance, using undocumented and unused features of the Starbound core engine.

Currently, the only status effect added is immunity to [deadly chill](https://starbounder.org/Deadly_Chill), implemented within varying ranges of heat-generating base game objects:
* foundry beds
* foundry lava tanks and ladles
* steamspring boilers
* volcanic geysers
* campfires (including the floran stove and nanostove)
* open-fire ovens
* crafting furnaces (including the glitch and novakid furnaces)
* radiators and space heaters
* fire barrels
* encounter booster flames

For a complete and up-to-date list, view the object patch files in the source code [here](https://github.com/rl-starbound/rl_statuseffectobjects/tree/main/rl_statuseffectobjects/objects).

This mod only changes base game objects. Objects added by other mods will not be affected. Please see the [modder's guide](modders-guide.md) to learn how to apply these effects to other objects.

A common trait among the objects given status effects by this mod is that they are always-on, in other words, none are objects that can be switched off. This is due to a limitation of the core engine, which assumes that object status effects are always on as long as the object exists in the world. If you are looking for status effects for objects that can be switched off, you will want to try the add-on [Dynamic Status Effect Objects](README_dynamic.md), which is provided as a separate mod.

*Note that most of the gallery images have an area of effect superimposed over the image. This is for demonstration purposes only and is not included in the distributed mod for performance reasons.*

## Performance

After extensive testing, I haven't noticed any performance loss due to this mod. From peeking at the core engine's leaked source code, this seems to be because the core engine was already running the code for adding status effects via objects, despite the fact that no objects in the base game actually provided status effects. So in other words, we've been paying the price for this feature for years, and now with this mod we actually get something for it.

## Compatibility

If there are other mods that add status effects to the same objects, they may clash. I am not aware of incompatibilities at this time.

## Uninstallation

This mod should be safe to install or uninstall as desired. When it is installed, objects that have already been placed will gain status effects automatically. When it is uninstalled, objects that have already been placed will lose status effects automatically.

## Collaboration

If you have any questions, bug reports, or ideas for improvement, please contact me via [Chucklefish Forums](https://community.playstarbound.com/members/rl-starbound.885402/), [Github](https://github.com/rl-starbound), [Reddit](https://www.reddit.com/user/rl-starbound/), or Discord (rl.steam). Steam users may wish to subscribe to my [workshop profile](https://steamcommunity.com/profiles/76561198808510456/myworkshopfiles/) for updates on this and my other mods. Also please let me know if you plan to republish this mod elsewhere, so we can maintain open lines of communication to ensure timely updates.

## License

Permission to include this mod or parts thereof in derived works, to distribute copies of this mod verbatim, or to distribute modified copies of this mod, is granted unconditionally to Chucklefish LTD. Such permissions are also granted to other parties automatically, provided the following conditions are met:
* Credit is given to the author(s) specified in this mod's `_metadata` file;
* A link is provided to the [Chucklefish Forum page](TBD) or the [source repository](https://github.com/rl-starbound/rl_statuseffectobjects) in the accompanying files or documentation of any derived work;
* The names "Status Effect Objects" and "rl\_statuseffectobjects" are not used as the metadata friendlyName and name, respectively, of any derived mod without explicit consent of the author(s); however, the name may be used in verbatim distribution of this mod. For the purposes of this clause, minimal changes to metadata files to allow distribution on Steam shall be considered a verbatim distribution so long as authorship attribution remains.
