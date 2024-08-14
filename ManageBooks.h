#ifndef MANAGEBOOKS_H
#define MANAGEBOOKS_H

#include <QObject>
#include <QVariantList>
class Functional: public QObject
{
    Q_OBJECT
public:
    Functional();

    Q_INVOKABLE void doSomething();
    Q_INVOKABLE QVariantList getUserName() const;

private:
    QMap<QString, int> m_map;
};

#endif // MANAGEBOOKS_H
