sub EVENT_SAY {
    $charid = 0;
    $corpse = 0;
    $charid = $client->CharacterID();
    $x = $client->GetX();
    $y = $client->GetY();
    $z = $client->GetZ();
    $corpse = quest::getplayerburriedcorpsecount($charid);
    if($text=~/Hail/i) {
        
	quest::say("We keep all that has been lost. In times past, nothing be returned once it was mine. Time have changed. The bodies, your [" . quest::saylink("bodies") . "], that were lost to you can now be returned.");
    }
    if($text=~/bodies/i && $corpse == 0) {
	quest::emote("The voice booms angrily in your mind.");
	quest::say("Be gone from this place, you waste my time!");
	$corpse = 0;
	$charid = 0;
    }
    if($text=~/bodies/i && $corpse > 0) {
	quest::summonburriedplayercorpse($charid, $x, $y, $z, 0);
	$corpse = 0;
	$charid = 0;
    }
}   
