FROM mcr.microsoft.com/mssql/server:2019-latest

USER root

COPY data.sql data.sql
COPY import-data.sh import-data.sh
COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

CMD /bin/bash ./entrypoint.sh



