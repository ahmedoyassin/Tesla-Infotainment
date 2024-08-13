#include "hvachandler.h"

HVACHandler::HVACHandler(QObject *parent)
    : QObject{parent}
    , m_targetTemp( 70 )
{}

int HVACHandler::targetTemp() const
{
    return m_targetTemp;
}

void HVACHandler::incrementTargetTemp(const int &val)
{
    int newTargetTemp = m_targetTemp + val;
    setTargetTemp(newTargetTemp);
}

void HVACHandler::setTargetTemp(int newTargetTemp)
{
    if (m_targetTemp == newTargetTemp)
        return;
    m_targetTemp = newTargetTemp;
    emit targetTempChanged();
}
