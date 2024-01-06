#!/bin/bash

# shellcheck source=/dev/null
source ./scripts/check-env.sh

set -e

cd matomo || exit


premium_plugins=(
    AbTesting
    ActivityLog
    AdvertisingConversionExport
    Cohorts
    CrashAnalytics
    CustomReports
    FormAnalytics
    Funnels
    HeatmapSessionRecording
    LoginSaml
    MultiChannelConversionAttribution
    MediaAnalytics
    RollUpReporting
    SearchEngineKeywordsPerformance
    SEOWebVitals
    UsersFlow
    LoginSaml
    WhiteLabel
)

echo "Activate Premium Plugins"
for PLUGIN in "${premium_plugins[@]}"; do
    echo "Activating ${PLUGIN}"
    docker compose exec matomo ./console plugin:activate "${PLUGIN}"
done
echo "Done activating Premium plugins"

