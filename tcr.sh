#!/bin/sh

message=${1:-"green"}

if bundle exec rspec -cfd
then
  git add -A && git commit -m "$message"
else
  git checkout lib spec
fi