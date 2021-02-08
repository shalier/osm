# Automatic Merging of Pull Requests in OSM
This document aims to explain how and why OSM utilizes the [automerge-action bot](https://github.com/pascalgn/automerge-action) to automatically merge pull requests and how it was set up.

## Workaround to triggering workflows
By default the automerge-action bot uses a `GITHUB_TOKEN` to perform automerging; however, events triggered via `GITHUB_TOKEN` will not further trigger additional workflow runs. To work around this, we created a GitHub App (Generate_Token) to generate a token that is then used to create a JSON Web Token (JWT) that authenticates and retrieves the Installation Access Token (IAT) from the GitHub API. Passing in the IAT as the `GITHUB_TOKEN`, will allow both `on:push` and `on:pull_request` workflows to trigger.

## Workaround to not designating status checks as required via branch protection rules
The GitHub automerge feature as well as the automerge-action bot require status checks to be marked as required under branch protection rules in order to have the automerge action wait for the status checks to complete. This prevents the possibility of any optional checks. To work around this, we created a script that checks the status of the status checks workflow and only continues automerging if the workflow completed successfully.

## How it works
- Automerge only occurs when the `automerge` label is assigned. To prevent automerging, you can either not assign the `automerge` label or include one of the following labels: `wip` or `do-not-merge/hold`.
- Once labelled with `automerge` and neither of the blocking labels, a merge attempt will trigger only if all status checks have passed and the required number of review approvals have been given (number of review approvals are designated as required in the branch protection rules).
### Rebasing
- To enable automatic rebasing, you must require branches to be up to date before merging in the branch protection rules.
- If the pull request is not up to date, the automerge bot will automatically attempt to rebase if it has either labels: `automerge` or `rebase`. If it fails to rebase it will exit with error code 1 and you must resolve the conflicts.
- If the rebase is successful, then the status checks will be re-triggered. If the pull request has the `automerge` label then once required checks have passed the pull request will be automatically merged. The pull request will **not** be automatically merged if it only has the `rebase` label, it will only be automatically rebased.

## How to set up
1. Create a GitHub App following the [link](https://docs.github.com/en/developers/apps/creating-a-github-app)
    * Create a name for your app in `Github App name`
    * Set any page as your `Homepage URL`
    * Uncheck `Active` under `Webhook`
    * Under `Repository permissions` change the access level to `Access: Read & write` for both
        * `Contents`
        * `Pull requests`
        * `Checks`
2. After creating the app, generate a private key in the GitHub App and store it
    * Note the GitHub App ID
3. Create two `New repository secrets` under Settings -> Secrets (ensure the name is identical):
    * APP_ID: &lt;GitHub APP ID&gt;
    * APP_PRIVATE_KEY: &lt;GitHub App Private Key&gt;
        * Include the BEGIN and END RSA KEY lines
4. Install the GitHub App on the repository where you want the automerge feature
5. Create a new [`.github/workflows/automerge.yml` file](https://github.com/openservicemesh/osm/blob/main/.github/workflows/automerge.yml)