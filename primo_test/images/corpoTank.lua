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
		
		["corpoTank"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "corpoTank", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -14, 34  ,  -10, 38  ,  -18, 38  }
                    }
                     ,
                    {
                    pe_fixture_id = "corpoTank", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   30, 38  ,  25, 38  ,  27, 10  ,  28, 5  ,  31, 5  }
                    }
                     ,
                    {
                    pe_fixture_id = "corpoTank", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   84, 38  ,  82, 29  ,  89, 30  ,  97, 38  }
                    }
                     ,
                    {
                    pe_fixture_id = "corpoTank", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -12, 31  ,  -9, 29  ,  3, 29  ,  -1, 38  ,  -10, 38  ,  -14, 34  }
                    }
                     ,
                    {
                    pe_fixture_id = "corpoTank", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   84, 38  ,  68, 38  ,  71, 27  ,  82, 29  }
                    }
                     ,
                    {
                    pe_fixture_id = "corpoTank", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   89, 14  ,  90, 21  ,  87, 25  ,  71, 27  ,  75, 11  ,  88, 11  }
                    }
                     ,
                    {
                    pe_fixture_id = "corpoTank", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   71, 27  ,  67, 10  ,  75, 11  }
                    }
                     ,
                    {
                    pe_fixture_id = "corpoTank", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3, 29  ,  8, 28  ,  21, 38  ,  -1, 38  }
                    }
                     ,
                    {
                    pe_fixture_id = "corpoTank", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   17, 10  ,  22, 10  ,  21, 38  ,  8, 28  ,  6, 25  ,  5, 20  ,  6, 15  ,  10, 11  }
                    }
                     ,
                    {
                    pe_fixture_id = "corpoTank", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   71, 27  ,  34, 38  ,  30, 38  ,  41, 7  ,  61, 7  ,  67, 10  }
                    }
                     ,
                    {
                    pe_fixture_id = "corpoTank", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   41, 7  ,  30, 38  ,  31, 9  ,  33, 7  }
                    }
                     ,
                    {
                    pe_fixture_id = "corpoTank", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   27, 10  ,  25, 38  ,  21, 38  ,  22, 10  }
                    }
                     ,
                    {
                    pe_fixture_id = "corpoTank", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   43, 38  ,  71, 27  ,  68, 38  }
                    }
                     ,
                    {
                    pe_fixture_id = "corpoTank", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   34, 38  ,  71, 27  ,  43, 38  }
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

