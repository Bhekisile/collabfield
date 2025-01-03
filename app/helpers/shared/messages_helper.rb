module Shared::MessagesHelper
  def append_previous_messages_partial_path
    'shared/load_more_messages/window/append_messages'
  end

  def replace_link_to_group_messages_partial_path
    'group/messages/load_more_messages/window/replace_link_to_messages'
  end

  # if there are no previous messages
  def remove_link_to_messages
    if @is_messenger == 'false'
      if @messages_to_display_offset.zero?
        'shared/load_more_messages/window/remove_more_messages_link'
      else
        'shared/empty_partial'
      end
    else
      'shared/empty_partial'
    end
  end

  # in the messenger load previous messages until the scroll bar appears
  def autoload_messenger_messages
    if @is_messenger == 'true'
      # if previous messages exist, load them
      if @messages_to_display_offset == 0
        # remove load previous messages link
        'shared/load_more_messages/messenger/remove_previous_messages_link'
      else
        'shared/load_more_messages/messenger/load_previous_messages'
      end
    else
      'shared/empty_partial'
    end
  end
end
