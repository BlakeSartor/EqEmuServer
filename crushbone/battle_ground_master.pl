sub EVENT_SAY {
    if ($text=~/hail/i) {
	quest::say("Hail $name. Welcome to the battle for crushbone. This is a free for all battle with the last man standing as the victor. Once the match has started if you zone out/gate/or teleport out you will forfit the match. If you do not want to participate I can teleport you back to [" . quest::saylink("Timorous Deep") . "] .");
    }
    elsif ($text=~/timorous deep/i) {
	quest::say("Good luck $name!");
	quest::movepc(96, -1779.17,-11805.72,12.28);

    }
}
