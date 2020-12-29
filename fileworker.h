#ifndef FILEWORKER_H
#define FILEWORKER_H

#include <QObject>
#include <QString>
#include <QFile>
#include <QUrl>

class FileWorker : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QUrl url READ url WRITE setUrl NOTIFY urlChanged)
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)

public:
    explicit FileWorker(QObject *parent = nullptr);
    virtual ~FileWorker() override;
    QUrl url() const;

    QString text() const;

    Q_INVOKABLE void save(const QString &data, const QUrl &path);

public slots:
    void setUrl(QUrl url);

    void setText(QString text);

signals:
    void urlChanged(QUrl url);

    void textChanged(QString text);

private:
    QUrl m_url;


    QString m_text;
};

#endif // FILEWORKER_H
