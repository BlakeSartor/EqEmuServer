sub EVENT_SAY {
    my $CorpseCount = 0;
    my $charid = $client->CharacterID();
    if($text=~/hail/i) {
	$client->Message(4,"The spectral figure stares into your soul with cold eyes, its voice entering your mind. We keep all that has been lost. In times past, nothing be returned once it was mine. Time have changed. The bodies, your [" . quest::saylink("bodies") . "], that were lost to you can now be returned.");
    } else {
	$CorpseCount = COUNT_CORPSES();

	if($text eq "bodies") {
	    quest::summonallplayercorpses($charid, $x, $y, $z, 0);
	    $client->Message(15,"Very well, summoning your corpses now.");
	}
        
    }
}

sub COUNT_CORPSES {
    my @corpse_list = $entity_list->GetCorpseList();
    my $count = 0;
    foreach $corpse_found (@corpse_list) {
	if ($corpse_found->GetOwnerName() eq $client->GetName()) {
	    $count++;
	}
    }
    $count;
}
