install.packages("jiebaR")
install.packages("jiebaRD")
library(jiebaRD)
library(jiebaR)
library(wordcloud2)
#做分词库 excel文本先导入txt，然后粘贴到Word，^p替换为空白(去除段落标记）
#另存为编码utf8，最后一行加一个回车，
engine <- worker()
segment("D:/暨大/论文/HY/数据/福利.txt",engine)
word <- scan('D:/暨大/论文/HY/数据/福利.txt',sep='\n',what='',encoding="UTF-8")
#剔除URL等各种不需要的字符
word<-gsub(pattern = "http:[a-zA-Z\\/\\.0-9]+","",word)
word<-gsub("\n","",word)
#word<-gsub(" ","",word)###
#词频统计
word <- qseg[word]
word <- freq(word)
wordcloud2(word,shape ='diamond')
#jnu
wordcloud2(word,figPath='D:/暨大/论文/HY/图片/jnu.png')
log<-system.file("D:/暨大/论文/HY/图片/jnu.png",package="wordcloud2")
wordcloud2(word,size=1,figPath=log)
letterCloud(word, "JNU")
library(devtools)
install.packages("devtools")
devtools::install_github("lchiffon/wordcloud2")
