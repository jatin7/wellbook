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
