#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "backend.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Create an instance of your C++ class
    Backend backend;

    // Expose the C++ object to QML
    engine.rootContext()->setContextProperty("backend", &backend);
   // engine.rootContext()->setContextProperty("backend", &backend);

    // Handle object creation failures
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection
        );

    // Load the QML file from the module
    engine.loadFromModule("libraryManagment", "Main");

    return app.exec();
}
