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
		
		["t2"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   877, -36  ,  899, -34  ,  -791, -59  ,  -790, -61  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   877, -36  ,  -787, -61  ,  -786, -63  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   877, -36  ,  -783, -63  ,  -782, -65  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -723, -93  ,  877, -36  ,  -727, -91  ,  -726, -93  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -711, -99  ,  877, -36  ,  -715, -97  ,  -714, -99  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -661, -123  ,  855, -43  ,  877, -36  ,  -665, -121  ,  -664, -123  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   113, -390  ,  -194, -341  ,  108, -392  ,  111, -392  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   899, -34  ,  1000, 500  ,  -1000, 500  ,  -1000, -35  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -124, -372  ,  -131, -369  ,  -127, -372  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -117, -375  ,  -124, -372  ,  -120, -375  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1000, 500  ,  899, -34  ,  1000, -35  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -715, -97  ,  877, -36  ,  -723, -93  ,  -722, -95  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -203, -337  ,  336, -285  ,  360, -274  ,  -212, -333  ,  -206, -337  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194, -341  ,  323, -291  ,  336, -285  ,  -203, -337  ,  -197, -341  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -149, -361  ,  -158, -357  ,  -152, -361  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -140, -365  ,  -149, -361  ,  -143, -365  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -131, -369  ,  -140, -365  ,  -134, -369  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -108, -379  ,  -117, -375  ,  -111, -379  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -99, -383  ,  -108, -379  ,  -102, -383  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   360, -274  ,  -315, -286  ,  -307, -291  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   371, -269  ,  -661, -123  ,  -561, -171  ,  360, -274  ,  363, -274  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -158, -357  ,  106, -394  ,  -176, -349  ,  -168, -354  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   899, -34  ,  -817, -47  ,  -807, -53  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   899, -34  ,  -804, -53  ,  -794, -59  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   336, -285  ,  323, -291  ,  326, -291  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   834, -52  ,  821, -58  ,  824, -58  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -176, -349  ,  106, -394  ,  108, -392  ,  -194, -341  ,  -188, -345  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   155, -371  ,  -194, -341  ,  140, -378  ,  143, -378  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   237, -332  ,  222, -339  ,  225, -339  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   663, -132  ,  -661, -123  ,  651, -139  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   678, -125  ,  -661, -123  ,  666, -132  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   710, -110  ,  695, -117  ,  698, -117  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   725, -103  ,  710, -110  ,  713, -110  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   774, -80  ,  759, -87  ,  762, -87  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   789, -73  ,  774, -80  ,  777, -80  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   821, -58  ,  806, -65  ,  809, -65  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -665, -121  ,  -682, -113  ,  -668, -121  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -356, -267  ,  -373, -259  ,  -359, -267  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   275, -314  ,  258, -322  ,  261, -322  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   439, -237  ,  -661, -123  ,  422, -245  ,  425, -245  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   551, -184  ,  -661, -123  ,  534, -192  ,  537, -192  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   648, -139  ,  -661, -123  ,  634, -147  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   695, -117  ,  -661, -123  ,  681, -125  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   806, -65  ,  789, -73  ,  792, -73  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   222, -339  ,  -194, -341  ,  206, -348  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -55, -401  ,  -28, -406  ,  68, -405  ,  86, -401  ,  106, -394  ,  -72, -394  ,  -70, -396  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   899, -34  ,  -836, -39  ,  -820, -47  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -212, -333  ,  360, -274  ,  -232, -324  ,  -215, -333  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   877, -36  ,  855, -43  ,  871, -39  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   258, -322  ,  237, -332  ,  240, -332  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   296, -304  ,  275, -314  ,  278, -314  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   534, -192  ,  -661, -123  ,  513, -202  ,  516, -202  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   855, -43  ,  834, -52  ,  837, -52  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -72, -394  ,  106, -394  ,  -99, -383  ,  -78, -393  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   178, -360  ,  -194, -341  ,  155, -371  ,  158, -371  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   360, -274  ,  336, -285  ,  339, -285  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -456, -221  ,  -481, -209  ,  -459, -221  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   203, -348  ,  -194, -341  ,  178, -360  ,  181, -360  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   323, -291  ,  296, -304  ,  299, -304  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   140, -378  ,  -194, -341  ,  113, -390  ,  116, -390  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -682, -113  ,  -711, -99  ,  -685, -113  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   468, -223  ,  -661, -123  ,  439, -237  ,  442, -237  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   581, -170  ,  -661, -123  ,  551, -184  ,  554, -184  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -273, -305  ,  360, -274  ,  -304, -291  ,  -276, -305  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   759, -87  ,  725, -103  ,  728, -103  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -481, -209  ,  -519, -191  ,  -484, -209  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -415, -240  ,  -456, -221  ,  -418, -240  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   360, -274  ,  -356, -267  ,  -318, -286  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -232, -324  ,  360, -274  ,  -273, -305  ,  -235, -324  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -519, -191  ,  -561, -171  ,  -522, -191  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -373, -259  ,  -415, -240  ,  -376, -259  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   513, -202  ,  -661, -123  ,  468, -223  ,  471, -223  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   631, -147  ,  -661, -123  ,  581, -170  ,  584, -170  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   422, -245  ,  -661, -123  ,  371, -269  ,  374, -269  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   106, -394  ,  -117, -375  ,  -99, -383  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -561, -171  ,  -661, -123  ,  -564, -171  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   106, -394  ,  -158, -357  ,  -117, -375  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   258, -322  ,  -194, -341  ,  222, -339  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   323, -291  ,  -194, -341  ,  258, -322  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   360, -274  ,  -373, -259  ,  -356, -267  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   360, -274  ,  -481, -209  ,  -373, -259  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   360, -274  ,  -561, -171  ,  -481, -209  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   759, -87  ,  -661, -123  ,  695, -117  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   806, -65  ,  -661, -123  ,  759, -87  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   821, -58  ,  -661, -123  ,  806, -65  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -665, -121  ,  877, -36  ,  -711, -99  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   834, -52  ,  -661, -123  ,  821, -58  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   855, -43  ,  -661, -123  ,  834, -52  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -836, -39  ,  899, -34  ,  -856, -35  }
                    }
                     ,
                    {
                    pe_fixture_id = "t2", density = 2, friction = 12, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   877, -36  ,  -779, -65  ,  -727, -91  }
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

