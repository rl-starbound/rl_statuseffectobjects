-- This script must not be included in production versions of objects.
-- It is for debugging only.

require "/objects/scripts/rl_statuseffectobjects_util.lua"
require "/scripts/poly.lua"
require "/scripts/rect.lua"
require "/scripts/util.lua"

local previous_init = init
local previous_update = update

function init()
  if previous_init then previous_init() end

  self.statusEffectArea = rlStatusEffectArea()
  script.setUpdateDelta(1)
  self.debug = true
end

function update(dt)
  if previous_update then previous_update(dt) end

  if self.statusEffectArea then
    world.debugPoly(self.statusEffectArea, "yellow")
    local bb = object.boundBox()
    local center = rect.center(bb)
    --util.debugRect(bb, "yellow")
    world.debugLine({center[1], bb[2]}, {center[1], bb[4]}, "yellow")
    world.debugLine({bb[1], center[2]}, {bb[3], center[2]}, "yellow")
  end
end
