#!/bin/sh

init_options() {
  OPTIONS=""

  if [[ -n "$INPUT_CONFIG" ]]; then
    OPTIONS="${OPTIONS} --config=${INPUT_CONFIG}"
  fi

  if [[ -n "$INPUT_BRANCH" ]]; then
    INPUT_BRANCH=$(echo $INPUT_BRANCH | sed "s/^refs\/heads\///")
    OPTIONS="${OPTIONS} --branch=${INPUT_BRANCH}"
  fi

  if [[ "$INPUT_DRY_RUN" = true ]]; then
    OPTIONS="${OPTIONS} --dry-run"
  fi

  if [[ "$INPUT_RELATIVE_PATH" = true ]]; then
    OPTIONS="${OPTIONS} --relative-path"
  fi

  if [[ "$INPUT_PORCELAIN" = true ]]; then
    OPTIONS="${OPTIONS} --porcelain"
  fi

  echo "${OPTIONS}";
}

echo "STARTING BETTER-CROWDIN ACTION";


OPTIONS=$( init_options );

echo "better-crowdin $INPUT_ACTION $OPTIONS || $INPUT_IGNORE_ERRORS"

better-crowdin $INPUT_ACTION $OPTIONS || $INPUT_IGNORE_ERRORS

