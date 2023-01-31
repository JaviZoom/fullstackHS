for i in {1..50};
do
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P DEMODataBase15845! -d master -i Script_DB_Inventory.sql
    if [ $? -eq 0 ]
    then
        echo "Script_DB_Inventory.sql completed"
        break
    else
        echo ""
        sleep 1
    fi
done