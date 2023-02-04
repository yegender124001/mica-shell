#ifndef KICKERMENU_H
#define KICKERMENU_H

#include <QQuickView>

class KickerMenu : public QQuickView
{
    Q_OBJECT
public:
    KickerMenu();

    Q_INVOKABLE void open();
protected:
    bool eventFilter(QObject *object, QEvent *event);
};

#endif // KICKERMENU_H
