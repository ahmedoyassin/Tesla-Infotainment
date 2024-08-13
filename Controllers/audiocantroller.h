#ifndef AUDIOCANTROLLER_H
#define AUDIOCANTROLLER_H

#include <QObject>

class AudioCantroller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int volumeLevel READ volumeLevel WRITE setVolumeLevel NOTIFY volumeLevelChanged FINAL)
public:
    explicit AudioCantroller(QObject *parent = nullptr);
    int volumeLevel() const;

    Q_INVOKABLE void incrementVolume ( const int & val );
public slots:
    void setVolumeLevel(int newVolumeLevel);

signals:
    void volumeLevelChanged();
private:
    int m_volumeLevel;
};

#endif // AUDIOCANTROLLER_H
