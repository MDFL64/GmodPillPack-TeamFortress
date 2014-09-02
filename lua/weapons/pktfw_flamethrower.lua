AddCSLuaFile()

SWEP.ViewModel = "models/weapons/c_arms_citizen.mdl"
SWEP.WorldModel = "models/weapons/c_models/c_flamethrower/c_flamethrower.mdl"

SWEP.Primary.ClipSize		= 200
SWEP.Primary.DefaultClip	= 200
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo		= "AR2"

SWEP.Secondary.ClipSize	= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

SWEP.Spawnable=true
SWEP.AdminSpawnable=true

SWEP.PrintName="Flame Thrower"
SWEP.Category = "Pill Pack Weapons - TF2"
SWEP.Slot=2

function SWEP:Initialize()
	self:SetHoldType("crossbow")
	if SERVER then
		self.sound_flame = CreateSound(self,"weapons/flame_thrower_loop.wav")
		self.emitter = ents.Create("pill_target")
		//self.emitter:SetParent(self)
		self.emitter:Spawn()
	end
	//todo setup sound
end

function SWEP:PrimaryAttack()
	if ( !self:CanPrimaryAttack() ) then return end

	if SERVER then
		self.sound_flame:Play()

		if self.Owner:WaterLevel()>=2 then
			if self.particles!="bubbles" then
				self.emitter:StopParticles()
				ParticleEffectAttach("flamethrower_underwater",PATTACH_ABSORIGIN_FOLLOW,self.emitter,0)
				self.particles="bubbles"
			end
		else
			if self.particles!="flame" then
				self.emitter:StopParticles()
				ParticleEffectAttach("_flamethrower_real",PATTACH_ABSORIGIN_FOLLOW,self.emitter,0)
				self.particles="flame"
			end

			local target = self.Owner:TraceHullAttack(
				self.Owner:GetPos()+Vector(0,0,40),
				self.Owner:GetPos()+Vector(0,0,40)+self.Owner:EyeAngles():Forward()*200,
				Vector(-30,-30,-30), Vector(30,30,30),
				5,DMG_BURN,0,true
			)
			if IsValid(target) then target:Ignite(10) end

			//do attack here
		end
	end
	
	if self.takeammo then
		self:TakePrimaryAmmo(1)
	end
	self.takeammo= !self.takeammo

	self:SetNextPrimaryFire(CurTime() + .04)
end

function SWEP:Think()
	if SERVER then
		//print(CurTime(),self:GetNextPrimaryFire())
		if self:GetNextPrimaryFire()+.1<CurTime() then
			//print("~")
			self.sound_flame:Stop()
			if self.particles then
				self.emitter:StopParticles()
				self.particles=nil
			end
		end
		self.emitter:SetPos(self.Owner:GetPos()+Vector(0,0,40)+self.Owner:EyeAngles():Forward()*50)
		self.emitter:SetAngles(self.Owner:EyeAngles())
		//debugoverlay.Cross(self.emitter:GetPos(),10,1,Color(255,0,0))
		//print("mov")
	end
end

function SWEP:SecondaryAttack()
end

function SWEP:Reload()
	/*if self.ReloadingTime and CurTime() <= self.ReloadingTime then return end

	local pill_ent = pk_pills.getMappedEnt(self.Owner)
	if IsValid(pill_ent) and pill_ent.iscloaked then return end
 
	if (self:Clip1() < self.Primary.ClipSize and self.Owner:GetAmmoCount(self.Primary.Ammo) > 0) then
		self:EmitSound(self.sound_reload)
		self:DefaultReload(ACT_INVALID)
		self.ReloadingTime = CurTime() + self.time_reload
		self:SetNextPrimaryFire(CurTime() + self.time_reload)
	end*/
end

function SWEP:CanPrimaryAttack()
	if self:Clip1() <= 0 then
		return false
	end

	return true
end