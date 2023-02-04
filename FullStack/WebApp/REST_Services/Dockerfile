#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 8080
ENV ASPNETCORE_URLS=http://*:8080

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["REST_Services/REST_Services.csproj", "REST_Services/"]
COPY ["BusinessLogic/BusinessLogic.csproj", "BusinessLogic/"]
COPY ["ADataAccess/ADataAccess.csproj", "ADataAccess/"]
COPY ["DTO/DTO.csproj", "DTO/"]
COPY ["Utility/Utility.csproj", "Utility/"]
COPY ["IOC/IOC.csproj", "IOC/"]
RUN dotnet restore "REST_Services/REST_Services.csproj"
COPY . .
WORKDIR "/src/REST_Services"
RUN dotnet build "REST_Services.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "REST_Services.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "REST_Services.dll"]