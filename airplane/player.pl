sub EVENT_ENTERZONE {
    $client->BuffFadeAll();
    quest::depopzone(0);
}
