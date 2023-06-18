#include <QQmlContext>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "MapsKey.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    MapsKey mapsKey;

    qDebug() << argc << argv;
    if(argc == 1)
    {
        qDebug() << "pass the google map api key as an argument...";
    }
    else
    {
        mapsKey.setApiKey(QString(argv[1]));
    }

    engine.rootContext()->setContextProperty("mapsKey", &mapsKey);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
