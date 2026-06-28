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

util_lib.table.contains = table.contains

return util_lib