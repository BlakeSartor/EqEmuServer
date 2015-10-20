sub EVENT_SAY {
    if ($text=~/hail/i) {
	quest::say("Would you like me to [" . quest::saylink("summon") . "] your corpse lost in battle?");
    }
    elsif ($text=~/summon/i) {
	quest::say("working on it... blake");
	
    }
}
