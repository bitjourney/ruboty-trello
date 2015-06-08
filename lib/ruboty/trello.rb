require 'trello'

Trello.configure do |config|
  config.developer_public_key = ENV['TRELLO_DEVELOPER_PUBLIC_KEY']
  config.member_token = ENV['TRELLO_MEMBER_TOKEN']
end

module Ruboty
  module Handlers
    class Trello < Base
      on /trello\s+b\s+(?<board_name>.*)\s+l\s+(?<list_name>.*)\s+c\s+(?<name>.*)\z/i, name: 'trello', description: 'Add card to Trello'

      def trello(message)
        me = ::Trello::Member.find('me')

        board = me.boards.find { |board| board.name == message[:board_name] }
        if board.nil?
          message.reply "Board '#{message[:board_name]}' not found"
          return
        end

        list = board.lists.find { |list| list.name == message[:list_name] }
        if list.nil?
          message.reply "List '#{message[:list_name]}' not found"
          return
        end

        ::Trello::Card.create(name: message[:name], list_id: list.id)
      end
    end
  end
end
