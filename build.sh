#!/bin/bash

set -e

docker run -v /dev:/dev --privileged --env-file <(sops -d .env) -v "$(pwd):/app" picl-builder:latest
