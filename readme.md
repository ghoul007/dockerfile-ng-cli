## Dockerfile for Angular CLI


to display all versions for angular/cli
```
npm show @angular/cli versions
```

first, you need build the dockerfile, for example
```
sudo docker build --build-arg  VERSION=9.1.7  -t ghoul/ng-cli:9.1.7 .
```

to create new Angular application
```
docker run -u $(id -u) -v $(pwd):/app  ghoul/ng-cli:9.1.7 ng new app
```