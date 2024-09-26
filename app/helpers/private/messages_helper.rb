module Private::MessagesHelper
  def private_message_date_check(message, previous_message)
    if defined?(previous_message) && previous_message.present?
      # if messages are not created at the same day
      if previous_message.created_at.to_date == message.created_at.to_date
        'shared/empty_partial'
      else
        @message = message
        'private/messages/message/new_date'
      end
    else
      'shared/empty_partial'
    end
  end
end
