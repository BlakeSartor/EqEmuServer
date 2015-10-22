sub EVENT_ENTERZONE {
    $client->BuffFadeAll();
    quest::depopzone(0);
    $client->NPCSPawn(999242, create, 1);
}
