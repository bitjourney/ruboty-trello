# Ruboty::Trello

Ruboty plugin for adding a new card to Trello.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-trello'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-trello

## Usage

```
@ruboty trello b <board_name> l <list_name> (lb <label_name>) (dd <due_date>) c <card_name>
```

e.g.


```
@ruboty trello b development l icebox c something
@ruboty trello b development l icebox dd 2016-01-01 c something
@ruboty trello b development l icebox dd 2016-01-01 01:02 c something
@ruboty trello b development l icebox lb feature dd 2016-01-01 01:02 c something
```


## ENV

### required

```
TRELLO_DEVELOPER_PUBLIC_KEY - Developer API Key
TRELLO_MEMBER_TOKEN - Member Token (require read&write scope)
```

see https://github.com/jeremytregunna/ruby-trello#configuration to get these keys

### optional

```
TRELLO_AUTO_ASSIGN - If set to '1', assigns sender with created card
TRELLO_RESPONSE_PREFIX - Specify response message (default is 'Created')
TRELLO_MEMBER_FROM_SENDER - JSON for sender to Trello member mapping (ex: {"ihara":"masahiroihara", "taro":"taroyamada"})
```

## How to develop

You have to set TRELO_DEVELOPER_PUBLIC_KEY and TRELLO_MEMBER_TOKEN, set other environment variables if you need. 
```
>  TRELLO_DEVELOPER_PUBLIC_KEY=xxx TRELLO_MEMBER_TOKEN=xxx bundle exec ruboty -l lib/rutoby/trello.rb
```

## Contributing

1. Fork it ( https://github.com/bitjourney/ruboty-trello/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
