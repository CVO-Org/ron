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
### Mods
CBA_A3

## Supported Mods
ACE3
### Supported DLCs
SOG:Prarie Fire

## Server Requirements
This mods needs to be loaded on both, the server and all clients.

## Planned Features
- Instead of all players needing to be near the Initiator, they only need to be near their squadleader.
- ~~Integration of Blacklisted Areas. Bascially means that, if the player is within a certain area (Position & Range), they will not be accounted for the proximity check. (For example, at spawn/base )~~ Implemented

## Maybe Features
- Predefined area's for RON Spots, meaning RON only possible at these locations



## Links
- [Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3438988923)
- [Github](https://github.com/CVO-Org/vn-ron)


## For Mission Makers And Zeus

### How to blacklist area's from the "are all players nearby" check
useful for homebase / respawn area or similar.

```sqf
missionNamespace setVariable [
    "ron_api_blacklist_playerDistance",
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
    "ron_api_interruption_overwrite",
    true, // boolean - true: force interruption - false: force no interuption
    true
];
```

### How to block the RON Action
```sqf
missionNamespace setVariable [
    "ron_api_block",
    true, // type or value does not matter
    true
];
```
```sqf
missionNamespace setVariable [
    "ron_api_block",
    nil, // nil'ing the var on every client will remove the block
    true
];
```
### Custom Mode: Target Time
Target time for the Custom RON Mode
```sqf
missionNamespace setVariable [
    "ron_api_custom_targetTime",
    6.5, // number - 0..24 - reference: https://community.bistudio.com/wiki/dayTime
    true
];

