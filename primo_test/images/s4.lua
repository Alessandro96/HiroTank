-- This file is for use with Corona(R) SDK
--
-- This file is automatically generated with PhysicsEdtior (http://physicseditor.de). Do not edit
--
-- Usage example:
--			local scaleFactor = 1.0
--			local physicsData = (require "shapedefs").physicsData(scaleFactor)
--			local shape = display.newImage("objectname.png")
--			physics.addBody( shape, physicsData:get("objectname") )
--

-- copy needed functions to local scope
local unpack = unpack
local pairs = pairs
local ipairs = ipairs

local M = {}

function M.physicsData(scale)
	local physics = { data =
	{ 
		
		["s4"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   44, 122  ,  41, 124  ,  42, 122  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   47, 120  ,  44, 122  ,  45, 120  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   50, 118  ,  47, 120  ,  48, 118  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   53, 116  ,  50, 118  ,  51, 116  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   79, 98  ,  75, 101  ,  77, 98  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   299, -104  ,  294, -101  ,  295, -103  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -423, 161  ,  -1000, 500  ,  -430, 159  ,  -426, 159  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -416, 163  ,  -423, 161  ,  -419, 161  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   600, -133  ,  592, -139  ,  597, -137  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1000, 500  ,  902, -33  ,  1000, -35  ,  1000, 500  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   261, -79  ,  256, -75  ,  259, -79  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   75, 101  ,  720, -56  ,  68, 106  ,  70, 103  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -34, 164  ,  -41, 167  ,  -37, 164  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   677, -96  ,  685, -89  ,  716, -58  ,  653, -81  ,  658, -90  ,  664, -95  ,  670, -97  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   703, -85  ,  713, -70  ,  716, -58  ,  685, -89  ,  696, -89  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   102, 80  ,  96, 85  ,  100, 80  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   108, 75  ,  102, 80  ,  106, 75  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   250, -70  ,  244, -65  ,  248, -70  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   256, -75  ,  250, -70  ,  254, -75  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -654, 73  ,  -661, 69  ,  -655, 71  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -647, 77  ,  -1000, 500  ,  -654, 73  ,  -648, 75  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   96, 85  ,  720, -56  ,  87, 92  ,  90, 88  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   306, -108  ,  299, -104  ,  300, -106  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -824, -10  ,  -832, -13  ,  -826, -12  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   87, 92  ,  720, -56  ,  79, 98  ,  81, 95  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   685, -89  ,  677, -96  ,  681, -94  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -907, -34  ,  -877, -29  ,  -834, -15  ,  -832, -13  ,  -1000, 500  ,  -1000, -35  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -406, 166  ,  -416, 163  ,  -412, 163  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -102, 189  ,  -112, 192  ,  -106, 189  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -92, 186  ,  -102, 189  ,  -96, 186  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   560, -159  ,  412, -157  ,  418, -161  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   163, 17  ,  157, 24  ,  157, 22  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   636, -96  ,  563, -156  ,  636, -98  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   412, -157  ,  560, -159  ,  400, -152  ,  404, -155  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -688, 54  ,  -697, 49  ,  -689, 52  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -679, 59  ,  -1000, 500  ,  -688, 54  ,  -680, 57  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -670, 64  ,  -1000, 500  ,  -679, 59  ,  -671, 62  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -661, 69  ,  -670, 64  ,  -662, 67  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -638, 82  ,  -1000, 500  ,  -647, 77  ,  -639, 80  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   315, -113  ,  306, -108  ,  307, -110  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   116, 68  ,  108, 75  ,  114, 68  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   244, -65  ,  236, -58  ,  242, -65  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -543, 122  ,  -1000, 500  ,  -554, 118  ,  -545, 120  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   500, -174  ,  560, -159  ,  421, -161  ,  433, -167  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -809, -4  ,  -824, -10  ,  -818, -9  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   278, -91  ,  261, -79  ,  271, -88  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   172, 7  ,  163, 17  ,  163, 15  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   294, -101  ,  172, 7  ,  172, 5  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -63, 176  ,  -77, 181  ,  -75, 179  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   470, -174  ,  500, -174  ,  441, -168  ,  452, -172  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   592, -139  ,  630, -103  ,  563, -156  ,  584, -146  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -583, 107  ,  -1000, 500  ,  -603, 99  ,  -597, 100  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   560, -159  ,  500, -174  ,  524, -171  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -381, 173  ,  -1000, 500  ,  -406, 166  ,  -391, 169  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -778, 9  ,  -809, -4  ,  -791, 2  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   236, -58  ,  221, -44  ,  234, -58  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   68, 106  ,  720, -56  ,  53, 116  ,  54, 114  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   294, -101  ,  278, -91  ,  279, -93  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   219, -44  ,  221, -44  ,  204, -27  ,  204, -29  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   400, -152  ,  560, -159  ,  375, -142  ,  394, -151  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   41, 124  ,  720, -56  ,  21, 136  ,  22, 134  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   157, 24  ,  294, -101  ,  315, -113  ,  141, 43  ,  141, 41  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -41, 167  ,  -63, 176  ,  -44, 167  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -603, 99  ,  -1000, 500  ,  -630, 86  ,  -627, 86  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   204, -27  ,  181, -3  ,  181, -5  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -554, 118  ,  -1000, 500  ,  -583, 107  ,  -556, 116  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   630, -105  ,  630, -103  ,  600, -133  ,  602, -133  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   630, -103  ,  592, -139  ,  600, -133  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   294, -101  ,  181, -3  ,  236, -58  ,  261, -79  ,  278, -91  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   375, -142  ,  560, -159  ,  563, -156  ,  316, -115  ,  367, -140  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   649, -82  ,  315, -113  ,  316, -115  ,  563, -156  ,  636, -96  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   236, -58  ,  181, -3  ,  204, -27  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -697, 49  ,  -778, 9  ,  -775, 9  ,  -698, 47  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -697, 49  ,  -688, 54  ,  -1000, 500  ,  -832, -13  ,  -778, 9  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   172, 7  ,  294, -101  ,  157, 24  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1000, 500  ,  848, -35  ,  902, -33  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1000, 500  ,  794, -41  ,  848, -35  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1000, 500  ,  -112, 192  ,  720, -56  ,  794, -41  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   315, -113  ,  649, -82  ,  116, 68  ,  141, 43  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   720, -56  ,  96, 85  ,  108, 75  ,  649, -82  ,  653, -81  ,  716, -58  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   649, -82  ,  108, 75  ,  116, 68  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -406, 166  ,  -1000, 500  ,  -423, 161  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -654, 73  ,  -1000, 500  ,  -670, 64  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -630, 86  ,  -1000, 500  ,  -638, 82  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -430, 159  ,  -1000, 500  ,  -543, 122  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -317, 189  ,  -1000, 500  ,  -381, 173  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -237, 205  ,  -1000, 500  ,  -317, 189  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -202, 208  ,  -1000, 500  ,  -237, 205  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -189, 207  ,  -1000, 500  ,  -202, 208  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -144, 200  ,  -1000, 500  ,  -189, 207  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -112, 192  ,  -1000, 500  ,  -144, 200  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   720, -56  ,  75, 101  ,  79, 98  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   720, -56  ,  41, 124  ,  53, 116  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   720, -56  ,  -34, 164  ,  21, 136  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   720, -56  ,  -41, 167  ,  -34, 164  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   720, -56  ,  -63, 176  ,  -41, 167  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   720, -56  ,  -77, 181  ,  -63, 176  }
                    }
                     ,
                    {
                    pe_fixture_id = "s4", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   720, -56  ,  -92, 186  ,  -77, 181  }
                    }
                    
                    
                    
		}
		
	} }

        -- apply scale factor
        local s = scale or 1.0
        for bi,body in pairs(physics.data) do
                for fi,fixture in ipairs(body) do
                    if(fixture.shape) then
                        for ci,coordinate in ipairs(fixture.shape) do
                            fixture.shape[ci] = s * coordinate
                        end
                    else
                        fixture.radius = s * fixture.radius
                    end
                end
        end
	
	function physics:get(name)
		return unpack(self.data[name])
	end

	function physics:getFixtureId(name, index)
                return self.data[name][index].pe_fixture_id
	end
	
	return physics;
end

return M
