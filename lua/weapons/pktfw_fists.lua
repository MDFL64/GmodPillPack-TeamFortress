AddCSLuaFile()

SWEP.Base = "pktfw_base_melee"
SWEP.Category = "Pill Pack Weapons - TF2"
SWEP.Spawnable=true
SWEP.AdminSpawnable=true

SWEP.PrintName="Fists"
SWEP.WorldModel = ""

SWEP.damage_type = DMG_CLUB
SWEP.sound_hit = "weapons/fist_hit_world2.wav"

function SWEP:Initialize()
	self:SetHoldType("fist")
end