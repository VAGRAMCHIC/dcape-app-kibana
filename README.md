# dcape-app-kibana
[KIBANA](https://www.elastic.co/kibana/kibana-dashboard) 8.14.3 application package for [dcape](https://github.com/dopos/dcape)
## Docker image used 
-  [kibana](https://hub.docker.com/layers/library/kibana/8.14.3/images/sha256-e70b87428e0d3ef43fb0743bc6cdf24d02611a643923c4ac4dfc6487d941e3b5)

## Requirements
- linux 64bit (git, make, sed)
- docker
- dcape v3
- Git service (github, gitea or gogs)

## Install
### Deploy with drone 
- Gitea: Fork or mirror this repo in your Git service
- Drone: Activate repo
- Gitea: "Test delivery", config sample will be saved to enfist
- Enfist: Edit config and remove .sample from name
- Gitea: "Test delivery" again (or Drone: "Restart") - app will be installed and started on webhook host
### Manual
```bash
git clone https://github.com/VAGRAMCHIC/dcape-app-kibana.git
cd dcape-app-kibana
make config
... <edit .env.sample>
make up
```
### Update
```bash
git pull
make config
... <check .env.sample >
make docker-build
make up
```
