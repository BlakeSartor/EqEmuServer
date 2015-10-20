sub EVENT_SAY {
  if ($text=~/hail/i)  {
      quest::say("Hello $name. I'm not much of a fighter myself but I can bestow upon you the power of a level 50. Would you like [" . quest::saylink("level up") . "]? I can also [" . quest::saylink("scribe spells") . "] and give you the [" . quest::saylink("skills") . "] of a level 50.");
    }
	elsif ($text=~/skills/i) {
		quest::setallskill("250");
		quest::say("Enjoy your skills!");
	}	
	elsif ($text=~/level up/i) {
		quest::level(50);
		$npc->CastSpell(1576, $userid);
		quest::say("Topor Incomming!");
	}
	elsif ($text=~/scribe spells/i) {
		quest::scribespells(50);
	}	
}