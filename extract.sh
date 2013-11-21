#!/usr/bin/env bash

# Extract all submodules (from vim/).

git pull && git submodule init && git submodule update && git submodule status
