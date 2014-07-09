AddCSLuaFile()

SWEP.Base = "pktfw_base_melee"
SWEP.Category = "Pill Pack Weapons - TF2"
SWEP.Spawnable=true
SWEP.AdminSpawnable=true

SWEP.PrintName="Knife"
SWEP.WorldModel = "models/weapons/w_models/w_knife.mdl"

SWEP.damage = 40
SWEP.damage_type = DMG_SLASH
SWEP.sound_swing = "weapons/knife_swing.wav"
SWEP.sound_hit = "weapons/blade_hit1.wav"

function SWEP:Initialize()
	self:SetHoldType("knife")
end