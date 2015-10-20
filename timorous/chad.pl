sub EVENT_SAY {
    if ($text=~/hail/i) {
	quest::emote("The spectral figure stares into your soul with 
cold eyes, its voice entering your mind.");
	quest::say("We keep all that has been lost. In times past, nothing be returned once it was mine. Times have changed. The bodies, your [" . quest::saylink("bodies") . "], that were lost to you can now be returned.");
    }
    elsif ($text=~/bodies/i) {
    quest::summonburriedplayercorpse(($client->CharacterID()), ($client->GetX()), ($client->GetY()), ($client->GetZ()), 0);
    quest::say("attemping to summon corpses.");

    }
}
