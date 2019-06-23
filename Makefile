release:
	bosh create-release --force
	bosh upload-release

deploy: release
	bosh deploy \
		--deployment=test \
		--vars-file=./test/vbox-vars.yml \
		--non-interactive \
		./deployment/manifest.yml

get-blobs:
	mkdir -p blobs
	curl -SL https://github.com/cirocosta/slirunner/releases/download/0.0.1/slirunner.tgz \
		-o blobs/slirunner.tgz
