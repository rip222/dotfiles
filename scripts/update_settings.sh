#!/bin/bash

LOGGED_USER=$(whoami)

# Set zsh as the default shell
chsh -s $(which zsh) $LOGGED_USER
