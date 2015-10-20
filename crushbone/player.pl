$count = 0;
$battle = 0;
sub EVENT_ENTERZONE {
    $count++;    
    $some_boss = $entity_list->GetNPCByNPCTypeID(999242); # Example
    if ($count == 1) {
	$some_boss->Shout("Current Player Count: [$count].");
	$some_boss->Shout(" Waiting on more players to join. Please be patient...");

    }
    elsif ($count == 2 && $battle == 0) {
	$some_boss->Shout("Current Player Count: [$count].");
	$some_boss->Shout("The battle will begin in 5 minutes...");
	$battle = 1;
    }
    elsif ($count >= 3) {
	$some_boss->Shout("Current Player Count: [$count].");
	$some_boss->Shout("$userid has joined the battle");
    }
}

sub EVENT_ZONE {
    $count--;
    if ($count <= 1 && $battle == 1) {
	$some_boss->Shout("$userid has won the battle!");
	$battle = 0;
    }
}
