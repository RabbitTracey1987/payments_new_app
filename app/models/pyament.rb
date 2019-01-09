class Pyament < ActiveRecord::Base
	state_machine :state, initial: :pending do 
		after_transition pending: :processing, do: :process_stripe_payment
		before_transition successful: :refunded, do: :process_stripe_refund
		event :process do 
			transition pending: :processing
		end
		event :failed do 
			transition processing: :failed
		end
		event :success do 
			transition processing: :successful
		end
		event :refund do 
			transition successful: :refunded
		end 
		state :refunded do
			def refund_time
				Time.zone.now
			end
		end
		def process_stripe_payment
			if true
				success
			else
				failed
			end
		end 
		def process_stripe_refund

		end
	end
end
