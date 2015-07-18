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

        member_id = nil
        if ENV['TRELLO_AUTO_ASSIGN'] && message.from_name
          sender = message.from_name.downcase
          member = board.members.find do |member|
            member.username.downcase == sender || member.full_name.downcase.include?(sender)
          end
          member_id = member.try(:id)
        end

        new_card = ::Trello::Card.create(name: message[:name], list_id: list.id, member_ids: member_id)
        if new_card.short_url
          prefix = ENV['TRELLO_RESPONSE_PREFIX'] || 'Created'
          message.reply "#{prefix} #{new_card.short_url}"
        end
      end
    end
  end
end
