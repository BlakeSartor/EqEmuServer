$count = 0;
$battle = 0;
sub EVENT_ENTERZONE {
    $count++;    
    $some_boss = $entity_list->GetNPCByNPCTypeID(999242); # Example
    if ($count == 1) {
	$some_boss->Shout("$name has joined the battle!");
	$some_boss->Shout("Current Player Count: [$count].");
	$some_boss->Shout(" Waiting on more players to join. Please be patient...");

    }
    elsif ($count == 2 && $battle == 0) {
	$some_boss->Shout("$name has joined the battle!");
	$some_boss->Shout("Current Player Count: [$count].");
	$some_boss->Shout("The battle will begin in 5 minutes...");
	$battle = 1;
	quest::settimer("t1",60);
    }
    elsif ($count >= 3) {
	$some_boss->Shout("$name has joined the battle!");
	$some_boss->Shout("Current Player Count: [$count].");
    }
}

sub EVENT_ZONE {
    $count--;
    if ($count <= 1 && $battle == 1) {
	$some_boss->Shout("The battle has ended!");
	$battle = 0;
	quest::stoptimer ("preptime");
	
    }
}
sub EVENT_TIMER {

    if ($timer eq "t1") {
	quest::stoptimer ("t1");
	$some_boss->Shout("The battle will begin in 4 minutes...");
	quest::settimer("t2",60);
    }
    elsif ($timer eq "t2") {
	quest::stoptimer ("t2");
	$some_boss->Shout("The battle will begin in 3 minutes...");
	quest::settimer("t3",60);
    }
    elsif ($timer eq "t3") {
	quest::stoptimer ("t3");
	$some_boss->Shout("The battle will begin in 2 minutes...");
	quest::settimer("t4",60);
    }
    elsif ($timer eq "t4") {
	quest::stoptimer ("t4");
	$some_boss->Shout("The battle will begin in 1 minutes...");
	quest::settimer("t5",60);
    }
    elsif ($timer eq "t5") {
	quest::stoptimer ("t5");
	quest::we(258, "The battle for Crushbone has begun!");
    }
}
