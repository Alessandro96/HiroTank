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
                    pe_fixture_id = "", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -51.5, -13  ,  -37.5, -12  ,  -47.5, 9  ,  -64.5, 10  ,  -68.5, 7  ,  -70.5, -13  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -75.5, 19  ,  -69.5, 13  ,  -45.5, 11  ,  -66.5, 25  ,  -80.5, 26  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -45.5, 11  ,  31.5, -15  ,  40.5, -15  ,  5.5, 25  ,  -66.5, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   19.5, -15  ,  12.5, -18  ,  13.5, -23  ,  15.5, -24  ,  19.5, -23  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   72.5, 25  ,  60.5, 12  ,  72.5, 13  ,  82.5, 22  ,  82.5, 26  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   45.5, 25  ,  26.5, 24  ,  47.5, 11  ,  60.5, 12  ,  72.5, 25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   52.5, 2  ,  51.5, 7  ,  47.5, 11  ,  26.5, 24  ,  5.5, 25  ,  40.5, -15  ,  49.5, -9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   15.5, -24  ,  13.5, -23  ,  14.5, -24  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -8.5, -20  ,  12.5, -18  ,  19.5, -15  ,  -47.5, 9  ,  -37.5, -12  ,  -27.5, -20  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   12.5, -18  ,  -8.5, -20  ,  7.5, -21  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0.8, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   31.5, -15  ,  -45.5, 11  ,  -47.5, 9  ,  19.5, -15  }
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

