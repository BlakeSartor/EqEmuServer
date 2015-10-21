$count = 0;
$battle = 0;
my @zonelist = qw(crushbone);

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
	$some_boss->Shout("The battle will begin in 2 minutes...");
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
	quest::we(258, "The battle for crushbone has ended and a victor has been declared!");
	$battle = 0;
	quest::stoptimer ($timer);
    }
    my @zonelist = qw(crushbone);
    if ( grep { $_ eq $zonesn } @zonelist ) { #If you zone out a contested zone
	if(defined $qglobals{"PvPState"} && $qglobals{"PvPState"}==0) { #Checks global PVPState & Check if PvPState = 0
	    $client->SetPVP(0) #Then turn pvp off
	}
    }
}
sub EVENT_TIMER {

    if ($timer eq "t1") {
	quest::stoptimer ("t1");
	$some_boss->Shout("The battle will begin in 1 minute...");
	quest::settimer("t2",30);
    }
    elsif ($timer eq "t2") {
	quest::stoptimer ("t2");
	$some_boss->Shout("The battle will begin in 30 seconds...");
	quest::settimer("t3",10);
    }
    elsif ($timer eq "t3") {
	quest::stoptimer ("t3");
	$some_boss->Shout("The battle will begin in 20 seconds...");
	quest::settimer("t4",10);
    }
    elsif ($timer eq "t4") {
	quest::stoptimer ("t4");
	$some_boss->Shout("The battle will begin in 10 seconds...");
	quest::settimer("t5",5);
    }
    elsif ($timer eq "t5") {
	quest::stoptimer ("t5");
	$some_boss->Shout("The battle will begin in 5 seconds...");
	quest::settimer("t6",1);
    }
    elsif ($timer eq "t6") {
	quest::stoptimer ("t6");
	$some_boss->Shout("The battle will begin in 4 seconds...");
	quest::settimer("t7",1);
    }
    elsif ($timer eq "t7") {
	quest::stoptimer ("t7");
	$some_boss->Shout("The battle will begin in 3 seconds...");
	quest::settimer("t8",1);
    }
    elsif ($timer eq "t8") {
	quest::stoptimer ("t8");
	$some_boss->Shout("The battle will begin in 2 seconds...");
	quest::settimer("t9",1);
    }
    elsif ($timer eq "t9") {
	quest::stoptimer ("t9");
	$some_boss->Shout("The battle will begin in 1 second...");
	quest::settimer("t10",1);
    }
    elsif ($timer eq "t10") {
	quest::stoptimer ("t10");
	quest::we(258, "The battle for Crushbone has begun!");
        my @nlist = $entity_list->GetClientList();
	foreach my $n (@nlist) {
	    $n->SetPVP(1);
	}
    }
    
}
