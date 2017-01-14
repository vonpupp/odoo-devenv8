#!/bin/bash

source .env
SESSION_NAME=$(echo $VM_HOSTNAME | tr '.' '-')
TMUX_SESSION_NAME=$SESSION_NAME tmuxp load .
