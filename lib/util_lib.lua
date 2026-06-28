util_lib = 
{
	table = {}
}

function table.contains(tab,elem)
	for _,v in pairs(tab) do
		if v == elem then
			return true
		elseif type(v) == "table" then
			if table.contains(v,elem) then
				return true
			end
		end
	end
	return false
end

function table.count(self)
	if self == nil or self == {} then return 0 end
		
	local i = 0
	for _ in pairs(self) do
		i = i + 1
	end
	return i
end

util_lib.table.contains = table.contains
util_lib.table.count = table.count

return util_lib