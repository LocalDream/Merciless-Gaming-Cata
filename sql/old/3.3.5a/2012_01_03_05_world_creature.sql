SET @GUID := 72707; -- need 62;
SET @NPC_WILDSPAWN_SATYR = 11451;
SET @NPC_WILDSPAWN_ROGUE := 11452;
SET @NPC_WILDSPAWN_BETRAYER := 11454;
SET @NPC_WILDSPAWN_FELSWORN := 11455;
SET @NPC_WILDSPAWN_SHADOWSTALKER := 11456;
SET @NPC_WILDSPAWN_HELLCALLER := 11457;
SET @NPC_WARPWOOD_TREANT = 11462;
SET @NPC_WARPWOOD_CRUSHER := 13021;
SET @NPC_WHIP_LASHER := 13022;
SET @NPC_PHASE_LASHER := 13196;
SET @NPC_FEL_LASH := 13197;

-- add movement
SET @ENTRY  := 56992; -- single Wildspawn Felsworn instance
UPDATE creature SET `MovementType`=2 WHERE `guid`=@ENTRY;
DELETE FROM `creature_addon` WHERE `guid`=@ENTRY;
INSERT INTO `creature_addon`(`guid`,`path_id`) VALUES
(@ENTRY,@ENTRY*10);

-- Add waypoints to Wildspawn Felsworn instance
DELETE FROM `waypoint_data` WHERE `id`=@ENTRY*10;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@ENTRY*10,1,57.4000,-737.329,-25.1524,0,0,0,100,0),
(@ENTRY*10,2,26.45,-682.69,-24.98,0,0,0,100,0);

-- Smart AI for Wildspawn Shadowstalker
SET @ENTRY := @NPC_WILDSPAWN_SHADOWSTALKER;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE creature SET `MovementType`=1,`spawndist`=3 WHERE `id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,22766,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wildspawn Shadowstalker - On Spawn - cast Sneak on self'),
(@ENTRY,0,1,0,0,0,100,0,4000,8000,5000,8000,11,22416,0,0,0,0,0,2,0,0,0,0,0,0,0,'Wildspawn Shadowstalker - In Combat - Cast Backstab'),
(@ENTRY,0,2,0,0,0,100,0,6000,7000,8000,9000,11,7992,0,0,0,0,0,2,0,0,0,0,0,0,0,'Wildspawn Shadowstalker - In Combat - Cast Slowing Posion');

-- add movement
SET @ENTRY  := 56967; -- single Wildspawn Shadowstalker instance
UPDATE creature SET `MovementType`=2 WHERE `guid`=@ENTRY;
DELETE FROM `creature_addon` WHERE `guid`=@ENTRY;
INSERT INTO `creature_addon`(`guid`,`path_id`) VALUES
(@ENTRY,@ENTRY*10);

-- Add waypoints to Wildspawn Shadowstalker instance
DELETE FROM `waypoint_data` WHERE `id`=@ENTRY*10;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@ENTRY*10,1,45.4305,-675.9378,-25.1612,0,0,0,100,0),
(@ENTRY*10,2,36.5939,-646.3212,-25.1506,0,0,0,100,0),
(@ENTRY*10,3,58.3292,-605.7308,-25.0700,0,0,0,100,0),
(@ENTRY*10,4,52.3244,-584.9519,-23.3673,0,0,0,100,0),
(@ENTRY*10,5,52.1407,-565.7738,-19.4151,0,0,0,100,0),
(@ENTRY*10,6,56.5794,-558.3062,-19.2307,0,0,0,100,0),
(@ENTRY*10,7,76.8705,-545.9866,-15.2457,0,0,0,100,0),
(@ENTRY*10,8,97.9787,-544.0214,-11.0777,0,0,0,100,0),
(@ENTRY*10,9,76.8705,-545.9866,-15.2457,0,0,0,100,0),
(@ENTRY*10,10,56.5794,-558.3062,-19.2307,0,0,0,100,0),
(@ENTRY*10,11,52.1407,-565.7738,-19.4151,0,0,0,100,0),
(@ENTRY*10,12,52.3244,-584.9519,-23.3673,0,0,0,100,0),
(@ENTRY*10,13,58.3292,-605.7308,-25.0700,0,0,0,100,0),
(@ENTRY*10,14,36.5939,-646.3212,-25.1506,0,0,0,100,0),
(@ENTRY*10,15,45.4305,-675.9378,-25.1612,0,0,0,100,0),
(@ENTRY*10,16,62.53,-681.04,-24.98,0,0,0,100,0);

-- Spawn the mobs
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID AND @GUID+62;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(@GUID+1,@NPC_WARPWOOD_TREANT,429,1,1,0,0,72.5524,-197.561,-4.14211,3.13356,7200,0,0,7842,0,2),
(@GUID+2,@NPC_WARPWOOD_TREANT,429,1,1,0,0,20.3687,-203.068,-4.0968,3.10349,7200,0,0,7842,0,2),
(@GUID+3,@NPC_WARPWOOD_TREANT,429,1,1,0,0,30.1582,-195.841,-4.12466,3.01317,7200,0,0,7599,0,2),
(@GUID+4,@NPC_WARPWOOD_TREANT,429,1,1,0,0,25.8537,-206.521,-4.06996,3.01317,7200,0,0,7599,0,2),
(@GUID+5,@NPC_WARPWOOD_TREANT,429,1,1,0,0,-107.769,-200.032,-4.10429,0.153016,7200,0,0,7842,0,2),
(@GUID+6,@NPC_WARPWOOD_TREANT,429,1,1,0,0,-113.89,-195.466,-4.14424,0.0626954,7200,0,0,7842,0,2),
(@GUID+7,@NPC_WARPWOOD_TREANT,429,1,1,0,0,-117.388,-207.58,-4.06716,0.0476419,7200,0,0,7842,0,2),
(@GUID+8,@NPC_WARPWOOD_TREANT,429,1,1,0,0,-142.675,-350.105,-4.11237,1.70352,7200,0,0,7599,0,2),
(@GUID+9,@NPC_WARPWOOD_TREANT,429,1,1,0,0,-145.689,-356.994,-4.13712,1.66338,7200,0,0,7599,0,2),
(@GUID+10,@NPC_WARPWOOD_TREANT,429,1,1,0,0,-138.62,-360.106,-4.13313,1.66338,7200,0,0,7599,0,2),
(@GUID+11,@NPC_WARPWOOD_TREANT,429,1,1,0,0,-115.225,-347.295,-4.05097,6.26559,7200,0,0,7599,0,2),
(@GUID+12,@NPC_WARPWOOD_TREANT,429,1,1,0,0,-109.451,-350.449,-4.07628,6.28064,7200,0,0,7599,0,2),
(@GUID+13,@NPC_WARPWOOD_TREANT,429,1,1,0,0,-120.637,-353.502,-4.10136,6.26747,7200,0,0,7842,0,2),
(@GUID+14,@NPC_WARPWOOD_TREANT,429,1,1,0,0,-46.8699,-355.781,-4.11898,0.109725,7200,0,0,7599,0,2),
(@GUID+15,@NPC_WARPWOOD_TREANT,429,1,1,0,0,-57.5391,-352.691,-4.09353,0.121943,7200,0,0,7842,0,2),
(@GUID+16,@NPC_WARPWOOD_TREANT,429,1,1,0,0,-60.9243,-359.466,-4.14508,0.0617289,7200,0,0,7842,0,2),
(@GUID+17,@NPC_WARPWOOD_TREANT,429,1,1,0,0,54.2367,-348.114,-4.05781,6.25459,7200,0,0,7599,0,2),
(@GUID+18,@NPC_WARPWOOD_TREANT,429,1,1,0,0,43.279,-352.861,-4.0973,0.0633858,7200,0,0,7842,0,2),
(@GUID+19,@NPC_WARPWOOD_TREANT,429,1,1,0,0,39.8267,-343.521,-4.02135,6.18098,7200,0,0,7842,0,2),
(@GUID+20,@NPC_WARPWOOD_TREANT,429,1,1,0,0,111.859,-366.456,-4.14992,1.56459,7200,0,0,7842,0,2),
(@GUID+21,@NPC_WARPWOOD_TREANT,429,1,1,0,0,116.012,-372.374,-4.09262,1.52947,7200,0,0,7842,0,2),
(@GUID+22,@NPC_WARPWOOD_TREANT,429,1,1,0,0,107.625,-377.033,-4.07882,1.53449,7200,0,0,7842,0,2),
(@GUID+23,@NPC_WARPWOOD_CRUSHER,429,1,1,0,0,141.391,-355.109,-4.15258,3.22692,7200,0,0,16194,0,0),
(@GUID+24,@NPC_PHASE_LASHER,429,1,1,0,0,81.2447,-361.592,-4.14699,1.54781,7200,0,0,15684,0,0),
(@GUID+25,@NPC_WHIP_LASHER,429,1,1,0,0,34.9898,-347.58,-4.05484,0.017372,7200,0,0,1900,0,0),
(@GUID+26,@NPC_WHIP_LASHER,429,1,1,0,0,36.7793,-352.448,-4.09411,0.00231851,7200,0,0,1900,0,0),
(@GUID+27,@NPC_WHIP_LASHER,429,1,1,0,0,41.2793,-352.437,-4.09411,0.00231851,7200,0,0,1900,0,0),
(@GUID+28,@NPC_WHIP_LASHER,429,1,1,0,0,44.3212,-352.43,-4.09411,0.00231851,7200,0,0,1900,0,0),
(@GUID+29,@NPC_WHIP_LASHER,429,1,1,0,0,44.315,-349.742,-4.07234,0.0588672,7200,0,0,1900,0,0),
(@GUID+30,@NPC_WHIP_LASHER,429,1,1,0,0,39.4515,-350.029,-4.0749,0.063885,7200,0,0,1900,0,0),
(@GUID+31,@NPC_WHIP_LASHER,429,1,1,0,0,39.2745,-347.262,-4.05348,0.063885,7200,0,0,1900,0,0),
(@GUID+32,@NPC_WARPWOOD_CRUSHER,429,1,1,0,0,-20.953,-371.52,-4.05577,1.58638,7200,0,0,16194,0,0),
(@GUID+33,@NPC_PHASE_LASHER,429,1,1,0,0,-52.0524,-361.703,-4.14598,1.7679,7200,0,0,15684,0,0),
(@GUID+34,@NPC_WHIP_LASHER,429,1,1,0,0,-62.1186,-349.8,-4.07015,6.09414,7200,0,0,1900,0,0),
(@GUID+35,@NPC_WHIP_LASHER,429,1,1,0,0,-69.5873,-354.282,-4.1069,6.17944,7200,0,0,1900,0,0),
(@GUID+36,@NPC_WHIP_LASHER,429,1,1,0,0,-66.7331,-351.805,-4.08577,6.18948,7200,0,0,1900,0,0),
(@GUID+37,@NPC_WHIP_LASHER,429,1,1,0,0,-73.9811,-351.124,-4.08116,6.18948,7200,0,0,1900,0,0),
(@GUID+38,@NPC_WHIP_LASHER,429,1,1,0,0,-69.8854,-349.117,-4.06468,6.2798,7200,0,0,1900,0,0),
(@GUID+39,@NPC_WHIP_LASHER,429,1,1,0,0,-65.6902,-346.108,-4.0402,6.2798,7200,0,0,1900,0,0),
(@GUID+40,@NPC_WARPWOOD_CRUSHER,429,1,1,0,0,-73.7821,-346.08,-4.0402,6.2798,7200,0,0,1900,0,0),
(@GUID+41,@NPC_WARPWOOD_TREANT,429,1,1,0,0,-93.8011,-363.618,-4.14738,1.65316,7200,0,0,16194,0,0),
(@GUID+42,@NPC_PHASE_LASHER,429,1,1,0,0,-131.311,-365.627,-4.15058,1.51265,7200,0,0,15198,0,0),
(@GUID+43,@NPC_WHIP_LASHER,429,1,1,0,0,-143.839,-340.391,-4.12014,1.83881,7200,0,0,1900,0,0),
(@GUID+44,@NPC_WHIP_LASHER,429,1,1,0,0,-142.296,-336.529,-4.10736,1.85386,7200,0,0,1900,0,0),
(@GUID+45,@NPC_WHIP_LASHER,429,1,1,0,0,-138.49,-341.197,-4.07808,1.73845,7200,0,0,1900,0,0),
(@GUID+46,@NPC_WHIP_LASHER,429,1,1,0,0,-134.462,-337.194,-4.04726,1.70944,7200,0,0,1900,0,0),
(@GUID+47,@NPC_WHIP_LASHER,429,1,1,0,0,-135.424,-330.303,-4.0528,1.70944,7200,0,0,1900,0,0),
(@GUID+48,@NPC_WHIP_LASHER,429,1,1,0,0,-142.163,-331.244,-4.1045,1.71445,7200,0,0,1900,0,0),
(@GUID+49,@NPC_WHIP_LASHER,429,1,1,0,0,-138.62,-333.245,-4.07944,1.71947,7200,0,0,1900,0,0),
(@GUID+50,@NPC_WARPWOOD_CRUSHER,429,1,1,0,0,-138.38,-275.724,-4.07674,3.17049,7200,0,0,16194,0,0),
(@GUID+51,@NPC_PHASE_LASHER,429,1,1,0,0,-162.835,-275.863,-4.14791,6.27238,7200,0,0,15684,0,0),
(@GUID+52,@NPC_WHIP_LASHER,429,1,1,0,0,-158.318,-204.325,-4.15232,0.0694766,7200,0,0,1900,0,0),
(@GUID+53,@NPC_WHIP_LASHER,429,1,1,0,0,-154.646,-204.07,-4.15232,0.0694766,7200,0,0,1900,0,0),
(@GUID+54,@NPC_WHIP_LASHER,429,1,1,0,0,-153.089,-196.695,-4.15243,0.0343519,7200,0,0,1900,0,0),
(@GUID+55,@NPC_WHIP_LASHER,429,1,1,0,0,-160.393,-196.946,-4.15243,0.0343519,7200,0,0,1900,0,0),
(@GUID+56,@NPC_WHIP_LASHER,429,1,1,0,0,-162.052,-201.486,-4.15243,0.0393697,7200,0,0,1900,0,0),
(@GUID+57,@NPC_WHIP_LASHER,429,1,1,0,0,-152.686,-201.117,-4.15243,0.0393697,7200,0,0,1900,0,0),
(@GUID+58,@NPC_WHIP_LASHER,429,1,1,0,0,-156.996,-199.83,-4.15243,0.059441,7200,0,0,1900,0,0),
(@GUID+59,@NPC_PHASE_LASHER,429,1,1,0,0,-86.8965,-210.681,-4.03141,1.56479,7200,0,0,15198,0,0),
(@GUID+60,@NPC_WARPWOOD_CRUSHER,429,1,1,0,0,-87.0174,-180.571,-2.71439,4.76202,7200,0,0,16194,0,0),
(@GUID+61,@NPC_PHASE_LASHER,429,1,1,0,0,-27.3846,-207.58,-4.06107,0.888256,7200,0,0,15684,0,0),
(@GUID+62,@NPC_WARPWOOD_CRUSHER,429,1,1,0,0,-15.3937,-177.684,-2.71439,4.81219,7200,0,0,16194,0,0);

-- Add movement to some mobs
DELETE FROM `creature_addon` WHERE `guid` BETWEEN @GUID+1 AND @GUID+22;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES
(@GUID+1,(@GUID+1)*10),
(@GUID+2,(@GUID+2)*10),
(@GUID+3,(@GUID+2)*10),
(@GUID+4,(@GUID+2)*10),
(@GUID+5,(@GUID+6)*10),
(@GUID+6,(@GUID+6)*10),
(@GUID+7,(@GUID+6)*10),
(@GUID+8,(@GUID+8)*10),
(@GUID+9,(@GUID+8)*10),
(@GUID+10,(@GUID+8)*10),
(@GUID+11,(@GUID+11)*10),
(@GUID+12,(@GUID+11)*10),
(@GUID+13,(@GUID+11)*10),
(@GUID+14,(@GUID+14)*10),
(@GUID+15,(@GUID+14)*10),
(@GUID+16,(@GUID+14)*10),
(@GUID+17,(@GUID+17)*10),
(@GUID+18,(@GUID+17)*10),
(@GUID+19,(@GUID+17)*10),
(@GUID+20,(@GUID+20)*10),
(@GUID+21,(@GUID+20)*10),
(@GUID+22,(@GUID+20)*10);

-- Add waypoints to mobs
DELETE FROM `waypoint_data` WHERE `id` = (@GUID+1)*10;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
((@GUID+1)*10,1,70.6901,-197.173,-4.14434,0,1,0,100,0),
((@GUID+1)*10,2,-104.169,-199.817,-4.12389,0,1,0,100,0),
((@GUID+2)*10,1,-73.5443,-202.239,-4.10251,0,1,0,100,0),
((@GUID+2)*10,2,35.4205,-201.467,-4.11061,0,1,0,100,0),
((@GUID+6)*10,1,-20.2122,-201.982,-4.11082,0,1,0,100,0),
((@GUID+6)*10,2,-130.665,-201.733,-4.10813,0,1,0,100,0),
((@GUID+8)*10,1,-166.248,-199.501,-4.15228,0,1,0,100,0),
((@GUID+8)*10,2,-131.595,-354.127,-4.10839,0,1,0,100,0),
((@GUID+11)*10,1,-35.5988,-348.525,-4.06037,0,1,0,100,0),
((@GUID+11)*10,2,-21.0353,-356.517,-4.12553,0,1,0,100,0),
((@GUID+11)*10,3,4.10672,-354.436,-4.11233,0,1,0,100,0),
((@GUID+11)*10,4,-62.8668,-351.204,-4.083,0,1,0,100,0),
((@GUID+11)*10,5,-113.908,-346.958,-4.04887,0,1,0,100,0),
((@GUID+14)*10,1,49.0152,-351.975,-4.09131,0,1,0,100,0),
((@GUID+14)*10,2,-68.801,-355.361,-4.11568,0,1,0,100,0),
((@GUID+17)*10,1,140.938,-354.573,-4.15133,0,1,0,100,0),
((@GUID+17)*10,2, -17.9066,-352.038,-4.09042,0,1,0,100,0),
((@GUID+20)*10,1,134.04,-337.362,-4.14977,0,1,0,100,0),
((@GUID+20)*10,2,117.337,-367.835,-4.15199,0,1,0,100,0),
((@GUID+20)*10,3,68.2814,-346.911,-4.04935,0,1,0,100,0),
((@GUID+20)*10,4,111.089,-364.118,-4.14948,0,1,0,100,0);
