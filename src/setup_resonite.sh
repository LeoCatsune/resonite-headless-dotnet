#!/bin/sh

bash "${STEAMCMDDIR}/steamcmd.sh" \
	+force_install_dir ${STEAMAPPDIR} \
	+login ${STEAMLOGIN} \
	+app_license_request ${STEAMAPPID} \
	+app_update ${STEAMAPPID} -beta ${STEAMBETA} -betapassword ${STEAMBETAPASSWORD} validate \
	+quit
find ${STEAMAPPDIR}/Headless/net8.0/Data/Assets -type f -atime +7 -delete
find ${STEAMAPPDIR}/Headless/net8.0/Data/Cache -type f -atime +7 -delete
find /Logs -type f -name *.log -atime +30 -delete
mkdir -p Headless/Migrations

# RML & 0Harmony
mkdir -p ${STEAMAPPDIR}/Libraries
mkdir -p ${STEAMAPPDIR}/rml_libs
mkdir -p ${STEAMAPPDIR}/rml_mods
curl -sSL -o ${STEAMAPPDIR}/Libraries/ResoniteModLoader.dll https://github.com/resonite-modding-group/ResoniteModLoader/releases/latest/download/ResoniteModLoader.dll
curl -sSL -o ${STEAMAPPDIR}/rml_libs/0Harmony.dll https://github.com/resonite-modding-group/ResoniteModLoader/releases/latest/download/0Harmony.dll
# ----------

exec $*
