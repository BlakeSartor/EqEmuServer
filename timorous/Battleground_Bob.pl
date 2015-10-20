sub EVENT_SAY {
    if ($text=~/hail/i) {
	quest::say("Hail $name. Let me know if you would like to [" . quest::saylink("join") . "] the fight.");
	  quest::popup("Level 50 Battleground. <br><br>Join the fight!. <br><br> Hello adventurer. I can help you join the level 50 battleground. Just let me know if you would like to join the battle. Remember, once you join you cannot leave until you have been slain or the battle has ended.<br><br> Good luck!");  
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
