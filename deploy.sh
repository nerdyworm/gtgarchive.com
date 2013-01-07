#!/bin/bash

set -e

rm -rf build && middleman build && middleman sync
