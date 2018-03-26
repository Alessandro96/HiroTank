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
		
		["s2"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   264, 24  ,  261, 26  ,  262, 24  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   342, -22  ,  485, -2  ,  560, 20  ,  339, -20  ,  340, -22  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -84, 178  ,  -98, 182  ,  -92, 176  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -766, 17  ,  -1000, 500  ,  -771, 15  ,  -768, 15  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -761, 19  ,  -1000, 500  ,  -766, 17  ,  -763, 17  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   261, 26  ,  257, 29  ,  259, 26  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -65, 173  ,  -63, 177  ,  -63, 182  ,  -78, 169  ,  -77, 167  ,  -71, 167  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   289, 8  ,  621, 39  ,  673, 55  ,  284, 11  ,  285, 9  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   868, -23  ,  863, -20  ,  864, -22  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -875, -21  ,  -1000, 500  ,  -882, -23  ,  -878, -23  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -80, 169  ,  -78, 169  ,  -63, 182  ,  -84, 178  ,  -83, 172  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   257, 29  ,  673, 55  ,  715, 64  ,  250, 34  ,  252, 31  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -727, 33  ,  -1000, 500  ,  -734, 30  ,  -731, 30  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   715, 64  ,  214, 62  ,  218, 57  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   176, 95  ,  178, 95  ,  172, 101  ,  172, 99  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   797, 50  ,  999, 500  ,  790, 54  ,  791, 52  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -779, 12  ,  -1000, 500  ,  -787, 9  ,  -781, 10  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -771, 15  ,  -1000, 500  ,  -779, 12  ,  -773, 13  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   888, -32  ,  829, 19  ,  829, 17  ,  837, 8  ,  868, -23  ,  876, -29  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -697, 46  ,  -1000, 500  ,  -706, 42  ,  -703, 42  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -688, 50  ,  -1000, 500  ,  -697, 46  ,  -694, 46  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -668, 59  ,  -1000, 500  ,  -677, 55  ,  -674, 55  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   137, 137  ,  130, 143  ,  135, 137  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   715, 64  ,  207, 68  ,  212, 62  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   301, 1  ,  560, 20  ,  621, 39  ,  289, 8  ,  295, 3  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   355, -30  ,  382, -29  ,  457, -12  ,  485, -2  ,  342, -22  ,  349, -28  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   250, 34  ,  236, 44  ,  242, 38  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   310, -4  ,  560, 20  ,  301, 1  ,  302, -1  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   319, -9  ,  560, 20  ,  310, -4  ,  311, -6  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   339, -20  ,  560, 20  ,  330, -15  ,  331, -17  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -677, 55  ,  -1000, 500  ,  -688, 50  ,  -685, 50  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   999, 500  ,  888, -32  ,  890, -34  ,  1000, -35  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -787, 9  ,  -1000, 500  ,  -798, 5  ,  -789, 7  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -931, -35  ,  -907, -31  ,  -882, -23  ,  -1000, 500  ,  -1000, -35  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   207, 68  ,  198, 76  ,  205, 68  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   130, 143  ,  746, 66  ,  121, 149  ,  122, 147  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   829, 19  ,  888, -32  ,  822, 28  ,  822, 26  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   929, -35  ,  890, -34  ,  910, -37  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   782, 58  ,  999, 500  ,  768, 63  ,  776, 59  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   330, -15  ,  560, 20  ,  319, -9  ,  320, -11  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -655, 65  ,  -1000, 500  ,  -668, 59  ,  -665, 59  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -63, 182  ,  999, 500  ,  -98, 182  ,  -84, 178  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -798, 5  ,  -1000, 500  ,  -812, 0  ,  -800, 3  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   845, -3  ,  863, -20  ,  868, -23  ,  837, 8  ,  837, 6  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   599, 32  ,  583, 27  ,  587, 27  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   863, -20  ,  845, -3  ,  845, -5  ,  859, -19  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   809, 41  ,  999, 500  ,  797, 50  ,  807, 41  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382, -29  ,  355, -30  ,  356, -32  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -547, 112  ,  -1000, 500  ,  -572, 104  ,  -562, 106  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   284, 11  ,  264, 24  ,  280, 12  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   236, 44  ,  220, 57  ,  234, 44  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   621, 39  ,  599, 32  ,  603, 32  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -525, 118  ,  -1000, 500  ,  -547, 112  ,  -528, 116  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -706, 42  ,  -1000, 500  ,  -727, 33  ,  -724, 33  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   583, 27  ,  560, 20  ,  564, 20  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   172, 101  ,  715, 64  ,  153, 121  ,  153, 119  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   198, 76  ,  178, 95  ,  196, 76  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -734, 30  ,  -1000, 500  ,  -761, 19  ,  -738, 27  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -572, 104  ,  -1000, 500  ,  -599, 92  ,  -596, 92  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   715, 64  ,  673, 55  ,  702, 60  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   560, 20  ,  485, -2  ,  525, 8  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -138, 180  ,  999, 500  ,  -237, 170  ,  -191, 173  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   250, 34  ,  715, 64  ,  220, 57  ,  236, 44  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   673, 55  ,  621, 39  ,  625, 39  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   284, 11  ,  673, 55  ,  257, 29  ,  261, 26  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -599, 92  ,  -1000, 500  ,  -655, 65  ,  -652, 65  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -812, 0  ,  -1000, 500  ,  -875, -21  ,  -871, -21  ,  -814, -2  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   207, 68  ,  715, 64  ,  172, 101  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -525, 118  ,  999, 500  ,  -1000, 500  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   715, 64  ,  746, 66  ,  137, 137  ,  153, 121  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   746, 66  ,  130, 143  ,  137, 137  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   888, -32  ,  999, 500  ,  809, 41  ,  822, 28  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   746, 66  ,  85, 161  ,  121, 149  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   768, 63  ,  999, 500  ,  37, 172  ,  85, 161  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   999, 500  ,  782, 58  ,  790, 54  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   999, 500  ,  -12, 179  ,  37, 172  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   999, 500  ,  -54, 182  ,  -12, 179  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   999, 500  ,  -63, 182  ,  -54, 182  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   999, 500  ,  -138, 180  ,  -98, 182  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   999, 500  ,  -292, 164  ,  -237, 170  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   999, 500  ,  -376, 151  ,  -292, 164  }
                    }
                     ,
                    {
                    pe_fixture_id = "s2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   999, 500  ,  -457, 135  ,  -376, 151  }
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
