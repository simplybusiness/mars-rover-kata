#!/bin/sh

message=${1:-"green"}

bundle exec rspec -cfd && git add -A && git commit -m "$message" || git checkout lib spec