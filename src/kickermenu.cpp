#include "kickermenu.h"
#include <QWindow>
#include <KWindowSystem>
#include <QScreen>
#include <KWindowEffects>

KickerMenu::KickerMenu()
{
    setSource(QUrl("qrc:/kicker/kicker.qml"));
    setColor(Qt::transparent);
    KWindowEffects::enableBlurBehind(this);
    setFlag(Qt::Popup);
    installEventFilter(this);

}

void KickerMenu::open(){
    setVisible(true);
    setMouseGrabEnabled(true);
    setKeyboardGrabEnabled(true);
}

bool KickerMenu::eventFilter(QObject *object, QEvent *event) {
    if (event->type() == QEvent::MouseButtonPress) {
        if(QWindow *w = qobject_cast<QWindow*>(object)){
            if(!w->geometry().contains(static_cast<QMouseEvent*>(event)->globalPos())){
                KickerMenu::setVisible(false);
            }
        }
    } else if (event->type() == QEvent::KeyPress) {
        QKeyEvent *keyEvent = static_cast<QKeyEvent*>(event);
        if (keyEvent->key() == Qt::Key_Escape){
            KickerMenu::setVisible(false);
        } else if (keyEvent->key() == Qt::Key_Super_L) {
            if (isVisible()){
                setVisible(false);
            }
        }
    } else if (event->type() == QEvent::Show) {
        KWindowSystem::setState(winId(), NET::SkipTaskbar | NET::SkipPager | NET::SkipSwitcher);
    } else if (event->type() == QEvent::Hide) {
        setMouseGrabEnabled(false);
        setKeyboardGrabEnabled(false);
    }

    return QObject::eventFilter(object, event);
}
