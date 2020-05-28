# Github better-crowdin action

This action allows you to manage and synchronize localization resources with your Crowdin project, using [better-crowdin](https://www.npmjs.com/package/better-crowdin) CLI

## What does this action do?
- Upload sources to Crowdin.
- Upload translations to Crowdin.
- Download translations from Crowdin.
- Delete branch from Crowdin



## Usage
Set up a workflow in *.github/workflows/crowdin.yml* (or add a job to your existing workflows).

Read the [Configuring a workflow](https://help.github.com/en/articles/configuring-a-workflow) article for more details on how to create and set up custom workflows.
```yaml
name: Crowdin Action

on:
  push:
    branches: [ master ]

jobs:
  synchronize-with-crowdin:
    runs-on: ubuntu-latest

    steps:

    - name: Checkout
      uses: actions/checkout@v2

    - name: crowdin action
      uses: ardeois/better-crowdin-action@latest
      with:
        action: 'upload sources'
```

## Supported options
The default action is to upload sources. Though, you can set different actions through the “with” options. If you don't want to upload your sources to Crowdin, just update the `action` option.

```yaml
- name: crowdin action
  with:
    # Define command action ('delbranch', 'download', 'upload sources', 'upload translations', 'sync').
    action: 'upload sources'
    
    # Crowdin configuration file path [crowdin.yml]
    config: './crowdin.yml'

    # Crowdin branch to use with command (defaults to current git branch).
    #   Note this is required when you use action 'delbranch', use `branch: ${{ github.ref }}`
    branch: '<branch-name>'
    
    # Do not execute write operations on crowdin
    dry_run: true

    # Make "base_path" property relative to config file path
    relative_path: true

    # Print script-aware outputs (no colors, no human friendly info)
    porcelain: true

    # Ignore any script error. This could be useful for `delbranch` in case the branch does not exists
    ignore_errors: true
```

For more detailed descriptions of these options, see [`action.yml`](https://github.com/ardeois/better-crowdin-action/blob/master/action.yml).

## Contributing

We are happy to accept contributions. To contribute please do the following:

- Fork the repository on GitHub.
- Decide which code you want to submit. Commit your changes and push to the new branch.
- Ensure that your code adheres to standard conventions, as used in the rest of the library.
- Submit a pull request with your patch on Github.
