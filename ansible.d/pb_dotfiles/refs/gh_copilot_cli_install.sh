#!/usr/bin/env sh

# assumes `gh` already installed
gh auth login
gh extension install github/gh-copilot

# NOTE: needed to run below and auth through mobile manually. Might not be feasible to automate
# gh auth login --web -h github.com
# @TODO: add to playbook with `gh` (`gh` currently installed by apt install playbook)
