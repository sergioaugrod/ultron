# Ultron

[![Build Status](https://travis-ci.org/sergioaugrod/ultron.svg?branch=master)](https://travis-ci.org/sergioaugrod/ultron)
[![Code Climate](https://codeclimate.com/github/sergioaugrod/ultron/badges/gpa.svg)](https://codeclimate.com/github/sergioaugrod/ultron)
[![Test Coverage](https://codeclimate.com/github/sergioaugrod/ultron/badges/coverage.svg)](https://codeclimate.com/github/sergioaugrod/ultron/coverage)

Ultron enables communication between an Arduino and MQTT.

## Features

* Write/Get from arduino via Serial;
* Publish/Subscribe MQTT.

## Installation

```console
$ bundle
```

## Usage

```ruby
Ultron.configure do |c|
  c.serial = {
    port: '/dev/cu.usbmodem1421',
    rate: 9600
  }

  c.mqtt = {
    host: 'localhost',
    username: '',
    password: '',
    port: 1883,
    ssl: false
  }
end

Ultron::Client.new.execute
```

or

```ruby
config = {
  serial: {
    port: '/dev/cu.usbmodem1421',
    rate: 9600
  },
  mqtt: {
    host: 'localhost',
    username: '',
    password: '',
    port: 1883,
    ssl: false
  }
}

Ultron::Client.new(config).execute
```

## Contributing

1. Clone it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## Maintainers

* [sergioaugrod](https://github.com/sergioaugrod/)
