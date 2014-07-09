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

if CLIENT then
	game.AddParticles("particles/explosion.pcf")
	game.AddParticles("particles/bigboom.pcf")
	game.AddParticles("particles/dirty_explodepcf")
	game.AddParticles("particles/eyeboss.pcf")
	game.AddParticles("particles/rockettrail.pcf")
end

pk_pills.packStart("Team Fortress 2","tf2","games/16/tf.png")
pk_pills.packRequireGame("Team Fortress 2",440)

include("include/pill_tf_sentry.lua")
include("include/pill_tf_robots.lua")
include("include/pill_tf_spooky.lua")

include("include/pill_tf_cutouts.lua")
include("include/pill_tf_classes.lua")

include("include/pill_tf_fun.lua")

pk_pills.packFinalize()

/*
pk_pills.addFiles{
	"models/birdbrainswagtrain/zombie/zombine_frame.mdl",
	"models/birdbrainswagtrain/episodic/floor_turret.mdl",
	"models/birdbrainswagtrain/episodic/roller.mdl",
	"models/birdbrainswagtrain/episodic/roller_spikes.mdl"
}

pk_pills.addIcons{
	"pill_wep_magnade",
	"pill_wep_csniper"
}
*/
pk_pills.addWorkshop("258248317")
