#!/usr/bin/env bash

# Extract all submodules (from vim/).

git pull origin master && git submodule init && git submodule update --recursive && git submodule status
