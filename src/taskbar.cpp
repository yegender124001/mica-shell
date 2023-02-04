#include "taskbar.h"
#include <NETWM>
#include <KWindowSystem>
#include <QScreen>
#include <QQmlContext>
#include <KWindowEffects>
#include <KX11Extras>

namespace Mica {

TaskBar::TaskBar()
{
    setColor(Qt::transparent);
    setSource(QUrl("qrc:/taskbar.qml"));
    updateGeometry();

    setFlags(Qt::FramelessWindowHint);
    connect(screen(), &QScreen::virtualGeometryChanged, this, &TaskBar::updateGeometry);
    connect(screen(), &QScreen::geometryChanged, this, &TaskBar::updateGeometry);
    KX11Extras::setOnDesktop(winId(), NET::OnAllDesktops);

    KWindowSystem::setType(winId(), NET::Dock);
    KWindowSystem::setState(winId(), NET::KeepAbove);

    show();

}

QRect TaskBar::screenRect()
{
    return m_screenRect;
}

void TaskBar::updateGeometry()
{
    const QRect rect = screen()->geometry();

    if(m_screenRect != rect){
        m_screenRect = rect;
        emit screenRectChanged();
    }

    QRect windowRect = QRect(rect.x(), rect.height()-50, rect.width(), 50);
    setGeometry(windowRect);
    updateViewStruts();

    KWindowEffects::enableBlurBehind(this, true);
}

void TaskBar::updateViewStruts()
{
    const QRect wholeScreen(QPoint(0, 0), screen()->virtualSize());
    const QRect rect = geometry();
    const int topOffset = screen()->geometry().top();

    NETExtendedStrut strut;
    strut.bottom_width = rect.height() + topOffset - 1;
    strut.bottom_start = rect.x();
    strut.bottom_end = rect.x() + rect.width() - 1;

    KX11Extras::setExtendedStrut(winId(),
                                 strut.left_width,
                                 strut.left_start,
                                 strut.left_end,
                                 strut.right_width,
                                 strut.right_start,
                                 strut.right_end,
                                 strut.top_width,
                                 strut.top_start,
                                 strut.top_end,
                                 strut.bottom_width,
                                 strut.bottom_start,
                                 strut.bottom_end);
}


}
