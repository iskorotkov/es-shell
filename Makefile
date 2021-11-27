.PHONY: build watch

watch:
	flutter pub run build_runner watch

build:
	flutter pub run build_runner build
