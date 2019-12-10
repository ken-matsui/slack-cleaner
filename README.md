# slack-cleaner

This action is [kfei/slack-cleaner](https://github.com/kfei/slack-cleaner) for GitHub Actions.

Generated from [actions/container-action](https://github.com/actions/container-action) template.

## Usage

Here is an example workflow setting of this action.

1. Create a `.github/workflows/slack-cleaner.yml` file in your GitHub repository you want setup.

2. Add the following code to the `slack-cleaner.yml` file.

```yml
# .github/workflows/slack-cleaner.yml

name: Slack Cleaner
on:
  schedule:
    - cron:  '0 0 1 * *'
jobs:
  clean:
    runs-on: ubuntu-latest
    steps:
      - uses: matken11235/slack-cleaner@v1
        with:
          token: ${{ secrets.SLACK_LEGACY_TOKEN }}
          message: true
          channel: 'general'
          user: '*'
          before: '20191201'
          perform: true
```

## Input parameters

The only required parameter is `token`.
It should be a Slack legacy token, and you can get from https://api.slack.com/custom-integrations/legacy-tokens.

It should start with `xoxp`, and not like bot tokens with `xoxb`.

And you should set it to your GitHub repository secrets. 

Please refer https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets to know how to set and for more details.

| Parameter Name | Required  | Default  | Description |
|:--------------:|:---------:|:--------:|:------------|
| token          | ○         | N/A      | Slack API legacy token |
| rate           | ×         | N/A      | Delay between API calls (in seconds) |
| message        | ×         | false    | Delete messages |
| file           | ×         | false    | Delete files |
| channel        | ×         | N/A      | Channel name's, e.g., general |
| direct         | ×         | N/A      | Direct message's name, e.g., sherry |
| group          | ×         | N/A      | Private group's name |
| mpdirect       | ×         | N/A      | Multiparty direct message's name, e.g., sherry,james,johndoe |
| user           | ×         | N/A      | Delete messages/files from certain user |
| bot            | ×         | false    | Delete messages from bots |
| after          | ×         | N/A      | Delete messages/files newer than this time (YYYYMMDD) |
| before         | ×         | N/A      | Delete messages/files older than this time (YYYYMMDD) |
| types          | ×         | N/A      | Delete files of a certain type, e.g., posts,pdfs |
| perform        | ×         | false    | Perform the task |

## Examples

### Progammatic Parameter

<details><summary>Expand to see an example workflow</summary><div>

```yml
# .github/workflows/slack-cleaner.yml

name: Slack Cleaner
on:
  schedule:
    - cron:  '0 0 1 * *'
jobs:
  clean:
    runs-on: ubuntu-latest
    steps:
      - uses: matken11235/slack-cleaner@v1
        with:
          token: ${{ secrets.SLACK_LEGACY_TOKEN }}
          rate: '1'
          message: true
          channel: 'notifications'
          user: '*'
          before: "$(date -v -1m '+%Y%m%d')"  # You can use bash style command.
          perform: true
```
</div></details>

### Delete all messages from a channel

<details><summary>Expand to see an example workflow</summary><div>

```yml
# .github/workflows/slack-cleaner.yml

name: Slack Cleaner
on: push
jobs:
  clean:
    runs-on: ubuntu-latest
    steps:
      - uses: matken11235/slack-cleaner@v1
        with:
          token: ${{ secrets.SLACK_LEGACY_TOKEN }}
          message: true
          channel: 'general'
          user: '*'
          perform: true
```
</div></details>

### Delete all messages from a private group

<details><summary>Expand to see an example workflow</summary><div>

```yml
# .github/workflows/slack-cleaner.yml

name: Slack Cleaner
on: push
jobs:
  clean:
    runs-on: ubuntu-latest
    steps:
      - uses: matken11235/slack-cleaner@v1
        with:
          token: ${{ secrets.SLACK_LEGACY_TOKEN }}
          message: true
          group: 'hr'
          user: '*'
          perform: true
```
</div></details>

### Delete all messages from a direct message channel

<details><summary>Expand to see an example workflow</summary><div>

```yml
# .github/workflows/slack-cleaner.yml

name: Slack Cleaner
on: push
jobs:
  clean:
    runs-on: ubuntu-latest
    steps:
      - uses: matken11235/slack-cleaner@v1
        with:
          token: ${{ secrets.SLACK_LEGACY_TOKEN }}
          message: true
          direct: 'sherry'
          user: 'johndoe'
          perform: true
```
</div></details>

### Delete all messages from a multiparty direct message channel

<details><summary>Expand to see an example workflow</summary><div>

**Note: that the list of usernames must contains yourself.**

```yml
# .github/workflows/slack-cleaner.yml

name: Slack Cleaner
on: push
jobs:
  clean:
    runs-on: ubuntu-latest
    steps:
      - uses: matken11235/slack-cleaner@v1
        with:
          token: ${{ secrets.SLACK_LEGACY_TOKEN }}
          message: true
          mpdirect: 'sherry,james,johndoe'
          user: '*'
          perform: true
```
</div></details>

### Delete all messages from certain user

<details><summary>Expand to see an example workflow</summary><div>

```yml
# .github/workflows/slack-cleaner.yml

name: Slack Cleaner
on: push
jobs:
  clean:
    runs-on: ubuntu-latest
    steps:
      - uses: matken11235/slack-cleaner@v1
        with:
          token: ${{ secrets.SLACK_LEGACY_TOKEN }}
          message: true
          channel: 'gossip'
          user: 'johndoe'
          perform: true
```
</div></details>

### Delete all messages from bots (especially flooding CI updates)

<details><summary>Expand to see an example workflow</summary><div>

```yml
# .github/workflows/slack-cleaner.yml

name: Slack Cleaner
on: push
jobs:
  clean:
    runs-on: ubuntu-latest
    steps:
      - uses: matken11235/slack-cleaner@v1
        with:
          token: ${{ secrets.SLACK_LEGACY_TOKEN }}
          message: true
          channel: 'auto-build'
          bot: true
          perform: true
```
</div></details>

### Delete all messages older than 2015/09/19

<details><summary>Expand to see an example workflow</summary><div>

```yml
# .github/workflows/slack-cleaner.yml

name: Slack Cleaner
on: push
jobs:
  clean:
    runs-on: ubuntu-latest
    steps:
      - uses: matken11235/slack-cleaner@v1
        with:
          token: ${{ secrets.SLACK_LEGACY_TOKEN }}
          message: true
          channel: 'general'
          user: '*'
          before: '20150919'
          perform: true
```
</div></details>

### Delete all files

<details><summary>Expand to see an example workflow</summary><div>

```yml
# .github/workflows/slack-cleaner.yml

name: Slack Cleaner
on: push
jobs:
  clean:
    runs-on: ubuntu-latest
    steps:
      - uses: matken11235/slack-cleaner@v1
        with:
          token: ${{ secrets.SLACK_LEGACY_TOKEN }}
          file: true
          user: '*'
          perform: true
```
</div></details>

### Delete all files from certain user

<details><summary>Expand to see an example workflow</summary><div>

```yml
# .github/workflows/slack-cleaner.yml

name: Slack Cleaner
on: push
jobs:
  clean:
    runs-on: ubuntu-latest
    steps:
      - uses: matken11235/slack-cleaner@v1
        with:
          token: ${{ secrets.SLACK_LEGACY_TOKEN }}
          file: true
          user: 'johndoe'
          perform: true
```
</div></details>

### Delete all snippets and images

<details><summary>Expand to see an example workflow</summary><div>

```yml
# .github/workflows/slack-cleaner.yml

name: Slack Cleaner
on: push
jobs:
  clean:
    runs-on: ubuntu-latest
    steps:
      - uses: matken11235/slack-cleaner@v1
        with:
          token: ${{ secrets.SLACK_LEGACY_TOKEN }}
          file: true
          types: 'snippets,images'
          perform: true
```
</div></details>

## LICENSE

This project is licensed under the [MIT License](LICENSE).
