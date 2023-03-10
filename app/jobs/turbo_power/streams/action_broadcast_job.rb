# The job that powers all the <tt>custom_broadcast_$action_later</tt> broadcasts available in <tt>TurboPower::Broadcasts</tt>.

class TurboPower::Streams::ActionBroadcastJob < ActiveJob::Base
  discard_on ActiveJob::DeserializationError

  def perform(stream, action:, **attributes)
    Turbo::StreamsChannel.custom_broadcast_action_to stream, action: action, **attributes
  end
end
