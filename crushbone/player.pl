$count = 0;
sub EVENT_ENTERZONE {
    $client->Message(4, "Waiting for other players to join. Please be patient...");
    $count++;    
        $client->Message(4, $count);
    if ($count >= 2) {
	quest::shout("Battle starting in 5 minutes...");
    }

}

sub EVENT_ZONE {
    $count--;
}
