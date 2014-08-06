--------------------------
-- BOOTSTRAP CODE START --
--------------------------

if !pcall(require,"pk_pills") then
	if SERVER then
		hook.Add("PlayerInitialSpawn","pk_pill_extfail_cl",function(ply)
			if game.SinglePlayer() || ply:IsListenServerHost() then
				ply:SendLua('notification.AddLegacy("One or more pill extensions failed to load. Did you forget to install Parakeet\'s Pill Pack?",NOTIFY_ERROR,30)')
			end
		end)
		hook.Add("Initialize","pk_pill_extfail_sv",function(ply)
			print("[ALERT] One or more pill extensions failed to load. Did you forget to install Parakeet's Pill Pack?")
		end)
	end
	return
end

------------------------
-- BOOTSTRAP CODE END --
------------------------

AddCSLuaFile()

if SERVER then
	resource.AddWorkshop("258248317")
else
	game.AddParticles("particles/explosion.pcf")
	game.AddParticles("particles/bigboom.pcf")
	game.AddParticles("particles/dirty_explodepcf")

	PrecacheParticleSystem("fireSmokeExplosion")
	PrecacheParticleSystem("cinefx_goldrush")
	PrecacheParticleSystem("ExplosionCore_MidAir")

	game.AddParticles("particles/eyeboss.pcf")
	PrecacheParticleSystem("eyeboss_projectile")
	
	game.AddParticles("particles/rockettrail.pcf")
	PrecacheParticleSystem("critical_rocket_red")
	PrecacheParticleSystem("critical_rocket_blue")
end

pk_pills.packStart("Team Fortress 2","tf2","games/16/tf.png")
pk_pills.packRequireGame("Team Fortress 2",440)

include("include/pill_tf_sentry.lua")
include("include/pill_tf_robots.lua")
include("include/pill_tf_spooky.lua")

include("include/pill_tf_cutouts.lua")
include("include/pill_tf_classes.lua")

include("include/pill_tf_fun.lua")