#!/bin/bash

# Example how to do it locally
# curl -f -sS --data "access_token=SOME_TOKEN" "https://plugins.matomo.org/api/2.0/plugins/MultiChannelConversionAttribution/download/latest?matomo=4.12.2" > MultiChannelConversionAttribution.zip


# shellcheck source=/dev/null
source ./scripts/set_envs.sh

rm -rf "${TMP_DIR}"
mkdir "${TMP_DIR}"



# CustomOptOut
PLUGIN_LIST=(
    GroupPermissions
    InvalidateReports
    AdminNotification
    UserConsole
    QueuedTracking
    TrackerDomain
    GoogleAnalyticsImporter
    BotTracker
    DevelopmentToogle
    LogViewer
    VisitorGenerator
    ExtraTools
)


for i in "${PLUGIN_LIST[@]}";
do
    echo "Curl get $i"
    curl -f -sS https://plugins.matomo.org/api/2.0/plugins/"$i"/download/latest?matomo="$MATOMO_VERSION" > "${TMP_DIR}"/"$i".zip
    echo "Unzip $i"
    unzip -q "${TMP_DIR}/$i.zip" -d "${TMP_DIR}"
    rm -f "${TMP_DIR}/$i.zip"
    echo adding "$i"
    if [ "$MATOMO_GIT" == "true" ]; then
        echo "Exclude to be tracked from working repo"
        grep -qxF "$i" "${WORKSPACE}"/.git/info/exclude || echo "$i" >> "${WORKSPACE}"/.git/info/exclude
    fi
done

# echo "Chown to $SERVER_USER"
# sudo chown -R "$SERVER_USER":"$SERVER_USER" "${TMP_DIR}"

echo "Syncing to ${WORKSPACE}/matomo/plugins"
rsync -avz "${TMP_DIR}"/ "${WORKSPACE}"/matomo/plugins

# clean up
rm -rf "${TMP_DIR}"




