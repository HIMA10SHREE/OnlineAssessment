
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /source


COPY *.sln .
COPY dotnet-docker-clare/*.csproj ./dotnet-docker-clare/

COPY dotnet-docker-clare/. ./dotnet-docker-clare/
WORKDIR /source/dotnet-docker-clare
RUN dotnet publish -c release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build /app ./

CMD ASPNETCORE_URLS=http://*:$PORT dotnet dotnet-docker-clare.dll
# $PORT is set by Heroku - we don't use port 5000 like we normally would with ASP.Net


