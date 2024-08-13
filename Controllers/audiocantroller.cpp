#include "audiocantroller.h"

AudioCantroller::AudioCantroller(QObject *parent)
    : QObject{parent}
    , m_volumeLevel( 40 )

{}

int AudioCantroller::volumeLevel() const
{
    return m_volumeLevel;
}

void AudioCantroller::incrementVolume(const int &val)
{
    int newVolume = m_volumeLevel + val;
    if(newVolume <= 0)
        newVolume = 0;
    if (newVolume >=100)
        newVolume = 100;
    setVolumeLevel( newVolume);
}

void AudioCantroller::setVolumeLevel(int newVolumeLevel)
{
    if (m_volumeLevel == newVolumeLevel)
        return;
    m_volumeLevel = newVolumeLevel;
    emit volumeLevelChanged();
}
