FROM mcr.microsoft.com/mssql/server:2019-latest
USER root
COPY Script_DB_Inventory.sql Script_DB_Inventory.sql
COPY import-data.sh import-data.sh
COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
RUN sed -i -e 's/\r$//' entrypoint.sh
RUN sed -i -e 's/\r$//' import-data.sh
CMD /bin/bash ./entrypoint.sh
