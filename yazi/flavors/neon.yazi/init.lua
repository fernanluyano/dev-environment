-- Custom linemode to show modified time in English
function Linemode:mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		return ui.Line("")
	end

	-- English month names
	local months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}

	local now = os.time()
	local diff = os.difftime(now, time)
	local date_table = os.date("*t", time)
	local formatted

	-- Show time if modified today, date if within 6 months, otherwise show year
	if diff < 86400 then -- Less than 24 hours
		formatted = string.format("%02d:%02d", date_table.hour, date_table.min)
	elseif diff < 15552000 then -- Less than 6 months
		formatted = string.format("%s %02d %02d:%02d", months[date_table.month], date_table.day, date_table.hour, date_table.min)
	else
		formatted = string.format("%s %02d  %04d", months[date_table.month], date_table.day, date_table.year)
	end

	return ui.Line(formatted)
end
