---
title: "Revc Custom Build"
date: 2026-10-03T17:21:34-04:00
draft: false
toc: false
images:
tags:
  - projects
---

# KCNet ReVC

This will be a list of info for my custom modified build of ReVC.

Some of this blog post will be a little technical.

I will add screenshots to this later.

### Discord post about ReVC project

Posts from Projects page on Kelsoncraft discord

**9-5-2026**

#### 2:30PM

I have been working on migrating the reverse engineered GTA Vice City code ReVC to use lua scripts instead of the custom SCM language that is in use for the mission scripts https://gtamods.com/wiki/SCM_language

There is a tick function and setup for the player now with it, it will just be a free roam replacement for ReVC and if I can figure the rest out this should be a starting point for my new multiplayer system.
With this setup, the game doesn't load the original scripts at all so it'll make it a bit easier for me to distribute those loading my custom lua scripts.

 I don't think I've seen anyone try to replace the scripting system in Vice City yet, I may try to publish my game build somewhere once I get it a bit more stable, which will require the GTA Vice City assets, i wouldn't be sharing the files needed to launch the game.
This toggle-able addition will never be able to run the game missions or all the commands in the scripts since I don't need every one of them.

If I make a multiplayer for this, it will be like MTA SA but for Vice City.

I plan on adding more to this, and may implement some kind of new radio station that can stream from a server set in a file but that will be for another time.

#### 10:24PM
Here is an example of what this will load in place of the game scripts, the freeroam-game.lua script. 
I meant to send this on the projects channel earlier.

The reason I chose lua for this was that I already had it in place and just had to modify a couple of things to make this work.
And it can be easier to reload a new game then recompiling the scripts each time.

https://gist.github.com/kelson8/20303f1735ded404bb1b54241deeb314 


## New Info for ReVC project

I will be replicating a lot of the games scripts into my functions so I can call them in the lua code, such as requesting models, loading models, waiting and more of the common script commands.

This pretty much has to be reimplemented since my changes disable the `.scm` scripting system, and the save/load game features.

**Saving/loading**

I plan on making a json loader that can save/load specific stats to a json file.

Here is a list of things I will save, I won't be saving everything the game normally did

**List of contents in revc-freeroam-save.json**

<!-- <details>
<summary>
Example save file
</summary> -->

```json
{
    "version": "0.0.1a",
    "Player": {
        "Health": 150,
        "Armor": 200,
        "IsNeverWanted": "false"
    },
    "Stat": {
        "PeopleKilledByPlayer": 0,
        "PeopleKilledByOthers": 0,
        
        "BoatsExploded": 0,
        "TiresPopped": 0,
        "RoundsFiredByPlayer": 0,

        "PedsKilledOfThisType": 0,
        "HelisDestroyed": 0,

        "ProgressMade": 0.0,
        "TotalProgressInGame": "0.0",

        "KgsOfExplosivesUsed": 0,
        "BulletsThatHit": 0,
        "HeadsPopped": 0,

        "WantedStarsAttained": 0,
        "WantedStarsEvaded": 0,
        "TimesArrested": 0,
        "TimesDied": 0,
        "DaysPassed": 0,
        "SafeHouseVisits": 0,


        "MaximumJumpDistance": 0,
        "MaximumJumpHeight": 0,
        "MaximumJumpFlips": 0,
        "MaximumJumpSpins": 0,
        "BestStuntJump": 0,
        "NumberOfUniqueJumpsFound": 0,
        "TotalNumberOfUniqueJumps": 0,

        "NoMoreHurricanes": 0,

        "DistanceTravelledOnFoot": 0.0,
        "DistanceTravelledByCar": 0.0,
        "DistanceTravelledByBike": 0.0,
        "DistanceTravelledByBoat": 0.0,
        "DistanceTravelledByGolfCart": 0.0,
        "DistanceTravelledByHelicoptor": 0.0,
        "DistanceTravelledByPlane": 0.0,
    
        "FiresExtinguished": 0,

        "NumberKillFrenziesPassed": 0,
        "TotalNumberKillFrenzies": 0,
        "TotalNumberMissions": 0,
        "FlightTime": 0,

        "TimesDrowned": 0,
        "SeagullsKilled": 0,
        "WeaponBudget": 0.0,
        "FashionBudget": 0.0,

        "LongestWheelie": 0,
        "LongestStoppie": 0,
        "Longest2Wheel": 0,
        "LongestWheelieDist": 0.0,
        "LongestStoppieDist": 0.0,
        "Longest2WheelDist": 0.0,

        "KillsSinceLastCheckpoint": 0,
        "TotalLegitimateKills": 0,
        "LastMissionPassedName": 0,
        "CheatedCount": 0,

        "PedsKilled": 0,
        "CopsKilled": 0,
        "VehiclesBlownUp": 0
    }
}
```


<!-- </details> -->

This will need to be implemented first, but that will be about the structure that I use and the items that I will be saving/loading for the game.

This will pretty much be a brand new save system for no missions and saving stats like how many cars have been blown up, I may do something with this in the future.

I will be making a chaos mod or something built straight into the game, so if it's enabled in the `freeroam-game.lua` script, it will run things like randomly blow up the player, randomly blow up vehicles, change the weather and some other fun effects.

I will possibly add a `freeroam-chaos.lua` as am alternative lua file to run the chaos mod functions, so I can leave `freeroam-game.lua` alone.


## ImGui info

There is a mod menu you can use by pressing `F8` in game, it will open a ImGui mod menu.

I have a lot of functions in this, such as infinite health, never wanted, raise/lower wanted level and more.
This will need to have a list of what all I have working with it.

Credit to the [Cheat Menu](https://github.com/user-grinch/Cheat-Menu) from user-grinch, I got the custom font and menu design from there.

## Lua info

This is some info about lua for my ReVC project.

I will publish my internal `lua-documentation.md` guide later, it will have a list of information about my lua loading so anyone can modify the [freeroam-game.lua](https://gist.github.com/kelson8/20303f1735ded404bb1b54241deeb314) script and load it into my modified build of ReVC.

**DISABLE_GAME_SCRIPTS C++ preprocessor**

I have been working on getting a replacement setup for the Vice City `.scm` scripts, now my `freeroam-game.lua` script gets loaded if the `DISABLE_GAME_SCRIPTS` preprocessor is active.

This will eventually have a custom json save file format to read from and write to, so I can save the freeroam stats easily.

If `DISABLE_GAME_SCRIPTS` is enabled in `config.h`, the save/load menus are disabled and just show a blank page, I will have to figure out how to hide the menu name without breaking the rest of the games menu system.

Also, this disables saving/loading so this won't corrupt any working game saves since this disables it internally in the code.

##### Lua Tick and new game

I have an `OnTick` function in my custom lua scripts that runs every frame in the game.

You can press `F5` to start a new game


**Changelogs**

I just recently started doing these, so there isn't a full list just yet.

And I didn't normally change the verison numbers in the ReVC code when I updated a lot until recently.

<details>
<summary>
ReVC code changelog
</summary>

### KCNet ReVC changelog

I have just recently started this, so I'll only have new changes for the ReVC code in here.

The changlogs are located here on my ReVC lua scripts repo
* https://github.com/kelson8/KCNet-ReVC-Patches/blob/new-patches/Changelog.md
