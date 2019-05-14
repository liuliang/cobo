# Cobo

This gem provides a ruby wrapper to the cobo.com api: [Link](https://doc.custody.cobo.com)
## Installation

Add this line to your application's Gemfile:

    gem 'cobo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cobo

## Usage

All methods provided by ```cobo``` are class methods.

For example, ```https://doc.custody.cobo.com``` is written as ```Cobo::Custody.org_info```

The cobo module accepts a setup block for configuration:

```
    Cobo.key = 'my api key'
    Cobo.secret = 'my secret token'
    Cobo.sandbox = false
```

GET requests ( to public ) do not need authentication, and therefor do not need cobo to be configured.

POST requests ( to trading ) will need authentication, and you will have to have your own key and secret token.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
