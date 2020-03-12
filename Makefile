PLUGIN_FILES = plugin.yaml LICENSE README.md Changelog.md cnr.ps1 cnr.sh


dist/quay-helmv3-plugin.tar.gz:
	mkdir -p dist/quay-helmv3-plugin
	cp $(PLUGIN_FILES) dist/quay-helmv3-plugin
	cd dist && tar czvf quay-helmv3-plugin.tar.gz quay-helmv3-plugin


all: dist/quay-helmv3-plugin.tar.gz


install: dist/quay-helmv3-plugin.tar.gz
	cp dist/quay-helmv3-plugin.tar.gz ~/.local/share/helm/plugins
	cd ~/.local/share/helm/plugins && tar xvf quay-helmv3-plugin.tar.gz

clean:
	rm -rf dist

.PHONY: clean

dev:
    mkdir ~/.local/share/helm/plugins/quay-helmv3-plugin
	cp $(PLUGIN_FILES) ~/.local/share/helm/plugins/quay-helmv3-plugin
