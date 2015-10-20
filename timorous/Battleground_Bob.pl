sub EVENT_SAY {
    if ($text=~/hail/i) {
	quest::say("Hail $name. Let me know if you would like to [" . quest::saylink("join") . "] the fight.");
	quest::popup("Test");
    }
    elsif ($text=~/join/i) {
	if ($ulevel != 50) {
	    quest::say("I'm sorry $name, but you must be level 50 to participate in this battleground.");
	}
	else {
	quest::pvp("1");
	quest::zone("77");
	}
    }
}
