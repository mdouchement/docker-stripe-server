# docker-stripe-server
A mock of Stripe API

- Run docker `docker run -p 4999:4999 -it stripe-mock-server`
- Edit `config/environments/development.rb`:
```ruby
# ...

unless ENV['MOCKER']
  require 'stripe_mock'
  StripeMock.start_client
end
```
- `bundle exec rails s`

## Issues:
- In memory data storage (can be persisted by modifying this [class](https://github.com/rebelidealist/stripe-ruby-mock/blob/master/lib%2Fstripe_mock%2Fdata.rb) in the original gem)
- Some default resource params are missing (e.g. metadata hash on customer)
- Some API requests are not supported (api.stripe.com)
- Connect url is not mocked (connect.stripe.com)
