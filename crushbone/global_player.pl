sub EVENT_ENTERZONE {
#this is all the contested zones
my @zonelist = qw(
mischiefplane
);
if ( grep { $_ eq $zonesn } @zonelist ) { #Save PVP state if you zone into a contested zone
quest::setglobal("PvPState",$client->GetPVP(),5,"F"); #Adds their PVPstate to global
$client->SetPVP(1);
}

}

sub EVENT_ZONE {
my @zonelist = qw(
mischiefplane
);
if ( grep { $_ eq $zonesn } @zonelist ) { #If you zone out a contested zone
if(defined $qglobals{"PvPState"} && $qglobals{"PvPState"}==0) { #Checks global PVPState & Check if PvPState = 0
$client->SetPVP(0) #Then turn pvp off
}
}
}
