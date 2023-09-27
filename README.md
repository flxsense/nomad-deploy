# Nomad Deploy

Small GitHub Action that runs `nomad job run ...` with the Nomad CLI.

## Usage

Straightforward checkout then publish

```yaml
name: Deploy Docker Image to Nomad Cluster
on: [push]
jobs:
  deploy:
    name: Nomad Deploy
    runs-on: ubuntu-latest
    steps:
      - name: Checkout the code
        uses: actions/checkout@v3

      - name: Deploy with Nomad
        uses: flxsense/nomad-deploy
        with:
          auth: '{{ secrets.YOUR_BASIC_AUTH }}'
          address: '{{ secrets.YOUR_NOMAD_SERVER }}'
          job: path/to/your/nomad/job/file
          # optional:
          datacenters: 'comma-separated list of datacenters if default in job-file are not used'
          node_pool: 'if other than default are used'
          # if other docker tags than 'latest' are used:
          tag: ${{ github.ref }}
          # Deployment count
          count: 2

```
