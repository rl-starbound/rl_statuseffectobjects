require "/scripts/poly.lua"
require "/scripts/rect.lua"

function rlStatusEffectArea()
  -- The core engine does not expose object orientation to the Lua API,
  -- so we have to guess which orientation is in use based on the meta
  -- bounding box and the object direction. Orientations with the same
  -- meta bounding box and object direction should have compatible
  -- status effect areas.
  local pos = entity.position()
  local metaBB = object.boundBox()

  local direction = object.direction()
  if direction == -1 then
    direction = "left"
  elseif direction == 1 then
    direction = "right"
  else
    direction = nil
  end

  local orientations = config.getParameter("orientations", {})
  for _,orientation in ipairs(orientations) do
    if orientation.metaBoundBox then
      local oMetaBB = rect.translate(orientation.metaBoundBox, pos)
      if oMetaBB[1] == metaBB[1] and oMetaBB[2] == metaBB[2] and
         oMetaBB[3] == metaBB[3] and oMetaBB[4] == metaBB[4]
      then
        if not orientation.direction or orientation.direction == direction then
          if orientation.statusEffectArea then
            return poly.translate(orientation.statusEffectArea, pos)
          end
        end
      end
    end
  end

  -- Fall back to the bounding box around the object's collision poly,
  -- like the core engine does for an undefined statusEffectArea.
  local spaces = object.spaces()
  if #spaces < 1 then spaces = {{0, 0}} end
  local a = poly.boundBox(spaces)
  a[3] = a[3] + 1
  a[4] = a[4] + 1
  local p = {{a[1], a[2]}, {a[1], a[4]}, {a[3], a[4]}, {a[3], a[2]}}
  return poly.translate(p, pos)
end
