#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>


#include <Controllers/system.h>
#include <Controllers/hvachandler.h>
#include <Controllers/audiocantroller.h>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    if (qEnvironmentVariableIsEmpty("QTGLESSTREAM_DISPLAY")) {
        qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("213"));
        qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", QByteArray("120"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    }
    QGuiApplication app(argc, argv);

    System m_systemHandler;
    HVACHandler m_driverHVACHandler;
    HVACHandler m_passangerHVACHandler;
    AudioCantroller m_audioController;
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    QQmlContext * context( engine.rootContext());
    context->setContextProperty( "systemHandler", &m_systemHandler );
    context->setContextProperty( "driverHVAC", &m_driverHVACHandler );
    context->setContextProperty( "passangerHVAC", &m_passangerHVACHandler );
    context->setContextProperty( "audioController", &m_audioController );
    return app.exec();
}
