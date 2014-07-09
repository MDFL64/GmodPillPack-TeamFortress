AddCSLuaFile()

pk_pills.register("tf_conga",{
	type="ply",
	printName="CONGA CONGA CONGA",
	options=function() return {
		{model="models/player/scout.mdl"},
		{model="models/player/soldier.mdl"},
		{model="models/player/pyro.mdl"},
		{model="models/player/demo.mdl"},
		{model="models/player/heavy.mdl"},
		{model="models/player/engineer.mdl"},
		{model="models/player/medic.mdl"},
		{model="models/player/sniper.mdl"},
		{model="models/player/spy.mdl"},
		{model="models/player/scout.mdl",skin=1},
		{model="models/player/soldier.mdl",skin=1},
		{model="models/player/pyro.mdl",skin=1},
		{model="models/player/demo.mdl",skin=1},
		{model="models/player/heavy.mdl",skin=1},
		{model="models/player/engineer.mdl",skin=1},
		{model="models/player/medic.mdl",skin=1},
		{model="models/player/sniper.mdl",skin=1},
		{model="models/player/spy.mdl",skin=1}
	} end,
	default_rp_cost=1000,
	camera={
		offset=Vector(0,0,70),
		dist=100
	},
	anims={
		default={
			idle="taunt_conga"
		}
	},
	sounds={
		loop_move="music/conga_sketch_167bpm_01-04.wav"
	},
	autoRestartAnims=true,
	hull=Vector(30,30,80),
	moveSpeed={
		walk=50,
		run=50
	},
	health=500
})