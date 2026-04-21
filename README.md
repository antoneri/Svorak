# Svorak

macOS-tangentbordslayouten Svorak A1 (Dvorak anpassad for svenska).

## Struktur

```
src/
  Info.plist                          Bundle-metadata
  Resources/
    SvorakA1.keylayout                Layoutdefinitionen
    SvorakA1.icns                     Ikon
    English.lproj/InfoPlist.strings   Lokalisering
build.sh                              Bygger Svorak.pkg via pkgbuild
```

## Bygga

```
./build.sh
```

Resultat: `build/Svorak.pkg`.

## Installera

```
open build/Svorak.pkg
```

Eller utan GUI:

```
sudo installer -pkg build/Svorak.pkg -target /
```

Sedan: System Settings > Keyboard > Text Input > Input Sources > Edit > `+` och lagg till "Svorak A1".

## Avinstallera

```
sudo rm -rf "/Library/Keyboard Layouts/Svorak.bundle"
```

Och ta bort layouten fran Input Sources.
