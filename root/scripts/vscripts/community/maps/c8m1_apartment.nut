g_Chapter = "NO MERCY - APARTMENTS";

devchap( "ALL MODES" );

PrecacheModel( "models/props_urban/fence_cover001_256.mdl" );
PrecacheModel( "models/props_misc/wrongway_sign01_optimized.mdl" );
PrecacheModel( "models/props_rooftop/Gutter_Pipe_256.mdl" );
PrecacheModel( "models/props_rooftop/rooftopcluser06a.mdl" );
PrecacheModel( "models/props_rooftop/acvent01.mdl" );
PrecacheModel( "models/props_rooftop/acvent02.mdl" );
PrecacheModel( "models/DeadBodies/CEDA/ceda_truck_a.mdl" );
PrecacheModel( "models/props_update/c8m1_rooftop_4.mdl" );
PrecacheModel( "models/props_update/c8m1_rooftop_3.mdl" );
PrecacheModel( "models/props_update/c8m1_rooftop_1.mdl" );
PrecacheModel( "models/props_update/c8m1_rooftop_2.mdl" );
PrecacheModel( "models/props_rooftop/acunit01.mdl" );

function DoRoundFixes()
{
	make_clip( "_cliprework_rooftop01", "Survivors", 1, "-424 -524 -560", "424 524 560", "1944 268 1360" );
	make_clip( "_cliprework_rooftop02", "Survivors", 1, "-424 -452 -560", "424 452 560", "2976 964 1360" );
	make_clip( "_cliprework_rooftop06", "Survivors", 1, "-360 -520 -416", "360 520 416", "3040 1920 1504" );
	make_clip( "_cliprework_rooftop07", "Survivors", 1, "-272 -624 -544", "272 624 544", "3088 3376 1376" );
	make_clip( "_cliprework_rooftop08", "Survivors", 1, "-256 -256 -544", "256 256 544", "3072 4544 1376" );
	make_clip( "_cliprework_rooftop09", "Survivors", 1, "-192 -348 -800", "192 348 800", "3136 5148 1120" );
	make_clip( "_cliprework_rooftop10", "Survivors", 1, "-384 -256 -674", "384 256 674", "384 2400 1246" );
	make_clip( "_cliprework_rooftop11", "Survivors", 1, "-342 -320 -783.5", "342 320 783.5", "342 2976 1136" );
	make_clip( "_cliprework_rooftop12", "Survivors", 1, "-386.5 -818 -727", "386.5 818 727", "387 4270 1193" );
	make_clip( "_cliprework_rooftop13", "Survivors", 1 "-512 -224 -824", "512 224 824", "512 5312 1096" );
	make_clip( "_cliprework_unattackable_van", "Survivors", 1, "-16 -160 -960", "16 160 960", "3184 2592 960" );
	make_clip( "_cliprework_unattackable_alley1", "Survivors", 1, "-128 -48 -952", "128 48 952", "128 2096 968" );
	make_clip( "_cliprework_unattackable_alley2", "Survivors", 1, "-8 -80 -952", "8 80 952", "72 3376 968" );
	make_clip( "_clipextend_crushescape", "Survivors", 1, "-96 -1 -534", "96 2 534", "2464 768 1386" );
	make_clip( "_clipextend_rubble", "Survivors", 1, "-960 -20 -696", "960 20 696", "1984 5268 1224" );
	make_clip( "_nav_electricalboxa", "Survivors", 1, "-4 -29 0", "6 29 379", "2476 1819 125" );
	make_clip( "_nav_electricalboxb", "Survivors", 1, "-30 -4 0", "30 6 513", "2016 2188 127" );
	make_clip( "_clipextend_subwayfence", "Survivors", 1, "-24 -144 -684", "24 144 684", "3268 4144 1236" );
	make_clip( "_subwins_smoother", "Everyone", 1, "-120 -9 0", "120 9 3", "2968 4103 48" );
	make_clip( "_commentary_roofjump_hotel", "Survivors", 1, "-13 0 -451", "0 630 0", "1536 1416 640" );
	make_clip( "_commentary_roofjump_elec", "Survivors", 1, "0 -22 -8", "8 33 536", "2488 1375 104" );
	make_clip( "_commentary_roofjump_ledge", "Survivors", 1, "-240 -8 -208", "12 8 260", "2288 1424 224.35" );
	make_clip( "_commentary_roofjump_ac_a", "Survivors", 1, "-30 -60 -200", "30 60 200", "2527 1085 440" );
	make_clip( "_commentary_roofjump_ac_b", "Survivors", 1, "-29 -60 -408", "29 60 408", "2655 1667 680" );
	make_clip( "_commentary_roofjump_ac_c", "Survivors", 1, "-68 -30 -203", "68 30 203", "2192 1762 437" );
	make_clip( "_commentary_busstop", "Survivors", 1, "-36 -108 -164", "36 108 164", "1499 2786 332" );
	make_prop( "dynamic", "_commentary_l4d1_acunit", "models/props_rooftop/acunit01.mdl", "2526.61 1085.15 161.346", "0 180 0", "shadow_no", "solid_yes", "255 255 255", "1536", "2048" );
	make_trighurt( "_instakill_griefroom", "Survivor", "-512 -1080 0", "384 1080 17", "1152 936 202" );

	con_comment( "FIX:\tFans will now rotate. Server-side entities used to have Client-side Animation spawnflag." );

	EntFire( "fanblade*", "AddOutput", "spawnflags 129" );

	if ( HasPlayerControlledZombies() )
	{
		kill_funcinfclip( 43.2982 );
		kill_funcinfclip( 617.65 );
		kill_funcinfclip( 611.263 );
		kill_funcinfclip( 769.74 );
		kill_funcinfclip( 836.992 );
		kill_funcinfclip( 577.321 );
		kill_funcinfclip( 873.029 );		// Delete clip on roof near car alarm, watertower/chimneys have collision
		kill_funcinfclip( 969.151 );		// Delete clip on gray rooftop with the 3 small AC units
		kill_funcinfclip( 712.934 );		// Delete clip in far corner near NODRAW wall
		make_brush( "_losfix_boxes", "-2 -4 -16", "2 4 16", "2956 3995.77 -224" );
		make_brush( "_losfix_car", "-46 -1 -16", "56 1 10", "1163 2944 23" );
		make_brush( "_losfix_debris1", "-30 -1 -74", "15 1 40", "2404 706 90" );
		make_brush( "_losfix_debris2", "-30 -1 -74", "15 1 40", "2493 706 90" );
		make_brush( "_losfix_debris3", "-112 -20 -1", "73 20 1", "2487 727 130" );
		make_brush( "_losfix_debris4", "-112 -1 -10", "73 1 10", "2487 747 141" );
		make_brush( "_losfix_truck", "-1 -80 -5", "1 80 15", "2232 4268 12" );
		make_brush( "_losfix_van1", "-1 -50 -8", "1 50 8", "2588 3542 21" );
		make_brush( "_losfix_van2", "-40 -1 -8", "41 1 8", "2546 3494 21" );
		make_clip( "_ladder_startroof_clip", "SI Players", 1, "4 -28 0", "8 28 3", "2292 1340 319" );
		make_clip( "_ladder_subwaybricks_clip", "Everyone", 1, "-1 -8 0", "2 8 128", "2814 4104 16" );
		make_clip( "_meticulous_funcinfclip01", "SI Players", 1, "-1 -28 0", "3 28 74", "2293 850 322" );
		make_clip( "_meticulous_funcinfclip02", "SI Players", 1, "-8 -619 0", "185 629 1089", "3175 3371 832" );
		make_clip( "_meticulous_funcinfclip03", "SI Players", 1, "-153 -812 -336", "293 308 1568", "153 2988 352" );
		make_clip( "_meticulous_funcinfclip04", "SI Players", 1, "0 -846 0", "389 794 687", "-5 4298 466" );
		make_clip( "_meticulous_funcinfclip05", "SI Players", 1, "-153 -128 -336", "104 0 1568", "153 2176 352" );
		make_clip( "_yesdraw_dairy_clipa", "SI Players", 1, "-330 -231 0", "311 249 1392", "1737 5767 528" );
		make_clip( "_yesdraw_dairy_clipb", "SI Players", 1, "-17 -142 0", "17 142 1392", "2031 5390 528" );
		make_clip( "_yesdraw_farcorner_clip", "SI Players", 1, "-216 -215 -256", "168 233 1392", "216 5303 528" );
		make_clip( "_yesdraw_start_clipa", "SI Players", 1, "-300 -447 0", "0 449 1120", "3052 959 800" );
		make_clip( "_yesdraw_start_clipb", "SI Players", 1, "-158 -10 -580", "42 312 549", "2710 508 1370" );
		make_clip( "_ladder_crushedescape_clip", "Survivors", 1, "-20 -3 0", "20 3 1745", "2478 769 173" );
		make_clip( "_start_shortcutfix", "Survivors", 1, "-6 -40 -171.5", "6 40 171.5", "2302 1388 312" );
		make_clip( "_cliprework_subwayupper", "Survivors", 1, "-201 -94 0", "215 90 4322", "2921 4194 156" );
		make_clip( "_cliprework_subwayledge", "Survivors", 1, "-218 -18 132", "233 3 4322", "3014 4017 156" );
		make_clip( "_cliprework_rooftop03", "Survivors", 1, "-258 -388 -640", "258 388 640", "1794 1800 1280" );
		make_clip( "_cliprework_rooftop04", "Survivors", 1, "-214 -208 -640", "214 208 640", "2262 1996 1280" );
		make_clip( "_cliprework_rooftop05", "Survivors", 1, "-512 -407.5 -712", "512 407.5 712", "2048 2792 1208" );
		make_clip( "_clipextend_policefence", "Survivors", 1, "-400 -16 -632", "400 16 632", "1168 2032 1288" );
		make_ladder( "_ladder_alleywindow_cloned_tankerwindow", "1720 3959.5 120", "820 -1590 0" );
		make_ladder( "_ladder_commvignette_cloned_trashorange", "2428 3204.5 255.9905", "-1800 97 -144" );
		make_ladder( "_ladder_crushedescape_cloned_tankerwindow", "1720 3959.5 120", "4198 4729 -51", "0 180 0", "0 1 0" );
		make_ladder( "_ladder_dairybrickleft_cloned_thinwhiteledge", "3310 4020.5 151.9882", "-1659 1036 488" );
		make_ladder( "_ladder_dairybrickright_cloned_thinwhiteledge", "3310 4020.5 151.9882", "-1685 1036 488" );
		make_ladder( "_ladder_fencebayB_cloned_garagewindow", "2056.5 4608 120", "3539 6600 208", "0 180 0", "-1 0 0" );
		make_ladder( "_ladder_fencebayT_cloned_garagewindow", "2056.5 4608 120", "3539 6600 368", "0 180 0", "-1 0 0" );
		make_ladder( "_ladder_fencefrontL_cloned_fencebackL", "841 2039.5 76", "2294 4095 0", "0 180 0", "0 1 0" );
		make_ladder( "_ladder_fencefrontM_cloned_fencebackM", "1173 2048.5 68", "2346 4105 0", "0 180 0", "0 1 0" );
		make_ladder( "_ladder_fencefrontR_cloned_fencebackR", "1453 2044.5 75.717", "2294 4095 0", "0 180 0", "0 1 0" );
		make_ladder( "_ladder_flatnose_cloned_chaintilt", "3268.5 4088 83.9941", "-1766 284 -21", "0 -8 0", "0.96 -0.26 0" );
		make_ladder( "_ladder_ominouswin_cloned_helloworld", "2066 1783.5 328", "-242 3464 -112" );
		make_ladder( "_ladder_parkourstartB_cloned_tallpipecopcar", "1531 2570 255.99", "1029.5 -1500 144" );
		make_ladder( "_ladder_parkourstartT_cloned_thinwhiteledge", "3310 4020.5 151.9882", "5852 5120 523", "0 180 0", "0 -1 0" );
		make_ladder( "_ladder_simondairy_cloned_helloworld", "2066 1783.5 328", "-937 3272 -112" );
		make_ladder( "_ladder_startroof_cloned_trashblack", "2565 2560 255.9905", "-265 -1168 -12" );
		make_ladder( "_ladder_subwaybricks_cloned_tankerwindow", "1720 3959.5 120", "1112 134 -68" );
		make_ladder( "_ladder_subwayrubble_cloned_woodyjr", "3408 3973.5 74", "-64 140 -264" );
		make_prop( "dynamic", "_losblocker_fencea", "models/props_urban/fence_cover001_256.mdl", "896 3971 17",  "0 270 0", "shadow_no" );
		make_prop( "dynamic", "_losblocker_fenceb", "models/props_urban/fence_cover001_256.mdl", "1408 3971 17",  "0 270 0", "shadow_no" );
		make_prop( "dynamic", "_commvignette_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "445 2790 416", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_commvignette_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "445 3190 416", "0 0 0", "shadow_no", "solid_no", "255 255 255", "17", "217" );
		make_prop( "dynamic", "_ladder_commvignette_pipe", "models/props_rooftop/Gutter_Pipe_256.mdl", "628 3296 330", "0 180 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_ominouswin_pipeB", "models/props_rooftop/Gutter_Pipe_256.mdl", "1824 5248 272", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_ominouswin_pipeT", "models/props_rooftop/Gutter_Pipe_256.mdl", "1824 5248 528", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_simondairy_pipeB", "models/props_rooftop/Gutter_Pipe_256.mdl", "1129 5056 272", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_ladder_simondairy_pipeT", "models/props_rooftop/Gutter_Pipe_256.mdl", "1129 5056 528", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_losblocker_simondairy", "models/props_rooftop/rooftopcluser06a.mdl", "1392 5397 630", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_solidify_dairyclust", "models/props_rooftop/rooftopcluser06a.mdl", "1632 4672 869.405", "0 88.5 0", "shadow_no" );
		make_prop( "dynamic", "_solidify_dairyvent1", "models/props_rooftop/acvent01.mdl", "1633 4676 776.299", "0 180 0", "shadow_no" );
		make_prop( "dynamic", "_solidify_dairyvent2", "models/props_rooftop/acvent01.mdl", "1633 4548 776.299", "0 180 0", "shadow_no" );
		make_prop( "dynamic", "_solidify_dairyvent3", "models/props_rooftop/acvent01.mdl", "1904 4145 776.299", "0 270 0", "shadow_no" );
		make_prop( "dynamic", "_solidify_dairyvent4", "models/props_rooftop/acvent02.mdl", "1665 4124 776", "0 270 0", "shadow_no" );
		make_prop( "dynamic", "_window_ceda_body", "models/DeadBodies/CEDA/ceda_truck_a.mdl", "2382 1414 257", "2 -137 32", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdraw_dairy_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "1309 5535 585", "0 270 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_yesdraw_dairy_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "1709 5535 585", "0 270 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_yesdraw_farcorner_wall", "models/props_update/c8m1_rooftop_4.mdl", "384 4272 529.3", "0 270 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdraw_farcorner_wrongway", "models/props_misc/wrongway_sign01_optimized.mdl", "384 5303 320", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_yesdraw_fireroof_hunt1", "models/props_update/c8m1_rooftop_3.mdl", "544 1264 1232", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yesdraw_fireroof_hunt2", "models/props_update/c8m1_rooftop_3.mdl", "544 1536 1232.1", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yesdraw_fireroof_hunt3", "models/props_update/c8m1_rooftop_3.mdl", "544 1808 1232", "0 0 0", "shadow_no" );
		make_prop( "dynamic", "_yesdraw_roof_starta", "models/props_update/c8m1_rooftop_3.mdl", "2792 1192 799.9999", "0 -90 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdraw_roof_startb", "models/props_update/c8m1_rooftop_3.mdl", "2792 744 799.9999", "0 -90 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdraw_roof_startc", "models/props_update/c8m1_rooftop_3.mdl", "3272 1192 799.9999", "0 -90 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdraw_roof_startd", "models/props_update/c8m1_rooftop_3.mdl", "3272 744 799.9999", "0 -90 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdraw_rooftop_1", "models/props_update/c8m1_rooftop_1.mdl", "1776 4528 776", "0 -90 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdraw_rooftop_2", "models/props_update/c8m1_rooftop_2.mdl", "1536 5536 528", "0 -90 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdraw_rooftop_3", "models/props_update/c8m1_rooftop_3.mdl", "496 2400 616", "0 -90 0", "shadow_no", "solid_no" );
		make_prop( "dynamic", "_yesdraw_rooftop_3_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "445 2495 678", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_yesdraw_rooftop_3_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "445 2305 678", "0 0 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_yesdraw_start_wrongwaya", "models/props_misc/wrongway_sign01_optimized.mdl", "2752 1232 854", "0 180 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );
		make_prop( "dynamic", "_yesdraw_start_wrongwayb", "models/props_misc/wrongway_sign01_optimized.mdl", "2752 982 854", "0 180 0", "shadow_no", "solid_no", "255 255 255", 217, 17 );

		DoEntFire( "!self", "Break", "", 0.0, null, Entities.FindByClassnameNearest( "prop_physics", Vector( 2293, 1340, 359 ), 1 ) );
		DoEntFire( "!self", "AddOutput", "angles 90 20 0", 0.0, null, Entities.FindByClassnameNearest( "func_illusionary", Vector( 2296, 1340, 349.91 ), 1 ) );
		DoEntFire( "!self", "AddOutput", "origin 2391 1335 16", 0.0, null, Entities.FindByClassnameNearest( "func_illusionary", Vector( 2296, 1340, 349.91 ), 1 ) );
	}

	// Resolve stuck Tank spawns for Taaannnk! Mutation.

	if ( g_MutaMode == "mutation19" )
	{
		// No Survival on this map, and no Tanks in Scavenge, so extend
		// a few func_playerinfected_clip with these.

		make_clip( "_tankstuck_alleystart", "SI Players", 1, "-105 -711 0", "823 57 4132", "2473 455 16" );
		make_clip( "_tankstuck_alleymiddle", "SI Players", 1, "-127 -257 0", "209 256 4468", "-129 3584 16" );

		// And preserve an actually cool Tank spawn by deleting 1 clip.

		kill_funcinfclip( 1060.85 );	// Delete clip that blocks the rubble and a cool unique spawn
	}
}