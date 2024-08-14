#ifndef BACKEND_H
#define BACKEND_H
#include <map>
#include<QString>
#include <QObject>
using namespace std;
class Backend : public QObject
{
    Q_OBJECT
public:
    Backend();
    //User function
    Q_INVOKABLE void setUser(QString name);
    Q_INVOKABLE void deleteUser(QString name);
    map<QString, map<QString, int>> getUser(QString name);
    void removeBookFromUser(QString name);

    //Assign Books
    void assignBookToUser(QString name);


    Q_INVOKABLE void setBooks(QString bookName, int Quantity);
    Q_INVOKABLE void deleteBooks(QString bookName);
    Q_INVOKABLE void updateBooks(QString bookName, int Quantity);
    Q_INVOKABLE map<QString,int> getBooks(QString bookName);
private:
    map<QString, map<QString, int>>User;
    map<QString,int>BooksInfo;

};

#endif // BACKEND_H
