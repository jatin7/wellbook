#!/bin/bash
echo 'Creating wells table'
hive -f ~/wellbook/q-d_demo/ddl/wells.ddl
echo 'Creating water_sites table'
hive -f ~/wellbook/q-d_demo/ddl/water_sites.ddl
echo 'Creating formations table'
hive -f ~/wellbook/q-d_demo/ddl/formations.ddl
echo 'Creationg formations_key table'
hive -f ~/wellbook/q-d_demo/ddl/formations_key.ddl
echo 'Creating log_metadata table'
hive -f ~/wellbook/q-d_demo/ddl/log_metadata.ddl
echo 'Creating log_readings table'
hive -f ~/wellbook/q-d_demo/ddl/log_readings.ddl
echo 'Creating production table'
hive -f ~/wellbook/q-d_demo/ddl/production.ddl
echo 'Creating injections table'
hive -f ~/wellbook/q-d_demo/ddl/injections.ddl
echo 'Creationg scout_tickets table'
hive -f ~/wellbook/q-d_demo/ddl/scout_tickets.ddl
echo 'Creating auctions table'
hive -f ~/wellbook/q-d_demo/ddl/auctions.ddl
echo 'Creating well_surveys table'
hive -f ~/wellbook/q-d_demo/ddl/well_surveys.ddl
