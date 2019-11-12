#!/bin/bash

SCRDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd)"

rsync -az --progress --verbose --exclude="deploy.sh" "$SCRDIR/" "$HOME"
