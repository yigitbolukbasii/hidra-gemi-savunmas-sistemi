quest defance_wave begin
	state start begin
		function Settings()
			local Settings = {}
			Settings.map_index = 353
			Settings.cord = {1280, 4864}
			Settings.start_pos = {385, 357}
			return Settings
		end
		function SpawnHandicap(i)
			if i == 0 then
				local h1 = d.spawn_mob_ac_dir(3970, 400, 372, 0)
				local h2 = d.spawn_mob_ac_dir(3970, 369, 372, 0)
				d.setf("h1", h1)
				d.setf("h2", h2)
			elseif i == 1 then
				local h3 = d.spawn_mob_ac_dir(3970, 400, 435, 0)
				local h4 = d.spawn_mob_ac_dir(3970, 369, 435, 0)
				d.setf("h3", h3)
				d.setf("h4", h4)
			end
		end
		function PurgeHandicap(i)
			if i == 0 then
				d.purge_vid(d.getf("h1"))
				d.purge_vid(d.getf("h2"))
			elseif i == 1 then
				d.purge_vid(d.getf("h3"))
				d.purge_vid(d.getf("h4"))
			end
		end
		function SpawnHidras()
			local h1 = d.spawn_mob_ac_dir(3963, 378, 443, 180)
			local h2 = d.spawn_mob_ac_dir(3963, 385, 439, 180)
			local h3 = d.spawn_mob_ac_dir(3964, 392, 443, 180)
			d.setf("hidra1", h1)
			d.setf("hidra2", h2)
			d.setf("hidra3", h3)
		end
		function PurgeHidras()
			if d.getf("hidracount") == 2 then
				d.purge_vid(d.getf("hidra3"))
			elseif d.getf("hidracount") == 1 then
				d.purge_vid(d.getf("hidra3"))
				d.purge_vid(d.getf("hidra2"))
			else
				d.purge_vid(d.getf("hidra3"))
				d.purge_vid(d.getf("hidra2"))
				d.purge_vid(d.getf("hidra1"))
			end
		end
		function Clear()
			clear_server_timer("CheckSecondFiveOne", d.get_map_index())
			clear_server_timer("CheckSecondFive", d.get_map_index())
			clear_server_timer("CheckSecondFourOne", d.get_map_index())
			clear_server_timer("CheckSecondFour", d.get_map_index())
			clear_server_timer("CheckSecondThreeOne", d.get_map_index())
			clear_server_timer("CheckSecondThree", d.get_map_index())
			clear_server_timer("Jump_wave2", d.get_map_index())
			clear_server_timer("CheckSecondTwoOne", d.get_map_index())
			clear_server_timer("CheckSecondTwo", d.get_map_index())
			clear_server_timer("CheckSecond", d.get_map_index())
			clear_server_timer("UpdateDungeon", d.get_map_index())
			d.setf("sn", 0)
			d.setf("dalga", 0)
			d.setf("hidra1", 0)
			d.setf("hidra2", 0)
			d.setf("hidra3", 0)
			d.setf("h3", 0)
			d.setf("h4", 0)
			d.setf("h3", 0)
			d.setf("h4", 0)
			d.setf("hidracount", 0)
			d.setf("hidra", 0)
		end
		when Exit.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.set_warp_location(1, setting.outside_entry_pos[1] , setting.outside_entry_pos[2])
				d.exit_all()
				clear_server_timer("Exit", d.get_map_index())
			end
		end
		when UpdateDungeon.server_timer begin
			if d.select(get_server_timer_arg()) then
				if d.get_mast() == 0 then
					d.notice("SOS! Direk parçalandı ve geminiz batıyor. Şimdi Ejderha Ateşi Burnu'na ışınlanacaksınız.", true)
					d.clear_regen()
					d.kill_all()
					server_loop_timer("Exit", 10, d.get_map_index())
					defance_wave.Clear()
				end
			end
		end
		when kill with npc.get_race() == 3962 begin
			if d.get_mast() == 0 then
				return
			end
			d.notice("Kara göründü! Gemi direğini başarıyla savundunuz ve uzun bir bir yolculuktan sonra yeni kıtaya ulaştınız. Portala gidin.")
			d.clear_regen()
			d.kill_all()
			d.spawn_mob_ac_dir(3965, 385, 417, 0)
			d.spawn_mob_ac_dir(3949, 385, 451, 0)
			defance_wave.PurgeHandicap(1)
		end
		when CheckSecondFiveOne.server_timer begin
			if d.select(get_server_timer_arg()) then
				if d.getf("sn") > 1 then
					d.notice("Deniz Savaşı "..d.getf("sn").." sn. içinde başlayacak")
					d.setf("sn", d.getf("sn") - 1)
					d.set_victim_mast(d.getf("hidra"), 0)
				else
					d.setf("sn", d.getf("sn") - 1)
					clear_server_timer("CheckSecondFiveOne", d.get_map_index())
					d.set_regen_file("data/dungeon/defance_wave/4.txt")
					d.set_victim_mast(d.spawn_mob_ac_dir(3956, 385, 430, 0), 1)
					defance_wave.PurgeHandicap(0)
					d.set_victim_mast(d.getf("hidra"), 1)
				end
			end
		end
		when CheckSecondFive.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer("CheckSecondFive", d.get_map_index())
				local set = defance_wave.Settings()
				local cord = set.cord
				local pos = set.start_pos
				defance_wave.SpawnHandicap(0)
				d.setf("hidra", d.spawn_mob_ac_dir(3962, 385, 372, 0))
				d.set_victim_mast(d.getf("hidra"), 0)
				d.setf("hidracount", 0)
				defance_wave.PurgeHidras()
				d.jump_all((cord[1] + pos[1]), (cord[2] + pos[2]))
				d.notice("4. Dalga: Gemi direği savunması esnasında, Hidra kişisini mağlup edin", true)
				d.setf("sn", 10)
				server_loop_timer("CheckSecondFiveOne", 1, d.get_map_index())
			end
		end
		when kill with npc.get_race() == 3961 begin
			if d.get_mast() == 0 then
				return
			end
			d.notice("Direği başarıyla savundunuz. Aferin! Bir sonraki dalgaya hazırlanın.", true)
			d.clear_regen()
			d.kill_all()
			server_timer("CheckSecondFive", 7, d.get_map_index())
		end
		when CheckSecondFourOne.server_timer begin
			if d.select(get_server_timer_arg()) then
				if d.getf("sn") > 1 then
					d.notice("Deniz Savaşı "..d.getf("sn").." sn. içinde başlayacak")
					d.setf("sn", d.getf("sn") - 1)
					d.set_victim_mast(d.getf("hidra"), 0)
				else
					d.setf("sn", d.getf("sn") - 1)
					clear_server_timer("CheckSecondFourOne", d.get_map_index())
					d.set_regen_file("data/dungeon/defance_wave/3.txt")
					d.set_victim_mast(d.spawn_mob_ac_dir(3956, 385, 430, 0), 1)
					defance_wave.PurgeHandicap(0)
					d.set_victim_mast(d.getf("hidra"), 1)
				end
			end
		end
		when CheckSecondFour.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer("CheckSecondFour", d.get_map_index())
				local set = defance_wave.Settings()
				local cord = set.cord
				local pos = set.start_pos
				defance_wave.SpawnHandicap(0)
				d.setf("hidra", d.spawn_mob_ac_dir(3961, 385, 372, 0))
				d.set_victim_mast(d.getf("hidra"), 0)
				d.setf("hidracount", 1)
				defance_wave.PurgeHidras()
				d.jump_all((cord[1] + pos[1]), (cord[2] + pos[2]))
				d.notice("3. Dalga: Gemi direği savunması esnasında, Hidra kişisini mağlup edin", true)
				d.setf("sn", 10)
				server_loop_timer("CheckSecondFourOne", 1, d.get_map_index())
			end
		end
		when kill with npc.get_race() == 3960 begin
			if d.get_mast() == 0 then
				return
			end
			d.notice("Direği başarıyla savundunuz. Aferin! Bir sonraki dalgaya hazırlanın.", true)
			d.clear_regen()
			d.kill_all()
			server_timer("CheckSecondFour", 7, d.get_map_index())
		end
		when CheckSecondThreeOne.server_timer begin
			if d.select(get_server_timer_arg()) then
				if d.getf("sn") > 1 then
					d.notice("Deniz Savaşı "..d.getf("sn").." sn. içinde başlayacak")
					d.setf("sn", d.getf("sn") - 1)
					d.set_victim_mast(d.getf("hidra"), 0)
				else
					d.setf("sn", d.getf("sn") - 1)
					clear_server_timer("CheckSecondThreeOne", d.get_map_index())
					d.set_regen_file("data/dungeon/defance_wave/2.txt")
					d.set_victim_mast(d.spawn_mob_ac_dir(3956, 385, 430, 0), 1)
					defance_wave.PurgeHandicap(0)
					d.set_victim_mast(d.getf("hidra"), 1)
				end
			end
		end
		when CheckSecondThree.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer("CheckSecondThree", d.get_map_index())
				server_loop_timer("CheckSecondThreeOne", 1, d.get_map_index())
				d.set_victim_mast(d.getf("hidra"), 0)
				d.setf("sn", 10)
			end
		end
		when Jump_wave2.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer("Jump_wave2", d.get_map_index())
				local set = defance_wave.Settings()
				local cord = set.cord
				local pos = set.start_pos
				defance_wave.SpawnHandicap(0)
				d.setf("hidra", d.spawn_mob_ac_dir(3960, 385, 372, 0))
				d.set_victim_mast(d.getf("hidra"), 0)
				d.setf("hidracount", 2)
				defance_wave.PurgeHidras()
				d.jump_all((cord[1] + pos[1]), (cord[2] + pos[2]))
				d.notice("2. Dalga: Gemi direği savunması esnasında, Hidra kişisini mağlup edin", true)
				server_timer("CheckSecondThree", 1, d.get_map_index())
			end
		end
		when CheckSecondTwoOne.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.notice("Bir Sonraki dalga "..d.getf("sn").." sn. içinde başlayacak")
				if d.getf("sn") > 1 then
					d.setf("sn", d.getf("sn") - 1)
				else
					d.setf("sn", d.getf("sn") - 1)
					clear_server_timer("CheckSecondTwoOne", d.get_map_index())
					d.clear_regen()
					d.kill_all()
					server_timer("Jump_wave2", 1, d.get_map_index())
				end	
			end
		end
		when CheckSecondTwo.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.notice("Bir Sonraki dalga "..d.getf("sn").." sn. içinde başlayacak")
				d.setf("sn", d.getf("sn") - 1)
				server_loop_timer("CheckSecondTwoOne", 1, d.get_map_index())
				clear_server_timer("CheckSecondTwo", d.get_map_index())
			end
		end
		when CheckSecondOne.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.notice("Deniz Savaşı "..d.getf("sn").." sn. içinde başlayacak")
				if d.getf("sn") > 1 then
					d.setf("sn", d.getf("sn") - 1)
				else
					d.setf("sn", d.getf("sn") - 1)
					clear_server_timer("CheckSecondOne", d.get_map_index())
					defance_wave.PurgeHandicap(0)
					d.set_regen_file("data/dungeon/defance_wave/1.txt")
					d.set_victim_mast(d.spawn_mob_ac_dir(3956, 385, 430, 0), 1)
					server_loop_timer("CheckSecondTwo", 110, d.get_map_index())
					d.setf("sn", 10)
				end
			end
		end
		when CheckSecond.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.notice("Deniz Savaşı "..d.getf("sn").." sn. içinde başlayacak")
				if d.getf("sn") == 10 then
					d.setf("sn", d.getf("sn") - 1)
					server_loop_timer("CheckSecondOne", 1, d.get_map_index())
					clear_server_timer("CheckSecond", d.get_map_index())
				else
					d.setf("sn", d.getf("sn") - 10)
				end
			end
		end
		when 20436.chat."Dalgayı Başlat" begin
			if party.is_leader() and d.getf("dalga") == 0 then
				say_npc()
				say("")
				say("Savunmayı başlatmak istiyor musun ?")
				if select("Evet", "Hayır") == 2 then
					return
				end
				local config = defance_wave.Settings()
				local cord = config.cord
				local start_pos = config.start_pos
				d.setf("hidracount", 3)
				defance_wave.SpawnHidras()
				d.jump_all(config.map_index, (cord[1] + start_pos[1]), (cord[2] + start_pos[2]))
				d.notice("Deniz Savaşı 1dk. içinde başlayacak")
				d.notice("1. Dalga: 120 sn. Boyunca tüm gücünüzle Gemi direği öğesini savunun.", true)
				server_loop_timer("CheckSecond", 10, d.get_map_index())
				d.setf("sn", 50)
				d.setf("dalga", 1)
			end
		end
		when make_dungeon.timer begin
			local config = defance_wave.Settings()
			local cord = config.cord
			local start_pos = config.start_pos
			d.new_jump_party(config.map_index, (cord[1] + start_pos[1]), (cord[2] + start_pos[2]))
			d.spawn_mob_ac_dir(20436, 385, 367, 0)
			d.spawn_mob(20434, 385, 400)
			defance_wave.SpawnHandicap(0)
			defance_wave.SpawnHandicap(1)
		end
		when 20013.chat."Herkes Gemiye!" with party.is_leader() begin
			-- if party.is_leader() then
				say("Meley'i takip etmek için şimdi gemi yolculuğuna")
				say("başlamak istiyor musun?")
				if select("Evet", "Hayır") == 2 then
					return
				end
				timer("make_dungeon", 1)
			-- end
		end
		when login begin
			if pc.get_map_index() >= 3530000 and pc.get_map_index() < 3540000 then
				cmdchat("BINARY_Update_Mast_Window 1")
			else
				cmdchat("BINARY_Update_Mast_Window 0")
			end
		end
	end
end