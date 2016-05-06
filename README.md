# OmniAuth Universe

This gem contains the Universe strategy for OmniAuth 2.0.

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-universe', '~> 0.0.6'
```

Then `bundle install`.

## Basic Usage

```ruby
use OmniAuth::Builder do
  provider :universe, ENV['UNIVERSE_CLIENT_ID'], ENV['UNIVERSE_CLIENT_SECRET']
end
```

Currently Universe Oauth2 authorization is in beta and must be activated by contacting support@universe.com.

## Versioning

This library aims to adhere to [Semantic Versioning 2.0.0][semver]. Violations
of this scheme should be reported as bugs.

[semver]: http://semver.org/spec/v2.0.0.html

## Contributors

- John-Alan Simmons ([jsimnz](https://github.com/jsimnz), (@iamjsimnz)[htps://twitter.com/iamjsimnz])

Special thanks to [Kruttik Aggarwal](https://github.com/k504866430) for the original codebase that was forked from [omniauth-eventbrite](https://github.com/k504866430/omniauth-eventbrite)

## License

The MIT License (MIT)

Copyright (c) 2016 John-Alan Simmons <simmons.johnalan@gmail.com>

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

