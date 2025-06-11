# RemainOverNight System

[![Steam Subscriptions](https://img.shields.io/steam/subscriptions/3438988923?style=for-the-badge&logo=steam&label=Steam%20Workshop&color=%23690000)](https://steamcommunity.com/sharedfiles/filedetails/?id=3438988923)

This mod provides the players with a system that allows them to initialises a Remain Over Night Time Skip themselves, no Zeus shenanigans needed.

It also supports "Interruptions", meaning the players RON attempt could be interrupted by an enemy patrol strolling by.

Its highly inspired by the RON scenes expierenced during the SOG:PF Campaign Missions.

Several Conditions are being checked when attempting to RON
**Inital Checks**
- Initiator needs to be Squadlead
- It needs to be night time between sunset and sunrise.
**Further Checks**
- All players need to be within a certain range to the Initiator
- Outside of Minimum Distance to nearby Enemies
- Outside of Minimum Distance to nearby Villages
- No player has been under fire (suppressed) for a certain amount of time


## Dependencies
### DLC
SOG:Prarie Fire
### Mods
CBA_A3

## Supported Mods
ACE3

## Server Requirements
This mods needs to be loaded on both, the server and all clients.

## Planned Features
- Instead of all players needing to be near the Initiator, they only need to be near their squadleader.
~~- Integration of Blacklisted Areas. Bascially means that, if the player is within a certain area (Position & Range), they will not be accounted for the proximity check. (For example, at spawn/base )~~ Implemented

## Maybe Features
- Predefined area's for RON Spots, meaning RON only possible at these locations



## Links
- [Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3438988923)
- [Github](https://github.com/OverlordZorn/vn-ron)


## For Mission Makers And Zeus

### How to blacklist area's from the "are all players nearby" check
useful for homebase / respawn area or similar.

```sqf
missionNamespace setVariable [
    "nv_ron_blacklist_playerDistance",
    createHashMapFromArray [
        // [markerName as String, radius of blacklist]
        ["ourHomebaseMarkerName", 500],
        ["ourRespawnAreaMarkerName", 1000]
    ],
    true
];
```

### How to overwrite the Interruption Chance Check:
```sqf
missionNamespace setVariable [
    "ron_interruption_overwrite",
    true, // boolean: True will always trigger an interruption, false will always cause RON to pass without interruption
    true
];
