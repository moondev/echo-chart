build:
	helm template . --dry-run | yq r - -PC