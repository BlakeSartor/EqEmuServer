$count = 0;
$battle = 0;
sub EVENT_ENTERZONE {
    $count++;    
    $some_boss = $entity_list->GetNPCByNPCTypeID(999242); # Example
    $some_boss->Shout("Current Player Count: $count. Waiting on more players to join. Please be patient...");
    quest::shout($some_boss);
    if ($count == 2 && $battle == 0) {
	quest::shout("Battle starting in 5 minutes...");
	$battle = 1;
    }
    elsif ($count >= 3) {
	quest::shout("I have joined the battle!");
    }
}

sub EVENT_ZONE {
    $count--;
    if ($count <= 1 && $battle == 1) {
	quest::shout2("winner winner chicken dinner");
	$battle = 0;
	quest::shout($count);
	quest::shout($battle);
    }
}
