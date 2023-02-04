#include "taskbar.h"
#include <QGuiApplication>
#include "kickermenu.h"


int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    qmlRegisterType<KickerMenu>("Kicker",1,0,"KickerDialog");
    Mica::TaskBar taskbar;
    return app.exec();
}
