BOSH_DEPLOY_FLAGS ?=
RELEASE           ?= ./release.tgz
VERSION            = $(shell cat ./VERSION)


release:
	bosh create-release \
		--tarball $(RELEASE) \
		--force
	bosh upload-release $(TARBALL)


final-release:
	bosh create-release \
		--final \
		--force \
		--name slirunner \
		--tarball $(RELEASE) \
		--version $(VERSION)
	bosh upload-release $(TARBALL)


deploy: release
	bosh deploy \
		--deployment=test \
		--vars-file=./test/vbox-vars.yml \
		--non-interactive \
		./deployment/manifest.yml $(BOSH_DEPLOY_FLAGS)


get-slirunner:
	curl -SL https://github.com/cirocosta/slirunner/releases/download/v0.1.0/slirunner.tgz \
		-o src/slirunner.tgz
