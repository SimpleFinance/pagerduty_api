# PagerdutyAPI
Pagerduty API v2 client.

## Usage
All this does is hit the Notes API, for now. Pull requests happily accepted :)

```ruby
pd = PagerdutyAPI.new({
  token: 'SomeAPIToken',
  adapter: :some_faraday_adapter
})
pd.create_note(1, "Here's a note", "jake@mydomain.com")
pd.get_notes(1)
```
