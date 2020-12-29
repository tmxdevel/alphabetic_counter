#include "fileworker.h"

#include <QByteArray>
#include <QDebug>


FileWorker::FileWorker(QObject *parent) : QObject(parent)
{

}

FileWorker::~FileWorker()
{

}

QUrl FileWorker::url() const
{
    return m_url;
}

QString FileWorker::text() const
{
    return m_text;
}

void FileWorker::save(const QString &data, const QUrl &path)
{
    QFile input(path.path());
    if(input.open(QIODevice::WriteOnly)) {
        qDebug() << "Writing";

        input.write(data.toUtf8());

        input.close();
    }
}

void FileWorker::setUrl(QUrl url)
{
    qDebug() << url;
    if (m_url == url)
        return;

    m_url = url;
    emit urlChanged(m_url);

    QFile input(url.path());
    if(input.open(QIODevice::ReadOnly)) {

        auto data = input.readAll();
        setText(data);

        input.close();
    }
}

void FileWorker::setText(QString text)
{
    if (m_text == text)
        return;

    m_text = text;
    emit textChanged(m_text);
}
