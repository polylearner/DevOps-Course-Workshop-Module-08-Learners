FROM mcr.microsoft.com/dotnet/sdk:5.0

RUN apt-get update -yq 
RUN apt-get install curl gnupg -yq 
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

WORKDIR /app/
COPY . . 

WORKDIR /app/DotnetTemplate.Web/
RUN dotnet build
RUN npm install
RUN npm rebuild node-sass
RUN npm run build
RUN npm t

ENTRYPOINT ["dotnet", "run"]