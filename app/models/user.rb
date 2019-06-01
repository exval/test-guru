class User < ApplicationRecord
	
	def history_test_by_level(level)
		tests.where(level: level)
	end

	def list_tests
		
	end
end
