local create_resistances = function()
  resistances = {}
  for i,damage_type in pairs(data.raw["damage-type"]) do
    resistance = 
	{
	  type = damage_type.name,
      percent = 100
	}
	table.insert(resistances,resistance)
  end
  return resistances
end

data.raw["construction-robot"]["fission-construction-robot"].resistances = create_resistances()