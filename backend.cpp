#include "backend.h"
#include <QDebug>
Backend::Backend() {
    // Initialize with some example data
    BooksInfo["C++"] = 5;
    BooksInfo["Java"] = 3;
    BooksInfo["Python"] = 7;
}

void Backend::setUser(QString name)
{

    if (User.find(name) != User.end()) {
        qDebug() << "User already available" << name;
    } else {
        User[name] = QMap<QString, int>();
         qDebug()<<"user added "<<name;
    }
}

void Backend::deleteUser(const QString name)
{
    if (User.find(name) != User.end()) {
        User.remove(name);
        qDebug() << "User deleted:" << name;
    } else {
        qDebug() << "User not found:" << name;
    }
}

QMap<QString, QMap<QString, int> > Backend::getUser(QString name)
{
    return User;
}

void Backend::setBooks(QString bookName, int Quantity)
{
    if (BooksInfo.find(bookName) != BooksInfo.end()) {
        qDebug() << "Books already available" << bookName;
    } else if(bookName.size() != 0){
        BooksInfo[bookName] += Quantity;
        qDebug()<<"Book added ";
    }else {
        qDebug()<<"No book is There!";
    }
}

void Backend::deleteBooks(const QString bookName)
{
    if (BooksInfo.find(bookName) != BooksInfo.end()) {
        BooksInfo.remove(bookName);
        qDebug() << "Books deleted" << bookName;
    } else {
        qDebug()<<"Book not availale ";
    }
}

void Backend::updateBooks(QString bookName, int Quantity)
{
    if (BooksInfo.find(bookName) != BooksInfo.end()) {
        BooksInfo[bookName] += Quantity;
        qDebug() << bookName << " = " << BooksInfo[bookName];
    }
}

QStringList Backend::getBooks() const
{
    return BooksInfo.keys();
}

QString Backend::getBookCount(QString bookName)
{
    if (BooksInfo.find(bookName) != BooksInfo.end())
        return QString::number(BooksInfo[bookName]);
    return "0";
}


