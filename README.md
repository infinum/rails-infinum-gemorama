[![Build Status](https://docs.semaphoreci.com/essentials/status-badges/)](https://semaphoreci.com/infinum/APP)
![Health score](https://revisor.infinum.com/api/v1/badges/add-project-key?type=health_score)
![CVE count](https://revisor.infinum.com/api/v1/badges/add-project-key?type=cve_count)

# README

## [Technical Documentation](docs/README.md)

## Dependencies

### System
  * Ruby (defined in .ruby-version file)
  * Node.js (defined in [package.json](https://classic.yarnpkg.com/en/docs/package-json/#toc-engines))
  * Yarn (defined in [package.json](https://classic.yarnpkg.com/en/docs/package-json/#toc-engines))

## Setup

Run:
```bash
./bin/setup
```

Run after each git pull:
```bash
./bin/update
```

## Test suite
Run:
```bash
bundle exec rspec
```

