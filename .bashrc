#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Primary prompt string
PS1='[\u@\h \W]\$ '

# Default text editor
export EDITOR=vim
export VISUAL=vim
