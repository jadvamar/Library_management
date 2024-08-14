#ifndef BACKEND_H
#define BACKEND_H
#include <QMap>
#include <QString>
#include <QStringList>
#include <QObject>
using namespace std;
class Backend : public QObject
{
    Q_OBJECT
public:
    Backend();
    //User function
    Q_INVOKABLE void setUser(QString name);
    Q_INVOKABLE void deleteUser(const QString name);
    QMap<QString, QMap<QString, int>> getUser(QString name);
    void removeBookFromUser(QString name);

    //Assign Books
    void assignBookToUser(QString name);


    Q_INVOKABLE void setBooks(QString bookName, int Quantity);
    Q_INVOKABLE void deleteBooks(const QString bookName);
    Q_INVOKABLE void updateBooks(QString bookName, int Quantity);
    Q_INVOKABLE  QStringList getBooks() const;
    Q_INVOKABLE QString getBookCount(QString bookName);
private:
    QMap<QString, QMap<QString, int>>User;
    QMap<QString,int>BooksInfo;

};

#endif // BACKEND_H
