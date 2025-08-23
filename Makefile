## dcape-kibana-8.14.3-template Makefile
## This file extends Makefile.app from dcape
#:

SHELL               = /bin/bash
CFG                ?= .env
CFG_BAK            ?= $(CFG).bak

#- App name
APP_NAME           ?= kibana

#- Docker image name
IMAGE              ?= kibana

#- Docker image tag
IMAGE_VER          ?= 8.14.3

# If you need database, uncomment this var
#USE_DB              = yes

# If you need user name and password, uncomment this var
#ADD_USER            = yes



# ------------------------------------------------------------------------------

# if exists - load old values
-include $(CFG_BAK)
export

-include $(CFG)
export

# This content will be added to .env
define CONFIG_CUSTOM
ELASTICSEARCH_HOSTS=$(ELASTICSEARCH_HOSTS)
ELASTICSEARCH_USERNAME=$(ELASTICSEARCH_USERNAME)
ELASTICSEARCH_PASSWORD=$(ELASTICSEARCH_PASSWORD) 
endef

# ------------------------------------------------------------------------------
# Find and include DCAPE_ROOT/Makefile
DCAPE_COMPOSE   ?= dcape-compose
DCAPE_ROOT      ?= $(shell docker inspect -f "{{.Config.Labels.dcape_root}}" $(DCAPE_COMPOSE))

ifeq ($(shell test -e $(DCAPE_ROOT)/Makefile.app && echo -n yes),yes)
  include $(DCAPE_ROOT)/Makefile.app
else
  include /opt/dcape/Makefile.app
endif

# ------------------------------------------------------------------------------

## Template support code, used once
#use-template:

.default-deploy: docker-build
#.default-deploy: prep

#prep:
#	@echo "Just to show we able to attach"
