# alpine-apk-imagemagick

This repository serves the purpose that imagemagick by default does not include bindings to third-party software that are required for fylr to run correctly. The only task this repository serves is to build imagemagick from version X.

## Build a package

Since packages must be signed with a private and public key, navigate to the keystore and download the private and public keys related to alpine builds and place them in the abuild folder.

Once you have successfully placed both files (public and private key) in the abuild folder, we can now start building imagemagick. To simplify the execution of the commands, we provide a Makefile that contains all the necessary commands to build imagemagick. To start the process, simply run the following command:

```bash
make package
```

This command creates and packages imagemagick as **imagemagick.tar.gz**.

## Getting started

Since the custom version is not supplied to alpine directly, you have to install it manually from the release. For that navigate to [releases](https://github.com/programmfabrik/alpine-apk-imagemagick/releases) and download the imagemagick.tar.gz file. Extract the content to a persistent storage and run the commands below, to install imagemagick:

```bash
apk add potrace # prerequisite for svg conversions
apk add --repository /<your-path> imagemagick
```

Tada imagemagick with all bindings should now be available for you.
