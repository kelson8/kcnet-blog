---
title: "Minecraft Gamemode Tutorials"
date: 2025-10-04T15:13:10-04:00
draft: true
toc: false
images:
tags:
  - minecraft
---

Here I will be putting guides on adventure mode and other gamemodes

## Adventure Mode
https://www.reddit.com/r/MinecraftCommands/comments/1d5r57n/does_anyone_know_how_to_get_a_block_to_be_placed/

To get a block to be placed on an item in adventure mode:

    /give @p lever[minecraft:can_place_on={predicates:[{blocks:"sandstone"}]}] 1

To give an item that can break certain blocks in adventure mode:
How To Destroy Blocks with Can Break Component
Youtube guide on this

    /give @p minecraft:iron_pickaxe[can_break={blocks: "minecraft:sandstone"}]

## Giving super tools

Give a sword that can never break
/give @p netherite_sword[enchantments={"minecraft:sharpness":5,"minecraft:mending":1,"minecraft:unbreaking":3},unbreakable={}] 1

Give a super sword (This only goes up to 255 for enchants)
/give @p minecraft:diamond_sword[enchantments={"minecraft:sharpness": 100}] 1