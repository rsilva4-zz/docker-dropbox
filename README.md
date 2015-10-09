# docker-dropbox
A container for headless Dropbox

## How to use it
```
docker run --name my_dropbox_container -d rsilva4/dropbox
```
Check the logs for the url to link the container to your Dropbox account.
```
docker logs -f my_dropbox_container
```
After linking the log should stop repeating the url and display a message welcoming you. Files will start syncing. 

## Persisting the files

### With a host mounted volume
```
docker run --name my_dropbox -d -v /your/dir:/home/dropbox rsilva4/dropbox
```
### With a data-container only
```
docker create --name my_dropbox-data --entrypoint echo -d rsilva4/dropbox "Data-container only"
docker run --name my_dropbox -d --volumes-from my_dropbox-data rsilva4/dropbox
```

*Note:* The dropbox version is the available at the moment of the image build.
