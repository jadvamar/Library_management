#include "backend.h"
#include <QDebug>
Backend::Backend() {}

void Backend::setUser(QString name)
{
    if (User.find(name) != User.end()) {
        qDebug() << "User already available" << name;
    } else {
        User[name] = std::map<QString, int>();
         qDebug()<<"user added "<<name;
    }
}

void Backend::deleteUser(QString name)
{
    if (User.find(name) != User.end()) {
        User.erase(name);
        qDebug() << "User deleted:" << name;
    } else {
        qDebug() << "User not found:" << name;
    }
}

map<QString, map<QString, int> > Backend::getUser(QString name)
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

void Backend::deleteBooks(QString bookName)
{
    if (BooksInfo.find(bookName) != BooksInfo.end()) {
        BooksInfo.erase(bookName);
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

map<QString, int> Backend::getBooks(QString bookName)
{
    return BooksInfo;
}
