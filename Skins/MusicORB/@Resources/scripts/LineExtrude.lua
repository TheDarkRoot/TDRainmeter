-- @author Malody Hoe / GitHub: madhoe / Twitter: maddhoexD

function Initialize()
	NumOfLines = SKIN:ParseFormula(SKIN:GetVariable("NumOfLines"))
	Radius = SKIN:ParseFormula(SKIN:GetVariable("Radius"))
	Squared = SKIN:ParseFormula(SKIN:GetVariable("Squared"))
	ExtrudeMax = SKIN:ParseFormula(SKIN:GetVariable("ExtrudeMax"))
	Inward = SKIN:ParseFormula(SKIN:GetVariable("Inward"))
	AngleStart = SKIN:ParseFormula(SKIN:GetVariable("AngleStart"))
	AngleTotal = SKIN:ParseFormula(SKIN:GetVariable("AngleTotal"))
	ClockWise = SKIN:ParseFormula(SKIN:GetVariable("ClockWise")) == 1
	LineWidth = SKIN:ParseFormula(SKIN:GetVariable("LineWidth"))
	PI = math.pi
	PIx2 = math.pi * 2
end

function Update()
	local shapes = {}
	local nLines = NumOfLines - 1
	if AngleTotal < PIx2 then
		nLines = nLines + 1
	end
	
	for i = 0, nLines do
		local mband0 = SKIN:GetMeasure("mBand" .. i):GetValue()
		
		local a = i
		if ClockWise then
			a = nLines - i
		end
		
		local x0 = (Radius + mband0 * math.pow(mband0, Squared) * (-Inward * 2 + 1) * ExtrudeMax) * 
			math.cos((AngleTotal - AngleTotal / NumOfLines * a + AngleStart) % PIx2) + Radius + ExtrudeMax
		local y0 = (Radius + mband0 * math.pow(mband0, Squared) * (-Inward * 2 + 1) * ExtrudeMax) * 
			math.sin((AngleTotal - AngleTotal / NumOfLines * a + AngleStart) % PIx2) + Radius + ExtrudeMax
			
		table.insert(shapes, { x = x0, y = y0 })
	end
	
	for i = 0, NumOfLines-1 do
		-- lua tables start from index 1
		local x0 = shapes[i + 1]["x"]
		local y0 = shapes[i + 1]["y"]
		local x1 = shapes[(i + 1) % #shapes + 1]["x"]
		local y1 = shapes[(i + 1) % #shapes + 1]["y"]
		
		angle = math.atan2(y1 - y0, x1 - x0)
		length = math.sqrt(math.pow(x1 - x0, 2) + math.pow(y1 - y0, 2))
		SKIN:Bang("!SetOption", "Line" .. i, "StartAngle", angle)
		SKIN:Bang("!SetOption", "Line" .. i, "LineLength", length)
		SKIN:Bang("!SetOption", "Line" .. i, "X", x0)
		SKIN:Bang("!SetOption", "Line" .. i, "Y", y0)
	end
	
	-- local shapes = {}
	
	-- table.insert(shapes, { x = 0, y = ExtrudeMax })
	-- for i = 1, NumOfLines-2 do
		-- local mband0 = SKIN:GetMeasure("mBand" .. i):GetValue()
		
		-- local a = i
		-- if ClockWise then
			-- a = NumOfLines - i - 1
		-- end
		
		-- local x0 = (Radius + mband0 * math.pow(mband0, Squared) * -Inward * ExtrudeMax) * 
			-- math.cos((AngleTotal - AngleTotal / NumOfLines * a + AngleStart) % PIx2) + Radius + ExtrudeMax
		-- local y0 = (Radius + mband0 * math.pow(mband0, Squared) * -Inward * ExtrudeMax) * 
			-- math.sin((AngleTotal - AngleTotal / NumOfLines * a + AngleStart) % PIx2) + Radius + ExtrudeMax
			
		-- table.insert(shapes, { x = x0, y = y0 })
	-- end
	-- table.insert(shapes, { x = Radius, y = ExtrudeMax })
	
	-- for i = 0, NumOfLines-2 do
		-- -- lua tables start from index 1
		-- local x0 = shapes[i + 1]["x"]
		-- local y0 = shapes[i + 1]["y"]
		-- local x1 = shapes[(i + 1) % NumOfLines + 1]["x"]
		-- local y1 = shapes[(i + 1) % NumOfLines + 1]["y"]
		
		-- angle = math.atan2(y1 - y0, x1 - x0)
		-- length = math.sqrt(math.pow(x1 - x0, 2) + math.pow(y1 - y0, 2))
		-- SKIN:Bang("!SetOption", "Line" .. i, "StartAngle", angle)
		-- SKIN:Bang("!SetOption", "Line" .. i, "LineLength", length)
		-- SKIN:Bang("!SetOption", "Line" .. i, "X", x0)
		-- SKIN:Bang("!SetOption", "Line" .. i, "Y", y0)
	-- end
end