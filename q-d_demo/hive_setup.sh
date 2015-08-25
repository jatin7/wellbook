#!/bin/bash
message 'Creating wells table'
hive -f ~/wellbook/ddl/wells.ddl
message 'Creating water_sites table'
hive -f ~/wellbook/ddl/water_sites.ddl
message 'Creating formations table'
hive -f ~/wellbook/ddl/formations.ddl
message 'Creationg formations_key table'
hive -f ~/wellbook/ddl/formations_key.ddl
message 'Creating log_metadata table'
hive -f ~/wellbook/ddl/log_metadata.ddl
message 'Creating log_readings table'
hive -f ~/wellbook/ddl/log_readings.ddl
message 'Creating production table'
hive -f ~/wellbook/ddl/production.ddl
message 'Creating injections table'
hive -f ~/wellbook/ddl/injections.ddl
message 'Creationg scout_tickets table'
hive -f ~/wellbook/ddl/scout_tickets.ddl
message 'Creating auctions table'
hive -f ~/wellbook/ddl/auctions.ddl
message 'Creating well_surveys table'
hive -f ~/wellbook/ddl/well_surveys.ddl
