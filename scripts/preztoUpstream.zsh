#!/bin/bash
if [[ "$PWD" = "$HOME/.zprezto" ]]; then
  git remote add upstream https://github.com/sorin-ionescu/prezto.git
  git remote -v
fi
