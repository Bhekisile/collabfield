module ApplicationCable
  class Connection < ActionCable::Connection::Base
    def send_message(data)
      message_params = data['message'].each_with_object({}) do |el, hash|
        hash[el['name']] = el['value']
      end
      Private::Message.create(message_params)
    end
  end
end
