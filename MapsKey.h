#ifndef MAPSKEY_H
#define MAPSKEY_H

#include <QObject>

class MapsKey : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString apiKey READ apiKey WRITE setApiKey NOTIFY apiKeyChanged)

public:
    explicit MapsKey(QObject *parent = nullptr);

    const QString &apiKey() const;
    void setApiKey(const QString &newApiKey);

signals:
    void apiKeyChanged();

private:
    QString _apiKey = "";

};

#endif // MAPSKEY_H
