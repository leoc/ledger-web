# ledger-web

`ledger-web` is a simple web app on top of `ledger-rest`.

## Features

`ledger-rest` is using the `ledger` command-line utility to extract
information from your ledger files. This information is exported to
JSON format, which we can use in the `ledger-web` web app.

Currently `ledger-web` supports the following features.

* quick view of `ledger balance`
* quick view of `ledger register`
* capture a new transaction via `ledger entry`

## Screenshots

Yet to make...

## Usage

I assume you are having a working ruby installation with the `bundler`
gem installed. Then you just clone the `ledger-web` repository,
install the `bundle`, configure the web app if needed and run the
server via `rack` like so:

    git clone https://github.com/leoc/ledger-web.git
    cd ledger-web
    bundle install
    nano ledger-rest.yml # configure ledger-rest, example files should be easy to understand
    nano ledger-web.yml # configure ledger-web, example should be easy to understand
    rackup -p 3000

Now browse to [http://localhost:3000/].

## Configuration

Configuration is done in specific yaml files. Because ledger-rest is a
dependency you have to configure it in its own yaml file.

* ledger-rest.yml
* ledger-web.yml

## License

Copyright (c) 2012 Arthur Leonard Andersen <leoc.git@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

## Contribute

See `ledger-web.org` or think of useful feature yourself ;-)

* Fork the repository
* Clone your fork to your local computer
* Create a feature branch `git branch my-feature`
* Push your changes to your forked remote repository
* Create a pull request
