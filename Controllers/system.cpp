#include "system.h"

#include <QDateTime>

System::System(QObject *parent)
    : QObject{parent}
    , m_carLocked ( true )
    , m_outdoorTemp ( 64 )
    , m_userName ( "yasso" )
{
    m_currentTimerTimer = new QTimer(this);
    m_currentTimerTimer -> setInterval(500);
    m_currentTimerTimer -> setSingleShot(true);
    connect (m_currentTimerTimer, &QTimer::timeout, this, &System::currentTimeTimerTimeout);

    currentTimeTimerTimeout();
}

bool System::carLocked() const
{
    return m_carLocked;
}

void System::setCarLocked(bool newCarLocked)
{
    if (m_carLocked == newCarLocked)
        return;
    m_carLocked = newCarLocked;
    emit carLockedChanged();
}

int System::outdoorTemp() const
{
    return m_outdoorTemp;
}

void System::setOutdoorTemp(int newOutdoorTemp)
{
    if (m_outdoorTemp == newOutdoorTemp)
        return;
    m_outdoorTemp = newOutdoorTemp;
    emit outdoorTempChanged();
}

QString System::userName() const
{
    return m_userName;
}

void System::setUserName(const QString &newUserName)
{
    if (m_userName == newUserName)
        return;
    m_userName = newUserName;
    emit userNameChanged();
}

QString System::currentTime() const
{
    return m_currentTime;
}

void System::setCurrentTime(const QString &newCurrentTime)
{
    if (m_currentTime == newCurrentTime)
        return;
    m_currentTime = newCurrentTime;
    emit currentTimeChanged();
}

void System::currentTimeTimerTimeout()
{
    QDateTime dateTimer;
    QString currentTimer = dateTimer.currentDateTime().toString("hh:mmAP");

    setCurrentTime(currentTimer);

    m_currentTimerTimer->start();
}
