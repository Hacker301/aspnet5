FROM microsoft/aspnet:1.0.0-beta4
ADD . /app
WORKDIR /app
RUN yes | certmgr -ssl -m https://go.microsoft.com \
    yes | certmgr -ssl -m https://nugetgallery.blob.core.windows.net \
    yes | certmgr -ssl -m https://nuget.org \
    yes | certmgr -ssl -m https://www.myget.org/F/aspnetvnext/
RUN ["dnu", "restore"]
EXPOSE 80
ENTRYPOINT dnx /app kestrel -D
