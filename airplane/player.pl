sub EVENT_ENTERZONE {
    $client->BuffFadeAll();
    quest::depopzone(0);
    quest::spawn(999242, 1, 0, 611.78,1398.21,-660.12,0);
}
