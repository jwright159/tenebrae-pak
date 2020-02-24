# Tenebrae Engine sample mappacks
Repo for mappacks for [the Tenebrae RPG Engine](https://github.com/jwright159/tenebrae).

## Mappacks
- pak: generic RPG functionality
- lo2: advanced entity functionality

## Installation
### Android
Mappacks should be cloned into `/sdcard/WrightWay/Tenebrae/(mappack name)`

### Everything else
Lol not yet

## Debug Verbosity
`/sdcard/WrightWay/Tenebrae/v` should be a text file with seven 1s or 0s depending on verbosity in this order:
- `GMPLY`: gameplay such as entities or triggers
- `AUDIO`: music and midi files
- `GRAPH`: graphics and textures
- `USINT`: UI mapping
- `DEBUG`: important debug info
- `USERS`: in-game scripting via `println(...)`
- `ERROR`: errors

For example, a common setting would be `0000111`.
