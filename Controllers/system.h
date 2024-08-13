#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>
#include <QTimer>
class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carLocked READ carLocked WRITE setCarLocked NOTIFY carLockedChanged)
    Q_PROPERTY(int outdoorTemp READ outdoorTemp WRITE setOutdoorTemp NOTIFY outdoorTempChanged FINAL)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged FINAL)
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged FINAL)
public:

    explicit System(QObject *parent = nullptr);

    bool carLocked() const;

    int outdoorTemp() const;

    QString userName() const;

    QString currentTime() const;

public slots:
    void setCarLocked(bool newCarLocked);
    void setOutdoorTemp(int newOutdoorTemp);
    void setUserName(const QString &newUserName);
    void setCurrentTime(const QString &newCurrentTime);
    void currentTimeTimerTimeout();


signals:
    void carLockedChanged();
    void outdoorTempChanged();

    void userNameChanged();

    void currentTimeChanged();

private:
    bool m_carLocked;
    int m_outdoorTemp;
    QString m_userName;
    QString m_currentTime;
    QTimer * m_currentTimerTimer;
};

#endif // SYSTEM_H
