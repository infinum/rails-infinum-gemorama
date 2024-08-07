# Gemorama

This is a Rails project used for generating charts for Ruby projects. The chart depicts how many outdated gems a Ruby project has for every date in the chart:

![Example chart](public/example.png)

### System
  * Ruby (defined in .ruby-version file)
  * Node.js (defined in [package.json](https://classic.yarnpkg.com/en/docs/package-json/#toc-engines))
  * Yarn (defined in [package.json](https://classic.yarnpkg.com/en/docs/package-json/#toc-engines))

## Setup

Run:
```bash
./bin/setup
```

## Load Rubygems data

In order to use this app, you'll first need to seed your database with some Rubygems dumps. This can easily be done with:

```bash
script/load-pg-dump -d rails_infinum_gemorama_development -c ~/Downloads/public_postgresql.tar
```

## Generate chart

Now that you have everything in place, you can generate charts for your projects using:

```bash
script/chart -f 2024-07-29 -t 2024-08-02 ~/Code/Projects/a-cool-rails-rails-project
```

To get more info on the `script/chart` options, run:

```bash
script/chart -h
```
