module EventsHelper
	def same_state?(state)
		state == current_user.state
	end

	def joining?(event)
		current_user.events_attending.include?(event)
	end

	def hosting?(event)
		current_user.events.include?(event)
	end
end
