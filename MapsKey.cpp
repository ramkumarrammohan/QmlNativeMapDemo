#include "MapsKey.h"

MapsKey::MapsKey(QObject *parent)
    : QObject{parent}
{
}

const QString &MapsKey::apiKey() const
{
    return _apiKey;
}

void MapsKey::setApiKey(const QString &newApiKey)
{
    if (_apiKey == newApiKey)
        return;
    _apiKey = newApiKey;
    emit apiKeyChanged();
}
