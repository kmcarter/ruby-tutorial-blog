module ApplicationHelper
	def get_icon(name)
		case name
			when 'notice', 'success'
				icon("check")
			when 'danger', 'alert'
				icon("warning")
			when 'info'
				icon("info-circle")
			when 'warning'
				icon("exclamation-circle")
			else
				string.empty
		end
	end
end
