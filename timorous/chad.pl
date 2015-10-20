sub EVENT_SAY {
    if ($text=~/hail/i) {
	quest::say("hi $name");
    }
}
