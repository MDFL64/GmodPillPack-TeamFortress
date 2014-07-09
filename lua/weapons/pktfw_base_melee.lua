AddCSLuaFile()

SWEP.ViewModel = "models/weapons/c_arms_citizen.mdl"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo		= "none"
 
SWEP.Secondary.ClipSize	= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

SWEP.Slot=0

SWEP.interval = .8
SWEP.damage = 65
SWEP.sound_swing = "weapons/iceaxe/iceaxe_swing1.wav"
SWEP.sound_hit = "weapons/cbar_hitbod1.wav"

function SWEP:Initialize()
	self:SetHoldType("melee")
end

function SWEP:PrimaryAttack()
	local range = 50
	local dmg = self.damage
	local dmg_type = self.damage_type
	
	timer.Simple(self.interval*.25,function()
		if IsValid(self) and IsValid(self.Owner) then
			if self.Owner:TraceHullAttack(self.Owner:GetShootPos(),self.Owner:GetShootPos()+self.Owner:EyeAngles():Forward()*range, Vector(-5,-5,-5), Vector(5,5,5), dmg, dmg_type, dmg/100, true) then
				self:EmitSound(self.sound_hit)
			end
		end
	end)

	if SERVER then
		self:EmitSound(self.sound_swing)
	end
	
	self.Owner:SetAnimation(PLAYER_ATTACK1)

	self:SetNextPrimaryFire(CurTime() + self.interval)
end

function SWEP:SecondaryAttack()

end

function SWEP:Reload()

end