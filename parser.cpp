#include "parser.h"

#include <QtAlgorithms>
#include <QDebug>
#include <QVector>

Parser::Parser(QObject *parent) : QObject(parent)
{

}

Parser::~Parser()
{

}

QString Parser::inputText() const
{
    return m_inputText;
}

QString Parser::outputText() const
{
    return m_outputText;
}

int comp(const QChar &lhs, const QChar &rhs)
{
    return lhs.unicode() < rhs.unicode();
}

void Parser::setInputText(QString inputText)
{
    if (m_inputText == inputText)
        return;

    m_inputText = inputText;
    emit inputTextChanged(m_inputText);

    m_dict.clear();

    auto length = inputText.length();
    for(int i = 0; i < length; i++) {
        auto curChar = inputText.at(i).toLower();
        if(!curChar.isLetter()) continue;
        if(!m_dict.contains(curChar)) {
            m_dict.insert(curChar,0);
        }
        m_dict[curChar]++;
    }


    QVector<QChar> keys = m_dict.keys().toVector();
    QList<QString> output;
    std::sort(keys.begin(),keys.end(),[&](const QChar &a,const QChar &b){
        return a.unicode() < b.unicode();
    });
    for(auto key : keys) {
        output << QString(key) << " : " << QString::number(m_dict[key]) << "\n";
    }
    setOutputText(output.join(""));

}

void Parser::setOutputText(QString outputText)
{
    if (m_outputText == outputText)
        return;

    m_outputText = outputText;
    emit outputTextChanged(m_outputText);
}
