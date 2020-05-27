#!/bin/sh

init_options() {
  OPTIONS=""

  if [[ -n "$INPUT_CONFIG" ]]; then
    OPTIONS="${OPTIONS} --config=${INPUT_CONFIG}"
  fi

  if [[ -n "$INPUT_BRANCH" ]]; then
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

echo better-crowdin $INPUT_ACTION $OPTIONS
better-crowdin $INPUT_ACTION $OPTIONS

