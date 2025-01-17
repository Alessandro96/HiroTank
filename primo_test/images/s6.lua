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
		
		["s6"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -792, -74  ,  -795, -69  ,  -796, -73  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   754, 109  ,  1000, 500  ,  751, 111  ,  752, 109  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   843, 35  ,  841, 38  ,  841, 36  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -267, 44  ,  -271, 41  ,  -269, 41  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   846, 31  ,  843, 35  ,  843, 33  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770, -90  ,  -764, -90  ,  -756, -80  ,  -777, -79  ,  -776, -85  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -404, -86  ,  -409, -89  ,  -405, -88  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -201, 90  ,  -926, -35  ,  -206, 87  ,  -202, 88  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   732, 123  ,  1000, 500  ,  727, 126  ,  728, 124  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -777, -79  ,  -795, -69  ,  -792, -74  ,  -787, -80  ,  -782, -81  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -795, -69  ,  -246, 60  ,  -802, -67  ,  -799, -69  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -738, -85  ,  -262, 48  ,  -246, 60  ,  -745, -83  ,  -742, -85  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -802, -67  ,  -246, 60  ,  -813, -64  ,  -810, -67  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1000, -35  ,  -926, -35  ,  -75, 150  ,  1000, 500  ,  -1000, 500  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -262, 48  ,  -267, 44  ,  -265, 44  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   796, 79  ,  1000, 500  ,  791, 83  ,  794, 79  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   801, 75  ,  1000, 500  ,  796, 79  ,  799, 75  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   820, 60  ,  1000, 500  ,  815, 64  ,  818, 60  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -239, 65  ,  -926, -35  ,  -910, -37  ,  -246, 60  ,  -241, 62  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -379, -67  ,  -389, -75  ,  -383, -72  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   751, 111  ,  1000, 500  ,  745, 115  ,  746, 113  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -373, -62  ,  -379, -67  ,  -377, -67  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -333, -20  ,  -338, -26  ,  -333, -22  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   826, 55  ,  1000, 500  ,  820, 60  ,  824, 55  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -184, 100  ,  -926, -35  ,  -191, 96  ,  -185, 98  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -177, 104  ,  -926, -35  ,  -184, 100  ,  -178, 102  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   705, 138  ,  1000, 500  ,  697, 141  ,  699, 139  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -756, -80  ,  -246, 60  ,  -795, -69  ,  -777, -79  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   622, 160  ,  1000, 500  ,  611, 162  ,  616, 160  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   633, 158  ,  1000, 500  ,  622, 160  ,  627, 158  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -191, 96  ,  -926, -35  ,  -201, 90  ,  -197, 91  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -389, -75  ,  -404, -86  ,  -396, -82  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -288, 27  ,  -296, 20  ,  -294, 20  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -206, 87  ,  -926, -35  ,  -217, 80  ,  -213, 81  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -899, -40  ,  -246, 60  ,  -910, -37  ,  -907, -39  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -888, -43  ,  -246, 60  ,  -899, -40  ,  -896, -42  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -877, -46  ,  -246, 60  ,  -888, -43  ,  -885, -45  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -745, -83  ,  -246, 60  ,  -756, -80  ,  -753, -82  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   745, 115  ,  1000, 500  ,  732, 123  ,  736, 119  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   950, -35  ,  1000, -35  ,  1000, 500  ,  841, 38  ,  846, 31  ,  891, -10  ,  927, -31  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -75, 150  ,  -926, -35  ,  -77, 148  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -326, -11  ,  -333, -20  ,  -326, -13  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -319, -2  ,  -738, -85  ,  -409, -89  ,  -319, -4  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   915, -24  ,  891, -10  ,  904, -20  ,  912, -24  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   868, 8  ,  846, 31  ,  846, 29  ,  858, 16  ,  866, 8  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -229, 72  ,  -239, 65  ,  -237, 65  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -125, 130  ,  -138, 124  ,  -135, 124  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -164, 111  ,  -926, -35  ,  -177, 104  ,  -165, 109  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -612, -119  ,  -413, -93  ,  -627, -115  ,  -624, -117  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -111, 136  ,  -125, 130  ,  -122, 130  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   891, -10  ,  846, 31  ,  868, 8  ,  884, -7  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -217, 80  ,  -229, 72  ,  -227, 72  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   697, 141  ,  1000, 500  ,  678, 148  ,  691, 142  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -491, -126  ,  -453, -113  ,  -413, -93  ,  -612, -119  ,  -589, -125  ,  -553, -133  ,  -522, -132  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   815, 64  ,  1000, 500  ,  801, 75  ,  813, 64  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   791, 83  ,  1000, 500  ,  772, 97  ,  786, 85  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -589, -125  ,  -612, -119  ,  -594, -125  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -246, 60  ,  -262, 48  ,  -260, 48  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -271, 41  ,  -288, 27  ,  -286, 27  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   772, 97  ,  1000, 500  ,  754, 109  ,  755, 107  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   727, 126  ,  1000, 500  ,  705, 138  ,  706, 136  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -553, -133  ,  -589, -125  ,  -564, -132  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -86, 146  ,  -111, 136  ,  -108, 136  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -338, -28  ,  -338, -26  ,  -373, -62  ,  -371, -62  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -813, -64  ,  -246, 60  ,  -877, -46  ,  -853, -54  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -413, -93  ,  -409, -89  ,  -738, -85  ,  -707, -95  ,  -627, -115  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   846, 31  ,  841, 38  ,  843, 35  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -389, -75  ,  -373, -62  ,  -338, -26  ,  -326, -11  ,  -409, -89  ,  -404, -86  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   399, 187  ,  1000, 500  ,  330, 191  ,  347, 189  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1000, 500  ,  826, 55  ,  841, 38  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -262, 48  ,  -738, -85  ,  -271, 41  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -296, 20  ,  -738, -85  ,  -319, -2  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -288, 27  ,  -738, -85  ,  -296, 20  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -271, 41  ,  -738, -85  ,  -288, 27  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1000, 500  ,  633, 158  ,  678, 148  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1000, 500  ,  569, 169  ,  611, 162  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1000, 500  ,  489, 179  ,  569, 169  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1000, 500  ,  399, 187  ,  489, 179  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1000, 500  ,  256, 192  ,  330, 191  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1000, 500  ,  127, 190  ,  256, 192  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1000, 500  ,  47, 181  ,  127, 190  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1000, 500  ,  -4, 171  ,  47, 181  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -229, 72  ,  -926, -35  ,  -239, 65  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -217, 80  ,  -926, -35  ,  -229, 72  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -138, 124  ,  -926, -35  ,  -164, 111  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -125, 130  ,  -926, -35  ,  -138, 124  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -111, 136  ,  -926, -35  ,  -125, 130  }
                    }
                     ,
                    {
                    pe_fixture_id = "s6", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -86, 146  ,  -926, -35  ,  -111, 136  }
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

