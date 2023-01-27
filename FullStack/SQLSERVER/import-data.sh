for i in {1..50};
do
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P Anro823500 -d master -i data.sql
    if [ $? -eq 0 ]
    then
        echo "data.sql completed"
        break
    else
        echo "not ready yet..."
        sleep 1
    fi
done