# VoiceArchive Client Gem [![Build Status](https://travis-ci.com/ArnsboMedia/voicearchive_client.svg?branch=master)](https://travis-ci.com/ArnsboMedia/voicearchive_client)

VoiceArchive API client gem, for use i Ruby projects. The projects implements some of the exposed API endpoint, from [Arnsbo Media Engine](https://github.com/ArnsboMedia/systemet).

## Requirements

- [Ruby](https://www.ruby-lang.org/en/news/2014/11/13/ruby-1-9-3-p551-is-released/) 1.9.3

## Installation

```shell
$ scripts/setup
```

## Usage

`scripts/server` will start an `irb` console, to play around with the Gem:

```shell
$ scripts/server
```

To use in an applicaiton, add this line to the Gemfile:

```sh
gem 'voicearchive_client', git: 'https://github.com/ArnsboMedia/voicearchive_client.git'
```
.. and then run `$ bundle` :rocket:

## Test

```shell
$ scripts/test
```
