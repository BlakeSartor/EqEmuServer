function event_enter_zone(e)
	e.self:BuffFadeAll();
	e.self:Say("Depping the zone");
	depop_all();
end

-- END of FILE Zone:airplane  ID:player