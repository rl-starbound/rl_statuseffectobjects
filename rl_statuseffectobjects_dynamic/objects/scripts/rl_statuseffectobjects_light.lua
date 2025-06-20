require "/objects/scripts/rl_statuseffectobjects_util.lua"

local previous_setLightState = setLightState

function setLightState(newState)
  previous_setLightState(newState)

  if storage.state then
    if self.rlDynamicStatusEffectArea == nil then
      self.rlDynamicStatusEffectArea = rlStatusEffectArea()
    end
    object.setConfigParameter("rlActiveStatusEffects", {
      effects = config.getParameter("rlDynamicStatusEffects", {}),
      poly = self.rlDynamicStatusEffectArea
    })
  else
    object.setConfigParameter("rlActiveStatusEffects", nil)
  end
end
