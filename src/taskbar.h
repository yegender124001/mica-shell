#ifndef TASKBAR_H
#define TASKBAR_H

#include <QtQuick/QQuickView>

namespace Mica{
    class TaskBar : public QQuickView{
        Q_OBJECT
    public:
        TaskBar();
        void updateGeometry();
        void updateViewStruts();
        QRect screenRect();
    signals:
        void screenRectChanged();
    private:
         QRect m_screenRect;

    };
}

#endif
