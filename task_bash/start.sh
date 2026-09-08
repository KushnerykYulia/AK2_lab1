#!/bin/bash

scdir="$(cd "$(dirname "$0")" && pwd)"

gnome-terminal -- bash -c "$scdir/clean.sh ; exec bash"
