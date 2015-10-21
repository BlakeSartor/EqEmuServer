$count = 0;
$battle = 0;

sub EVENT_ENTERZONE {
    $count++;    
    $some_boss = $entity_list->GetNPCByNPCTypeID(999242);
    if ($count == 1) {
	$some_boss->Shout("$name has joined the battle!");
	$some_boss->Shout("Current Player Count: [$count].");
	$some_boss->Shout(" Waiting for more players to join. Please be patient...");

    }
    elsif ($count == 2 && $battle == 0) {
	$some_boss->Shout("$name has joined the battle!");
	$some_boss->Shout("Current Player Count: [$count].");
	quest::we(258, "The battle for Crushbone will begin in 2 minutes!");
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
    if ($count == 1 && $battle == 1) {
	$battle = 0;
	$client->SetPVP(0);	
	quest::stoptimer($timer);
	quest::we(15, "$name has fallen in battle!");
	my @wlist = $entity_list->GetClientList();
	foreach $w (@wlist) {
	    $tempname = $w->GetCleanName();
	    if ($tempname ne $name) {
		quest::we(258, "The battle for Crushbone has ended and $tempname has emerged victorious!");
		quest::delglobal("battleground_in_session");
		$w->SetPVP(0)
	    }
	}
    }
    elsif ($count >= 2 && $battle == 1) {
	quest::we(15, "$name has fallen in battle!");
	$client->SetPVP(0);
    }
    elsif ($count == 0) {
	$client->SetPVP(0);
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
	quest::setglobal("battleground_in_session",1,5,"F");
        if (defined $qglobals{"battleground_in_session"}) {
	    quest::we(258, "global variable $battle_ground_in_session");
	}
        my @nlist = $entity_list->GetClientList();
	foreach my $n (@nlist) {
	    $n->SetPVP(1);
	}
    }
}
