#!/bin/bash

set -e

exec make $(echo "$@" | sed -e 's/V=1/V=0/g')