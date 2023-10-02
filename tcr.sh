#!/bin/sh

bundle exec rspec -cfd && git commit -am "Test passes" || git checkout lib