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

## Contributing

We are happy to accept contributions. To contribute please do the following:

- Fork the repository on GitHub.
- Decide which code you want to submit. Commit your changes and push to the new branch.
- Ensure that your code adheres to standard conventions, as used in the rest of the library.
- Submit a pull request with your patch on Github.
