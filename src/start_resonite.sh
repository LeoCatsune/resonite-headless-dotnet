#!/bin/sh

exec dotnet ${STEAMAPPDIR}/Headless/net8.0/Resonite.dll -HeadlessConfig Config/Config.json -l /Logs $(if $ENABLE_MODLOADER; then echo "-LoadAssembly "./Libraries/ResoniteModLoader.dll""; fi)
