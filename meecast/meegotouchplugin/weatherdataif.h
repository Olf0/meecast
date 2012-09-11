/*
 * This file was generated by qdbusxml2cpp version 0.7
 * Command line was: qdbusxml2cpp -v -c WeatherData -p weatherdataif.h:weatherdataif.cpp com.meecast.data.xml
 *
 * qdbusxml2cpp is Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
 *
 * This is an auto-generated file.
 * Do not edit! All changes made to it will be lost.
 */

#ifndef WEATHERDATAIF_H_1347356597
#define WEATHERDATAIF_H_1347356597

#include <QtCore/QObject>
#include <QtCore/QByteArray>
#include <QtCore/QList>
#include <QtCore/QMap>
#include <QtCore/QString>
#include <QtCore/QStringList>
#include <QtCore/QVariant>
#include <QtDBus/QtDBus>

/*
 * Proxy class for interface com.meecast.data
 */
class WeatherData: public QDBusAbstractInterface
{
    Q_OBJECT
public:
    static inline const char *staticInterfaceName()
    { return "com.meecast.data"; }

public:
    WeatherData(const QString &service, const QString &path, const QDBusConnection &connection, QObject *parent = 0);

    ~WeatherData();

public Q_SLOTS: // METHODS
    inline QDBusPendingReply<QString, QString, QString, QString, QString, QString, QString, bool, QString> GetCurrentWeather()
    {
        QList<QVariant> argumentList;
        return asyncCallWithArgumentList(QLatin1String("GetCurrentWeather"), argumentList);
    }
    inline QDBusReply<QString> GetCurrentWeather(QString &station_, QString &temperature, QString &temperature_hi, QString &temperature_low, QString &icon, QString &description, bool &current, QString &last_update)
    {
        QList<QVariant> argumentList;
        QDBusMessage reply = callWithArgumentList(QDBus::Block, QLatin1String("GetCurrentWeather"), argumentList);
        if (reply.type() == QDBusMessage::ReplyMessage && reply.arguments().count() == 9) {
            station_ = qdbus_cast<QString>(reply.arguments().at(1));
            temperature = qdbus_cast<QString>(reply.arguments().at(2));
            temperature_hi = qdbus_cast<QString>(reply.arguments().at(3));
            temperature_low = qdbus_cast<QString>(reply.arguments().at(4));
            icon = qdbus_cast<QString>(reply.arguments().at(5));
            description = qdbus_cast<QString>(reply.arguments().at(6));
            current = qdbus_cast<bool>(reply.arguments().at(7));
            last_update = qdbus_cast<QString>(reply.arguments().at(8));
        }
        return reply;
    }

Q_SIGNALS: // SIGNALS
};

namespace com {
  namespace meecast {
    typedef ::WeatherData data;
  }
}
#endif
