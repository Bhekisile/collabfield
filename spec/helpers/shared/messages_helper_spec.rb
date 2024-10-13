require 'rails_helper'
RSpec.describe Shared::MessagesHelper, type: :helper do
  describe '#remove_link_to_messages' do
    controller do
      attr_accessor :is_messenger, :messages_to_display_offset

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
    end

    before do
      @controller = described_class.new
    end

    context 'when @is_messenger is false and @messages_to_display_offset is zero' do
      it 'returns the remove_more_messages_link partial path' do
        @controller.is_messenger = 'false'
        @controller.messages_to_display_offset = 0

        result = @controller.remove_link_to_messages
        expect(result).to eq('shared/load_more_messages/window/remove_more_messages_link')
      end

      it 'returns the empty_partial path' do
        @controller.is_messenger = 'false'
        @controller.messages_to_display_offset = 1

        result = @controller.remove_link_to_messages
        expect(result).to eq('shared/empty_partial')
      end

      it 'returns the empty_partial path' do
        @controller.is_messenger = 'true'
        @controller.messages_to_display_offset = 0

        result = @controller.remove_link_to_messages
        expect(result).to eq('shared/empty_partial')
      end
    end
  end
end

# require 'rails_helper'

# RSpec.describe YourController, type: :controller do
#   describe '#remove_link_to_messages' do
#     controller do
#       attr_accessor :is_messenger, :messages_to_display_offset

#       def remove_link_to_messages
#         if @is_messenger == 'false'
#           if @messages_to_display_offset.zero?
#             'shared/load_more_messages/window/remove_more_messages_link'
#           else
#             'shared/empty_partial'
#           end
#         else
#           'shared/empty_partial'
#         end
#       end
#     end

#     before do
#       @controller = described_class.new
#     end

#     context 'when @is_messenger is false and @messages_to_display_offset is zero' do
#       it 'returns the remove_more_messages_link partial path' do
#         @controller.is_messenger = 'false'
#         @controller.messages_to_display_offset = 0

#         result = @controller.remove_link_to_messages
#         expect(result).to eq('shared/load_more_messages/window/remove_more_messages_link')
#       end
#     end

#     context 'when @is_messenger is false and @messages_to_display_offset is not zero' do
#       it 'returns the empty_partial path' do
#         @controller.is_messenger = 'false'
#         @controller.messages_to_display_offset = 1

#         result = @controller.remove_link_to_messages
#         expect(result).to eq('shared/empty_partial')
#       end
#     end

#     context 'when @is_messenger is not false' do
#       it 'returns the empty_partial path' do
#         @controller.is_messenger = 'true'
#         @controller.messages_to_display_offset = 0

#         result = @controller.remove_link_to_messages
#         expect(result).to eq('shared/empty_partial')
#       end
#     end
#   end
# end
