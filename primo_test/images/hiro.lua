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
		
		["hiro"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -225.5, 17.5  ,  -209.5, 3.5  ,  -178.5, 55.5  ,  -186.5, 65.5  ,  -201.5, 71.5  ,  -212.5, 61.5  ,  -229.5, 39.5  ,  -233.5, 27.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -4.5, -170.5  ,  26.5, -136.5  ,  51.5, -61.5  ,  52.5, -34.5  ,  -55.5, -169.5  ,  -47.5, -184.5  ,  -23.5, -187.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   219.5, 56.5  ,  223.5, 70.5  ,  200.5, 110.5  ,  181.5, 73.5  ,  201.5, 55.5  ,  212.5, 52.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -164.5, 180.5  ,  -130.5, 104.5  ,  90.5, 118.5  ,  18.5, 146.5  ,  -118.5, 188.5  ,  -143.5, 188.5  ,  -166.5, 187.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   48.5, -152.5  ,  59.5, -146.5  ,  64.5, -139.5  ,  67.5, -132.5  ,  64.5, -109.5  ,  51.5, -61.5  ,  26.5, -136.5  ,  37.5, -151.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -201.5, 71.5  ,  -186.5, 65.5  ,  -195.5, 72.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -196.5, 108.5  ,  -179.5, 107.5  ,  -207.5, 131.5  ,  -207.5, 117.5  ,  -202.5, 110.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -179.5, 107.5  ,  -161.5, 107.5  ,  -206.5, 163.5  ,  -208.5, 148.5  ,  -207.5, 131.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -72.5, 189.5  ,  -95.5, 189.5  ,  -59.5, 185.5  ,  -57.5, 188.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -222.5, -56.5  ,  -193.5, -51.5  ,  -209.5, 3.5  ,  -239.5, 0.5  ,  -240.5, -28.5  ,  -237.5, -47.5  ,  -235.5, -53.5  ,  -232.5, -56.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -139.5, -182.5  ,  -127.5, -186.5  ,  -112.5, -184.5  ,  -102.5, -180.5  ,  -152.5, -151.5  ,  -151.5, -168.5  ,  -147.5, -176.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   238.5, 110.5  ,  229.5, 111.5  ,  215.5, 109.5  ,  239.5, 89.5  ,  242.5, 108.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   215.5, 109.5  ,  200.5, 110.5  ,  223.5, 70.5  ,  237.5, 70.5  ,  240.5, 73.5  ,  239.5, 89.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -44.5, 185.5  ,  18.5, 146.5  ,  -5.5, 187.5  ,  -42.5, 189.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -202.5, -131.5  ,  -196.5, -137.5  ,  -185.5, -144.5  ,  -173.5, -148.5  ,  -152.5, -151.5  ,  -193.5, -92.5  ,  -206.5, -111.5  ,  -206.5, -121.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -175.5, 54.5  ,  -55.5, -169.5  ,  -134.5, 67.5  ,  -144.5, 69.5  ,  -160.5, 65.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   200.5, 110.5  ,  186.5, 111.5  ,  152.81817626953125, 111.36363983154297  ,  143.5, 75.5  ,  181.5, 73.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   138.5, 112.5  ,  125.54544067382812, 112.5  ,  81.5, 75.5  ,  143.5, 75.5  ,  152.81817626953125, 111.36363983154297  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   54.5, 150.5  ,  18.5, 146.5  ,  90.5, 118.5  ,  85.5, 137.5  ,  80.5, 142.5  ,  70.5, 148.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -102.5, -180.5  ,  -193.5, -51.5  ,  -199.5, -60.5  ,  -201.5, -66.5  ,  -200.5, -81.5  ,  -197.5, -88.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   22.5, 77.5  ,  56.5, 18.5  ,  61.5, 34.5  ,  60.5, 43.5  ,  47.5, 61.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   125.54544067382812, 112.5  ,  65.5, 76.5  ,  81.5, 75.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -201.5, 187.5  ,  -205.5, 177.5  ,  -206.5, 163.5  ,  -161.5, 107.5  ,  -144.5, 105.5  ,  -130.5, 104.5  ,  -166.5, 177.5  ,  -188.5, 187.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   61.5, 187.5  ,  58.5, 174.5  ,  63.5, 187.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   46.5, 188.5  ,  31.5, 187.5  ,  44.5, 157.5  ,  58.5, 174.5  ,  61.5, 187.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -5.5, 187.5  ,  18.5, 146.5  ,  34.5, 151.5  ,  44.5, 157.5  ,  31.5, 187.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -206.5, -111.5  ,  -193.5, -92.5  ,  -203.5, -103.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -102.5, -180.5  ,  -193.5, -92.5  ,  -152.5, -151.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -205.5, 177.5  ,  -201.5, 187.5  ,  -203.5, 185.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   125.54544067382812, 112.5  ,  114.5, 112.5  ,  22.5, 77.5  ,  45.5, 76.5  ,  65.5, 76.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   53.5, -0.5  ,  22.5, 77.5  ,  -123.5, 75.5  ,  -127.5, 70.5  ,  -55.5, -169.5  ,  52.5, -34.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   56.5, 18.5  ,  53.5, -0.5  ,  54.5, -17.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   22.5, 77.5  ,  53.5, -0.5  ,  56.5, 18.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -239.5, 0.5  ,  -209.5, 3.5  ,  -237.5, 3.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -193.5, -51.5  ,  -102.5, -180.5  ,  -92.5, -179.5  ,  -75.5, -173.5  ,  -178.5, 55.5  ,  -209.5, 3.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -59.5, 185.5  ,  18.5, 146.5  ,  -44.5, 185.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -95.5, 189.5  ,  -118.5, 188.5  ,  18.5, 146.5  ,  -59.5, 185.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -123.5, 75.5  ,  22.5, 77.5  ,  102.5, 113.5  ,  90.5, 118.5  ,  -130.5, 104.5  ,  -130.5, 96.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -55.5, -169.5  ,  -175.5, 54.5  ,  -178.5, 55.5  ,  -75.5, -173.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -130.5, 104.5  ,  -164.5, 180.5  ,  -166.5, 177.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   102.5, 113.5  ,  22.5, 77.5  ,  114.5, 112.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 0, friction = 0, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -134.5, 67.5  ,  -55.5, -169.5  ,  -127.5, 70.5  }
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

