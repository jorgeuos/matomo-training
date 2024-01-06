#!/bin/bash


mysqldump -u matomo -p"TgUWMjfTn1WOl7s" --no-create-info --where="idsite=2" matomo_mc matomo_log_visit > ./matomo/tables/matomo_log_visit.sql
mysqldump -u matomo -p"TgUWMjfTn1WOl7s" --no-create-info --where="idsite=2" matomo_mc matomo_log_link_visit_action > ./matomo/tables/matomo_log_link_visit_action.sql
mysqldump -u matomo -p"TgUWMjfTn1WOl7s" --no-create-info matomo_mc matomo_log_action > ./matomo/tables/matomo_log_action.sql
mysqldump -u matomo -p"TgUWMjfTn1WOl7s" --no-create-info --where="idsite=2" matomo_mc matomo_log_conversion > ./matomo/tables/matomo_log_conversion.sql
mysqldump -u matomo -p"TgUWMjfTn1WOl7s" --no-create-info --where="idsite=2" matomo_mc matomo_log_conversion_item > ./matomo/tables/matomo_log_conversion_item.sql




