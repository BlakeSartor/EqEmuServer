$count = 0;
sub EVENT_ENTERZONE {
    $client->Message(4, "Waiting for other players to join. Please be patient...");
    $count++;    
        $client->Message(4, $count);

}
