sub EVENT_SAY {
  my $CorpseCount = 0;
  my $charid = $client->CharacterID();
  my $x = $client->GetX();
  my $y = $client->GetY();
  my $z = $client->GetZ();
  if($text=~/hail/i) {
    $client->Message(15,"I can [" . quest::saylink("bury a corpse") . "] or [" . quest::saylink("summon a corpse") . "] ".");
  } else {
    $CorpseCount = COUNT_CORPSES();

    if($text eq "bury a corpse" || $text eq "bury the corpse") {
	  if($CorpseCount > 0) {
        quest::buryplayercorpse($charid);
        $client->Message(15,"Very well, burying one of your corpses now.");
      } else {
        $client->Message(13,"You have no unburied corpses, begone.");
	  }
    }
    elsif ($text eq "summon a corpse" || $text eq "summon the corpse") {
	quest::say("attempting to summon corpse");
	quest::summonburriedplayercorpse($charid,$x,$y,$z,0);
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

