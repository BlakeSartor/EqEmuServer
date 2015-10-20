sub EVENT_SAY {
    my $CorpseCount = 0;
    my $charid = $client->CharacterID();
    if($text=~/hail/i) {
	$client->Message(15,"I can [" . quest::saylink("summon a corpse") . "] .");
    } else {
	$CorpseCount = COUNT_CORPSES();

	if($text eq "summon a corpse" || $text eq "summon the corpse") {
	    if($CorpseCount > 0) {
		quest::summonallplayercorpses($charid, $x, $y, $z, 0);
		$client->Message(15,"Very well, summoning your corpses now.");
	    } else {
		$client->Message(13,"You have no corpses, begone.");
	    }
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
