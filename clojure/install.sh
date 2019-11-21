#!/bin/bash

SCRDIR="$(readlink -f "$(dirname "$0")")"

mkdir "$HOME/.clojure"
cp -i -v "$SCRDIR/deps.edn" "$HOME/.clojure/deps.edn"
