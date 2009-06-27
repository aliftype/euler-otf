fnt_name = "eurm10"

--fnt = font.read_tfm(fnt_name, 10)
for n,f in font.each() do
	if f.name == fnt_name then
		fnt = f
	end
end

local function round(num)
	return tonumber(string.format("%." .. "f", num))
end

local function to_em_unit(num)
--	return (num/65536)*100 -- sp -> pt -> em unit of 10pt font
	return round((num*fnt.designsize*10)/(65536^2))
end

local function get_math_param(name, style)
	return to_em_unit(tex.getmath(name, style))
end

local function output(text)
	file:write(text)
end

font_parameters = {
	AccentBaseHeight			= "x_height",
}

math_parameters = {
	AxisHeight				= {axis = "display"},
--	DisplayOperatorMinHeight		= {operatorsize = "display"}, -- useless
	FractionDenominatorDisplayStyleShiftDown= {fractiondenomdown = "display"},
	FractionDenominatorShiftDown		= {fractiondenomdown = "text"},
	FractionDenominatorDisplayStyleGapMin	= {fractiondenomvgap = "display"},
	FractionDenominatorGapMin		= {fractiondenomvgap = "text"},
	FractionNumeratorDisplayStyleShiftUp	= {fractionnumup = "display"},
	FractionNumeratorShiftUp		= {fractionnumup = "text"},
	FractionNumeratorDisplayStyleGapMin	= {fractionnumvgap = "display"},
	FractionNumeratorGapMin			= {fractionnumvgap = "text"},
	FractionRuleThickness			= {fractionrule = "display"},
	UpperLimitBaselineRiseMin		= {limitabovebgap = "display"},
	UpperLimitGapMin			= {limitabovevgap = "display"},
	LowerLimitBaselineDropMin		= {limitbelowbgap = "display"},
	LowerLimitGapMin			= {limitbelowvgap = "display"},
	StretchStackGapBelowMin			= {overdelimitervgap = "display"},
	StretchStackTopShiftUp			= {overdelimiterbgap = "display"},
	StretchStackGapAboveMin			= {underdelimitervgap = "display"},
	StretchStackBottomShiftDown		= {underdelimiterbgap = "display"},
	OverbarExtraAscender			= {overbarkern = "display"},
	OverbarRuleThickness			= {overbarrule = "display"},
	OverbarVerticalGap			= {overbarvgap = "display"},
	RadicalExtraAscender			= {radicalkern = "display"},
	RadicalRuleThickness			= {overbarrule = "display"}, --radicalrule is not initialized
	RadicalDisplayStyleVerticalGap		= {radicalvgap = "display"},
	RadicalVerticalGap			= {radicalvgap = "text"},
	RadicalKernBeforeDegree			= {radicaldegreebefore = "display"},
	RadicalKernAfterDegree			= {radicaldegreeafter = "display"},
	RadicalDegreeBottomRaisePercent		= {radicaldegreeraise = "display"},
	SpaceAfterScript			= {spaceafterscript = "display"},
	StackBottomDisplayStyleShiftDown	= {stackdenomdown = "display"},
	StackBottomShiftDown			= {stackdenomdown = "text"},
	StackTopDisplayStyleShiftUp		= {stacknumup = "display"},
	StackTopShiftUp				= {stacknumup = "text"},
	StackDisplayStyleGapMin			= {stackvgap = "display"},
	StackGapMin				= {stackvgap = "text"},
	SubscriptShiftDown			= {subshiftdown = "display"},
	SubscriptBaselineDropMin		= {subshiftdrop = "display"},
	SubscriptTopMax				= {subtopmax = "display"},
	SubSuperscriptGapMin			= {subsupvgap = "display"},
	SuperscriptBottomMin			= {supbottommin = "display"},
	SuperscriptBaselineDropMax		= {supshiftdrop = "display"},
	SuperscriptShiftUp			= {supshiftup = "display"},
	SuperscriptShiftUp			= {supshiftup = "text"},
	SuperscriptShiftUpCramped		= {supshiftup = "crampeddisplay"},
	SuperscriptBottomMaxWithSubscript	= {supsubbottommax = "display"},
	UnderbarExtraDescender			= {underbarkern = "display"},
	UnderbarRuleThickness			= {underbarrule = "display"},
	UnderbarVerticalGap			= {underbarvgap = "display"},
	MinConnectorOverlap			= {connectoroverlapmin = "display"},
}


file = io.open("parameters.txt", "w+")

for omath, tmath in pairs(math_parameters) do
	for name, style in pairs(tmath) do
		--print(omath, name, style)
		--print(omath .. ": " .. get_math_param(name, style))
		output("MATH:"..omath..": "..get_math_param(name, style).." \n")
	end
end

for k,v in pairs(font_parameters) do
	output("MATH:"..k..": "..to_em_unit(fnt.parameters[v]).." \n")
end

--output("MATH:DisplayOperatorMinHeight: "..to_em_unit(tex.dp[0]).." \n")

file:close()
