local previous_init = init
local previous_update = update

function init()
  previous_init()

  -- The timer is set to twice the value used by the core engine for
  -- static object status effects.
  self.rlStatusEffectObjectsUpdateTime = 0.3

  self.rlStatusEffectObjectsUpdateTimer = self.rlStatusEffectObjectsUpdateTime
end

function update(dt)
  self.rlStatusEffectObjectsUpdateTimer = self.rlStatusEffectObjectsUpdateTimer - dt
  if self.rlStatusEffectObjectsUpdateTimer <= 0 then
    local entityEffects = jarray()
    if not status.statPositive("statusImmunity") then
      local pos = entity.position()
      local objects = world.objectQuery(pos, 0, {boundMode = "metaboundbox"})
      --sb.logInfo("rl_statuseffectobjects_player_primary: candidate objects in range = %s", sb.printJson(objects))
      for _,obj in ipairs(objects) do
        local activeStatusEffects = world.getObjectParameter(obj, "rlActiveStatusEffects")
        --sb.logInfo("rl_statuseffectobjects_player_primary: object %s name = '%s' rlActiveStatusEffects = '%s'", obj, world.entityName(obj), sb.printJson(activeStatusEffects))
        if activeStatusEffects ~= nil and
           world.polyContains(activeStatusEffects.poly, pos)
        then
          for _,effect in ipairs(activeStatusEffects.effects) do
            table.insert(entityEffects, effect)
          end
        end
      end
    end
    --sb.logInfo("rl_statuseffectobjects_player_primary: entityEffects = %s", sb.printJson(entityEffects))
    status.setPersistentEffects("rlDynamicStatusEffectObjects", entityEffects)

    self.rlStatusEffectObjectsUpdateTimer = self.rlStatusEffectObjectsUpdateTime
  end
end
