#!/bin/bash
# ABOUTME: Exercise the downloaded shell snippet functions.
# ABOUTME: Load the snippets from the practices repository.

source /dev/stdin <<< "$(curl -s https://raw.githubusercontent.com/pzyyll/practices/main/shell/shell-snippets/load.sh | bash -s -- color_echo mk_dir)"

# source /dev/stdin <<< "$(bash ./load.sh color_echo mk_dir)"

color_echo "Hello, world!" red
mk_dir "test"
mk_dir "test/test1"
mk_dir "test/test2"