# TTS Extract - Quickly Customize Tabletop Simulator Mods
> WARNING: This is a WIP and not yet ready for consumption.

This package is a collection of Bash scripts attempting to make it fast and
easy to customize existing Tabletop Simulator mods by editing their usercontent
files locally and re-uploading them via Tabletop Simulator.

This tool only supports Tabletop Simulator mods with usercontent stored in
`steamusercontent` cloud hosts.

## The Workflow
### Extract Resources
First, extract the usercontent resources from the mod JSON file:

```
./extract.sh ~/.local/share/Tabletop Simulator/Mods/Workshop/2563720457.json
```

### Edit Content
Then, edit the resulting content files, which will be put in `./content`
relative to the current working directory.  Keep their filenames the same: the
filenames are named after the steamusercontent ID, which will then be used to
update the JSON with local file references.

It's also recommended to edit some attributes of the mod before uploading,
such as the mod's name to indicate what you're changing.  This can be done
by editing the JSON file or in Tabletop Simulator before uploading.

### Inject Local Content
Now we inject references to the local content into the mod JSON file:

```
./inject.sh ~/.local/share/Tabletop Simulator/Mods/Workshop/2563720457.json
```

This will update the mod JSON with references to the local files in place
of the `steamusercontent` URLs.

### Load and Upload
Now, just load the mod in singleplayer in Tabletop Simualtor, then use the
"Upload All Loaded Files" feature in the "Cloud Manager" in the game, which will
upload all of the modified content and replace the local file references with
`steamusercontent` URLs.  Now your modded mod is ready!
