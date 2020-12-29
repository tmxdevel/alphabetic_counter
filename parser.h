#ifndef PARSER_H
#define PARSER_H

#include <QObject>
#include <QString>
#include <QHash>

class Parser : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString inputText READ inputText WRITE setInputText NOTIFY inputTextChanged)
    Q_PROPERTY(QString outputText READ outputText WRITE setOutputText NOTIFY outputTextChanged)

    QString m_inputText;
    QHash<QChar, quint32> m_dict;

    QString m_outputText;

public:
    explicit Parser(QObject *parent = nullptr);
    virtual ~Parser() override;


    QString inputText() const;
    QString outputText() const;

public slots:
    void setInputText(QString inputText);
    void setOutputText(QString outputText);

signals:
    void inputTextChanged(QString inputText);
    void outputTextChanged(QString outputText);
};

#endif // PARSER_H
