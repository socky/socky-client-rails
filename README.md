Socky - client bindings for Ruby on Rails
===========

Socky is push server for Ruby based on WebSockets. It allows you to break border between your application and client browser by letting the server initialize a connection and push data to the client.

## Example

You can try [live example](http://sockydemo.imanel.org) or view its [source code](http://github.com/socky/socky-example)

Also important information can be found on our [google group](http://groups.google.com/group/socky-users).

## Install

The best way to install Socky Ruby on Rails bindings is via RubyGems:

    gem install socky-client-rails

Socky Ruby on Rails bindings require the [socky-client](http://github.com/socky/socky-client-ruby) gem. It is automatically installed by the gem install command.

You can also build it after clonning(this will require Jeweler gem)

    git clone git://github.com/socky/socky-client-rails.git
    rake gemspec
    rake build

## Configuration

Configuration file is located in application config directory:

    config/socky_hosts.yml

If it isn't exists then you will need to generate it. In Rails 3 you can use rake task:

    rake socky:install

which also install Socky JS files.

If you are using Rails 2 then you will need to generate rake tasks first(this will be required only once):

    script/generate socky

More about configuraton can be found in [socky-client-ruby](http://github.com/socky/socky-client-ruby).

## Usage

### View

Socky Ruby on Rails bindings provide `socky` helper for views and :socky javascript expansion.

At first you will need set of javascripts providing bridge between browser and WebSocket connection.

    <%= javascript_include_tag :socky %>

This will also load javascripts that will use flash to simulate WebSocket if browser don't support it.

After that you can use @socky@ helper to create connection with Socky server.

    <%= socky %>

Helper is accepting following options in hash form:

| *Option*       | *Value format*     | *Description* |
| -------------- | ------------------ | ------------- |
| `:host`        | `[string]`         | IP or hostname of Socky server - at default random server from socky_hosts.yml is taken
| `:port`        | `[integer]`        | Port on with Socky server listens - at default random server from socky_hosts.yml is taken
| `:user_id`     | `[string/integer]` | Hash by with user will be identified
| `:user_secret` | `[string]`         | Hash by with user will be authenticated
| `:channels`    | `[array]`          | List of channels to with user will be connected

### Model and controller

Socky Ruby on Rails bindings offers all functionality of [socky-client-ruby](http://github.com/socky/socky-client-ruby) and additional method to send data via `Socky.send` command. You can use block of code and passed object will be standard Rails JavaScript generator.

    Socky.send do |page|
      page.alert('ok!')
    end

Note that you can as usually use old methods and connect them with new method:

    Socky.send :users => ["user1", "user2"] do |page|
      page.alert('ok!')
    end

Also note that if you use block version any data passed as body will be overwritten.

## License

(The MIT License)

Copyright (c) 2010 Bernard Potocki

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.