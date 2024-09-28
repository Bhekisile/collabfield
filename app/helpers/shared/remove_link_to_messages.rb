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
