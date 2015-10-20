sub EVENT_ENTERZONE {
    my $playerip = $client->GetIP();
    @pvplist;
    if ( grep { $_ eq $playerip } @pvplist )
{

    $client->Message(315,"YOU MAY ONLY HAVE ONE CHARACTER IN THIS ZONE!");
    push(@pvplist, "$playerip");
    $client->MovePC(348, 1.8, 1.6, -22.8, 187);
    return;
}
push(@pvplist, "$playerip");
$client->SetPVP(1);
}

sub EVENT_ZONE {
    my $playerip = $client->GetIP();
    my $count = 0;
    foreach $pvp_player (@pvplist) 
{
    next unless $pvp_player = $playerip;
    $count++;
}

if ($count >= 2)
{
    @pvplist = grep {$_ ne $playerip} @pvplist;
    push(@pvplist, "$playerip"); #Add the IP back to list since there are 2 of the same IP
}
else
{
    @pvplist = grep {$_ ne $playerip} @pvplist;
}
$client->SetPVP(0);
}
