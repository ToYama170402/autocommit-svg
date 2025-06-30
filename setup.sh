#!/bin/sh

find . -name "*.svg" | entr -p ./autocommit.sh /_
