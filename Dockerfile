FROM mcr.microsoft.com/dotnet/sdk:5.0

RUN apt-get update -yq 
RUN apt-get install curl gnupg -yq 
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

WORKDIR /app/
COPY . . 

RUN dotnet build
WORKDIR /app/DotnetTemplate.Web/
RUN npm install
RUN npm run build
ENTRYPOINT dotnet run