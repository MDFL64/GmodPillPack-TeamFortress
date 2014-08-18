AddCSLuaFile()

pk_pills.register("tf_sentrybuster",{
	printName="Sentry Buster",
	type="ply",
	model="models/bots/demo/bot_sentry_buster.mdl",
	attachments={},
	modelScale=1.75,
	options=function() return {
		{icon="models/weapons/w_models/w_stickybomb.mdl"},
		{icon="models/weapons/c_models/c_battleaxe/c_battleaxe.mdl",attachments={"models/workshop/player/items/demo/tw_sentrybuster/tw_sentrybuster.mdl"}}
	} end,
	default_rp_cost=10000,
	camera={
		offset=Vector(0,0,50),
		dist=200
	},
	hull=Vector(50,50,120),
	anims={
		default={
			idle="Stand_MELEE",
			walk="Run_MELEE",
			boom="taunt04",
			jump="a_jumpStart_melee",
			glide="a_jumpfloat_melee"
		}
	},
	sounds={
		spin="mvm/sentrybuster/mvm_sentrybuster_spin.wav",
		boom="mvm/sentrybuster/mvm_sentrybuster_explode.wav",
		fun="mvm/sentrybuster/mvm_sentrybuster_intro.wav",
		loop_move="mvm/sentrybuster/mvm_sentrybuster_loop.wav",
		step= pk_pills.helpers.makeList("mvm/sentrybuster/mvm_sentrybuster_step_0#.wav",4)
	},
	attack={
		mode="trigger",
		func=function(ply,ent)
			ent:PillAnim("boom",true)
			ent:PillSound("spin")
			timer.Simple(2, function()
				if IsValid(ent) then
					ply:Kill()
					ent:PillSound("boom")

					ParticleEffect("fireSmokeExplosion",ply:GetPos(), Angle(0,0,0))
					util.BlastDamage(ent,ply,ent:GetPos(),200,200)
				end
			end)
		end
	},
	attack2={
		mode="trigger",
		func=function(ply,ent)
			ent:PillSound("fun")
		end
	},
	noragdoll=true,
	movePoseMode="xy",
	moveSpeed={
		walk=300,
		run=561
	},
	jumpPower=300,
	health=2500
})

pk_pills.register("tf_tank",{
	printName="Tank",
	type="ply",
	model="models/bots/boss_bot/boss_tank.mdl",
	attachments={"models/bots/boss_bot/tank_track_l.mdl","models/bots/boss_bot/tank_track_r.mdl"},
	options=function() return {
		{},
		{model="models/bots/boss_bot/boss_tank_damage1.mdl"},
		{model="models/bots/boss_bot/boss_tank_damage2.mdl"},
		{model="models/bots/boss_bot/boss_tank_damage3.mdl"},
		{skin=1},
		{model="models/bots/boss_bot/boss_tank_damage1.mdl",skin=1},
		{model="models/bots/boss_bot/boss_tank_damage2.mdl",skin=1},
		{model="models/bots/boss_bot/boss_tank_damage3.mdl",skin=1},
		{model="models/bots/tw2/boss_bot/boss_tank.mdl",attachments={}},
		{model="models/bots/tw2/boss_bot/boss_tank_damage1.mdl",attachments={}},
		{model="models/bots/tw2/boss_bot/boss_tank_damage2.mdl",attachments={}},
		{model="models/bots/tw2/boss_bot/boss_tank_damage3.mdl",attachments={}},
		{model="models/bots/tw2/boss_bot/boss_tank.mdl",skin=1,attachments={}},
		{model="models/bots/tw2/boss_bot/boss_tank_damage1.mdl",skin=1,attachments={}},
		{model="models/bots/tw2/boss_bot/boss_tank_damage2.mdl",skin=1,attachments={}},
		{model="models/bots/tw2/boss_bot/boss_tank_damage3.mdl",skin=1,attachments={}}
	} end,
	skin=0,
	default_rp_cost=10000,
	camera={
		offset=Vector(0,0,150),
		dist=400
	},
	hull=Vector(200,200,150),
	anims={
		default={
			idle="movement",
			deploy="deploy"
		}
	},
	sounds={
		boom="mvm/mvm_tank_explode.wav",
		horn="mvm/mvm_tank_horn.wav",
		deploy="mvm/mvm_tank_deploy.wav",
		loop_move="mvm/mvm_tank_loop.wav"
	},
	attack={
		mode="trigger",
		func=function(ply,ent)
			ent:PillAnim("deploy",true)
			ent:PillSound("deploy")
			timer.Simple(7.5, function()
				if IsValid(ent) then
					ply:Kill()
					ent:PillSound("boom")

					local anchor=ents.Create("prop_dynamic")
					anchor:SetPos(ent:GetPos())
					anchor:SetModel("models/props_junk/PopCan01a.mdl")
					anchor:Spawn()
					anchor:SetRenderMode(RENDERMODE_NONE)

					ParticleEffect("cinefx_goldrush",ply:GetPos()+Vector(0,0,200), Angle(-90,0,0),anchor)
					util.BlastDamage(ent,ply,ent:GetPos(),800,800)

					timer.Simple(10,function()
						if IsValid(anchor) then
							anchor:Remove()
						end
					end)
				end
			end)

			local bomb=ents.Create("pill_attachment")
			bomb:SetParent(ent:GetPuppet())
			bomb:SetModel("models/bots/boss_bot/bomb_mechanism.mdl")
			bomb:Spawn()
			bomb:ResetSequence(bomb:LookupSequence("deploy"))
		end
	},
	attack2={
		mode="trigger",
		func=function(ply,ent)
			ent:PillSound("horn")
		end
	},
	noragdoll=true,
	noFallDamage=true,
	moveSpeed={
		walk=50
	},
	jumpPower=0,
	health=30000
})