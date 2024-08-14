#include "ManageBooks.h"
#include <QDebug>
Functional::Functional() {}

void Functional::doSomething()
{
    qDebug()<<"hello";
}
QVariantList Functional::getUserName() const {
    QVariantList list;
    for (auto it = m_map.begin(); it != m_map.end(); ++it) {
        QVariantMap item;
        item["name"] = it.key();
        list.append(item);
    }
    return list;
}
