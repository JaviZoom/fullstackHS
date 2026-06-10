#!/bin/bash

for i in {1..60}
do
    /opt/mssql-tools18/bin/sqlcmd \
        -S localhost \
        -U sa \
        -P 'DEMODataBase15845!' \
        -C \
        -Q "SELECT 1"

    if [ $? -eq 0 ]
    then
        echo "SQL Server is ready"

        /opt/mssql-tools18/bin/sqlcmd \
            -S localhost \
            -U sa \
            -P 'DEMODataBase15845!' \
            -C \
            -d master \
            -i Script_DB_Inventory.sql

        echo "Database imported"
        break
    fi

    echo "Waiting for SQL Server..."
    sleep 2
done
