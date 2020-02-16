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
	local shapesL = {}
	local shapesR = {}
	local nLines = NumOfLines - 1
	if AngleTotal < PIx2 then
		nLines = nLines + 1
	end
	
	for i = 0, nLines do
		local mband0 = SKIN:GetMeasure("mBandL" .. i):GetValue()
		
		local a = i
		if ClockWise then
			a = nLines - i
		end
		
		local x0 = (Radius + mband0 * math.pow(mband0, Squared) * (-Inward * 2 + 1) * ExtrudeMax) * 
			math.cos((AngleTotal - AngleTotal / NumOfLines * a + AngleStart) % PIx2) + Radius + ExtrudeMax
		local y0 = (Radius + mband0 * math.pow(mband0, Squared) * (-Inward * 2 + 1) * ExtrudeMax) * 
			math.sin((AngleTotal - AngleTotal / NumOfLines * a + AngleStart) % PIx2) + Radius + ExtrudeMax
		table.insert(shapesL, { x = x0, y = y0 })
		
		mband0 = SKIN:GetMeasure("mBandR" .. i):GetValue()
		x0 = (Radius + mband0 * math.pow(mband0, Squared) * (-Inward * 2 + 1) * ExtrudeMax) * 
			math.cos((AngleTotal - AngleTotal / NumOfLines * a + AngleStart) % PIx2) + Radius + ExtrudeMax
		y0 = (Radius + mband0 * math.pow(mband0, Squared) * (-Inward * 2 + 1) * ExtrudeMax) * 
			math.sin((AngleTotal - AngleTotal / NumOfLines * a + AngleStart) % PIx2) + Radius + ExtrudeMax
		table.insert(shapesR, { x = x0, y = y0 })
	end
	
	for i = 0, NumOfLines-1 do
		-- lua tables start from index 1
		local x0 = shapesL[i + 1]["x"]
		local y0 = shapesL[i + 1]["y"]
		local x1 = shapesL[(i + 1) % #shapesL + 1]["x"]
		local y1 = shapesL[(i + 1) % #shapesL + 1]["y"]
		
		angle = math.atan2(y1 - y0, x1 - x0)
		length = math.sqrt(math.pow(x1 - x0, 2) + math.pow(y1 - y0, 2))
		SKIN:Bang("!SetOption", "LineL" .. i, "StartAngle", angle)
		SKIN:Bang("!SetOption", "LineL" .. i, "LineLength", length)
		SKIN:Bang("!SetOption", "LineL" .. i, "X", x0)
		SKIN:Bang("!SetOption", "LineL" .. i, "Y", y0)
		
		x0 = shapesR[i + 1]["x"]
		y0 = shapesR[i + 1]["y"]
		x1 = shapesR[(i + 1) % #shapesR + 1]["x"]
		y1 = shapesR[(i + 1) % #shapesR + 1]["y"]
		
		angle = math.atan2(y1 - y0, x1 - x0)
		length = math.sqrt(math.pow(x1 - x0, 2) + math.pow(y1 - y0, 2))
		SKIN:Bang("!SetOption", "LineR" .. i, "StartAngle", angle)
		SKIN:Bang("!SetOption", "LineR" .. i, "LineLength", length)
		SKIN:Bang("!SetOption", "LineR" .. i, "X", x0)
		SKIN:Bang("!SetOption", "LineR" .. i, "Y", y0)
	end
end