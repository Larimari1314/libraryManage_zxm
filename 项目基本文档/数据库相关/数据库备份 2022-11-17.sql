/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.6.51 : Database - libraryManage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`libraryManage` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `libraryManage`;

/*Table structure for table `Action` */

DROP TABLE IF EXISTS `Action`;

CREATE TABLE `Action` (
  `action_name` varchar(200) NOT NULL COMMENT '权限url',
  `action_id` int(11) NOT NULL COMMENT '权限id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Action` */

insert  into `Action`(`action_name`,`action_id`) values ('/librarySystemAdmin/dropdownListData/getBookType',1),('/librarySystemAdmin/bookByAdmin/editBookInformation',1),('/librarySystemAdmin/dropdownListData/getAuthorCountry',1),('/librarySystemAdmin/dropdownListData/getBookLanguage',1),('/librarySystemAdmin/bookByAdmin/editBookInformation',1),('/librarySystemAdmin/bookByAdmin/addBook',1),('/librarySystemAdmin/bookByAdmin/deleteBookById',1),('/librarySystemAdmin/bookByAdmin/queryAllBooks',1),('/librarySystemAdmin/bookTagByAdmin/findAllBookTag',1),('/librarySystemAdmin/bookTagByAdmin/editBookTag',1),('/librarySystemAdmin/dropdownListData/getBookStatus',1),('/librarySystemAdmin/bookTagByAdmin/editBookTag',1),('/librarySystemAdmin/bookByAdmin/searchBookTitlesRemotely',1),('/librarySystemAdmin/bookTagByAdmin/deleteTagById',1),('/librarySystemAdmin/bookTagByAdmin/addBookTag',1),('/librarySystemAdmin/commentsByAdmin/queryAllMessages',2),('/librarySystemAdmin/commentsByAdmin/deleteComments',2),('/librarySystemAdmin/scheduledByAdmin/getAllPreOrderedBook',2),('/librarySystemAdmin/scheduledByAdmin/modifyReservationStatus',2),('/librarySystemAdmin/dropdownListData/getPreOrderBookStatus',2),('/librarySystemAdmin/dropdownListData/getBorrowStatus',2),('/librarySystemAdmin/borrowByAdmin/queryAllBorrowingInformation',3),('/librarySystemAdmin/borrowByAdmin/confirmReturnBooks',3),('/librarySystemAdmin/constantByAdmin/findAllConstant',4),('/librarySystemAdmin/constantByAdmin/editConstant',4),('/librarySystemAdmin/dropdownListData/getEventCategory',5),('/librarySystemAdmin/dropdownListData/getActivityStatus',5),('/librarySystemAdmin/activityByAdmin/findAllActivity',5),('/librarySystemAdmin/activityByAdmin/addActivity',5),('/librarySystemAdmin/activityByAdmin/deleteActivity',5),('/librarySystemAdmin/activityByAdmin/modifyActivity',5),('/librarySystemAdmin/applicationByAdmin/findAllApplication',5),('/librarySystemAdmin/applicationByAdmin/signUpSuccessfully',5),('/librarySystemAdmin/dropdownListData/queryTimeList',6),('/librarySystemAdmin/floorByAdmin/findAllFloor',6),('/librarySystemAdmin/floorByAdmin/modifyFloorInformation',6),('/librarySystemAdmin/dropdownListData/findFloorStatus',6),('/librarySystemAdmin/userAppointmentsByAdmin/findAllAppointment',7),('/librarySystemAdmin/userAppointmentsByAdmin/cancelAppointment',7),('/librarySystemAdmin/roleByAdmin/findAllRoleInfo',8),('/librarySystemAdmin/roleByAdmin/editPermission',8),('/librarySystemAdmin/roleByAdmin/addRole',8),('/librarySystemAdmin/roleByAdmin/findAllModule',8),('/librarySystemAdmin/userByAdmin/findAllUser',9),('/librarySystemAdmin/dropdownListData/getGender',9),('/librarySystemAdmin/userByAdmin/editUser',9),('/librarySystemAdmin/userByAdmin/activateAccount',9),('/librarySystemAdmin/managerByAdmin/findAllManager',9),('/librarySystemAdmin/roleByAdmin/getRoleInfoList',9),('/librarySystemAdmin/managerByAdmin/editManagerInformation',9),('/librarySystemAdmin/managerByAdmin/addManager',9),('/librarySystemAdmin/managerByAdmin/editPassword',10);

/*Table structure for table `AppointmentsTime` */

DROP TABLE IF EXISTS `AppointmentsTime`;

CREATE TABLE `AppointmentsTime` (
  `time_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '时间id',
  `time_start` time DEFAULT NULL COMMENT '开始时间',
  `time_end` time DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`time_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `AppointmentsTime` */

insert  into `AppointmentsTime`(`time_id`,`time_start`,`time_end`) values (1,'08:00:00','10:00:00'),(2,'14:00:00','17:00:00'),(3,'08:00:00','17:00:00');

/*Table structure for table `Book` */

DROP TABLE IF EXISTS `Book`;

CREATE TABLE `Book` (
  `book_id` varchar(50) NOT NULL COMMENT '图书id',
  `type_id` int(11) DEFAULT NULL COMMENT '图书种类id',
  `book_name` varchar(100) NOT NULL COMMENT '图书名称',
  `book_author` varchar(50) NOT NULL COMMENT '图书作者',
  `book_info` varchar(1000) DEFAULT NULL COMMENT '图书信息',
  `book_image` varchar(1000) DEFAULT NULL COMMENT '图书图片',
  `book_address` varchar(100) NOT NULL COMMENT '图书位置',
  `book_status` char(5) NOT NULL COMMENT '图书状态',
  `book_count` int(11) NOT NULL COMMENT '图书数量',
  `book_delete` int(11) DEFAULT '0' COMMENT '逻辑删除',
  `borrow_number` int(11) DEFAULT '0' COMMENT '借阅次数',
  `book_language` char(5) DEFAULT NULL COMMENT '图书语言',
  `author_country` char(5) DEFAULT NULL COMMENT '作者国家',
  `book_star` double DEFAULT '5' COMMENT '图书星级',
  PRIMARY KEY (`book_id`),
  KEY `FK_BOOK_REFERENCE_TYPE` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Book` */

insert  into `Book`(`book_id`,`type_id`,`book_name`,`book_author`,`book_info`,`book_image`,`book_address`,`book_status`,`book_count`,`book_delete`,`borrow_number`,`book_language`,`author_country`,`book_star`) values ('1',4,'五号屠场','库尔特·冯内古特','《五号屠场》是一部独特的反战小说。作者在小说中塑造了一个对敌无害、对友无益的患精神分裂症的主人公毕利，通过这个傻乎乎的主人公的独特感受，一方面谴责德国法西斯的残暴，另一方面又抨击了盟国轰炸德累斯顿的野蛮行为，嘲笑人类发动战争是多么愚蠢。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/1.jpg','2A002-56-58','BS002',5,0,10,'LE001','CA006',4.5),('10',4,'厌女：日本的女性嫌恶','上野千鹤子, 王兰','《厌女：日本的女性嫌恶》不是一部纯理论性著作，而是运用女性主义理论针对日本当代的各种社会现象的实践性分析。她运用的理论资源中包括上海三联去年出版的赛吉维克著《男人之间：英国文学与男性同性社会性欲望》，但与那种纯理论性的晦涩论著不同，《厌女》用比较浅近的语言对现象进行了解读。在目前的中国，尚没有一部在理论上很有深度但针对的却是非常具体的现象的性别论著，《厌女》雅俗共赏的特点很可能让它成为知识分子热议的话题书，进而成为关心当代中国性别状况的媒体人、年轻读者追捧的畅销书','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/10.jpg','3A005-56-22','BS002',5,0,1,'LJ006','CJ007',4),('11',8,'夏天、烟火和我的尸体','乙一','竹笼眼、竹笼眼、竹笼眼，笼中的鸟儿 何时何时放天飞，凌晨夜 鹤与龟，摔一跤 背后的孩子、是~谁、沁人心脾的恐惧，令人哑然的结局。更附有精美的青马特刊，多达6篇的试读选段，让喜欢推理、惊悚故事的您大饱眼福！9岁那年，我死了。我被我的好朋友推下了树。睁开眼睛看着弥生和阿健为了藏匿我的尸体而屡次冒险，我的尸体也不免感到紧张。最后的藏匿地点是否安全呢？我的尸体是否真的不会被发现呢？','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/11.jpg','5B012-01-55','BS002',1,0,5,'LJ006','CJ007',5),('12',5,'鲁迅全集','鲁迅','新版《鲁迅全集》由原来的16卷增至18卷，书信、日记各增加了一卷，共计创作10卷，书信4卷，日记3卷，索引1卷，总字数约700万字。与1981年版相比，此次《鲁迅全集》修订集中在三个方面：佚文佚信的增收；原著的文本校勘；注释的增补修改。 ★收文：书信、日记各增加了一卷 此次修订，增收新的佚文23篇，佚信20封，鲁迅致许广平的《两地书》原信68封，鲁迅与增田涉答问函件集编文字约10万字。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/12.jpg','4B006-45-11','BS002',10,0,123,'LC002','CC002',5),('13',7,'克莱因壶','冈岛二人','什么时候你开始怀疑这个世界是假的？日本虚拟现实VR题材开山杰作，超前《盗梦空间》20年！传奇推理作家组合冈岛二人预言之书，以超强的技术预见力，30年前就已完美构想出虚拟现实游戏体验装置！这是一部拥有“噩梦特质”的小说，是一次鲜有的、堪比3D观影、脑洞大开的、深陷其中难以自拔的独特体验。——资深推理人天蝎小猪，上杉彰彦从未如此兴奋——他写的故事被伊普西隆研发公司买下，即将制作成颠覆时代的全新游戏《克莱因2》（Klein 2），并受邀与少女梨纱一同担任游戏测试员。上杉彻底陷入了由K2造就的完美虚拟世界，为它的逼真、超前赞叹不已。然而随着测试过程的深入，伊普西隆公司行事神秘得令他生疑，游戏中更不断听到有人警告他：“快逃！\"与此同时，一个自称是梨纱好友的女孩找到上杉，她说梨纱已失踪多日，音信全无。然而在寻人的过程中，两人都开始怀疑对方在撒谎，因为他们的记忆完全对不上…','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/13.jpg','2A002-55-23','BS002',4,0,12,'LJ006','CJ007',5),('14',7,'香水','帕·聚斯金德','《香水:一个谋杀犯的故事(新版)》是有史以来最畅销的德文小说，它构思奇特，寓意深刻，1985年出版以来，始终高踞德国畅销书排行榜前列，已被译成30余种文字。根据小说改编拍摄的同名电影耗资5000万欧元，全球票房过亿，并获得“德国奥斯卡”——德国电影奖八项提名，且最终获得最佳摄影、美术、剪辑、音响在内的六项大奖。格雷诺耶出生在巴黎最臭的鱼市上。他天生没有体味，而嗅觉却异常灵敏。长大后他成了巴黎一香水大师的学徒，从而也渐渐产生了用香水征服世界的野心。一天，他发现一少女的气味令人着迷，无意中杀死了该少女，并嗅光了她的体香。之后，他先后杀死了26个少女，萃取了她们的体味，并蒸馏出神奇的香水。当他的罪行败露，被押赴刑场时，他释放了一瓶奇特的香水……','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/14.jpg','3A005-45-11','BS002',4,0,32,'LG003','CG003',5),('15',2,'平原上的摩西','双雪涛','作为写作者，我是地道的学徒。回看自己写过的东西，中短篇十几个，大多是过去两年所写，乏善可陈者多之，差强人意者几个，默然自傲者极少，有几个竟极其陌生，好像是他人所做，混到自己的文档里。长篇写了两个，都不真正长，十万字出头：一个类似于中短篇集锦，当时企望能承接《史记》的传统，勉力写人，现在再看，多少有混乱自恋之处；一个向村上春树致敬，想写个综合性的虚构品，于是矫揉造作处多，如同小儿舞着大刀，颠倒手脚。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/15.jpg','5B005-12-11','BS002',5,0,12,'LC002','CC002',4),('1591345956532740096',1,'Going Rogue: Rise and Shine Twenty-Nine','Janet Evanovich','Monday mornings aren’t supposed to be fun, but they should be predictable. However, on this particular Monday, Stephanie Plum knows that something is amiss when she turns up for work at Vinnie’s Bail Bonds to find that longtime office manager Connie Rosolli, who is as reliable as the tides in Atlantic City, hasn’t shown up.','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem%2Fbook%2F1591344555341582336.jpg','2A002-25-57','BS002',5,0,0,'LE001','CA006',3.2),('1591630607931396096',4,'测试','admin','这是测试数据','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem%2Fbook%2F1591630470999953408.jpg','2A002-34-34','BS002',4,1,0,'LF004','CG003',2),('16',7,'生死疲劳','莫言','小说的叙述者，是土地改革时被枪毙的一个地主，他认为自己虽有财富，并无罪恶，因此在阴间里他为自己喊冤。在小说中他不断地经历着六道轮回，一世为驴、一世为牛、一世为猪、一世为狗、一世为猴、一世为人……每次转世为不同的动物，都未离开他的家族，离开这块土地。小说正是通过他的眼睛，准确说，是各种动物的眼睛来观察和体味农村的变革。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/16.jpg','2A002-54-29','BS002',5,0,50,'LC002','CC002',4.8),('17',7,'哈利波特全集','J.K.罗琳','《哈利·波特》（Harry Potter）是英国作家J.K.罗琳（J. K. Rowling）于1997～2007年所著的魔幻文学系列小说，共7部。其中前六部以霍格沃茨魔法学校（Hogwarts School of Witchcraft and Wizardry）为主要舞台，描写的是主人公——年轻的巫师学生哈利·波特在霍格沃茨前后六年的学习生活和冒险故事；第七本描写的是哈利·波特在第二次魔法界大战中在外寻找魂器并消灭伏地魔的故事。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/17.jpg','2A002-54-23','BS002',3,0,20,'LE001','CE001',4.6),('18',7,'云边有个小卖部','张嘉佳','本书讲述了云边镇少年刘十三的成长故事。\r\n少年刘十三自幼与开小卖部的外婆相依为命，努力读书为了离开小镇，追寻远方与梦想。在城市里四处碰壁受挫的刘十三回到了小镇，与少时玩伴程霜重逢。小镇生活平静却暗潮汹涌，一个孤儿，一场婚礼，一场意外，几乎打破了所有人的生活。\r\n\r\n为了完成一个几乎不可能完成的任务，刘十三拼尽全力，却不知道，生命中更重要的正在离自己而去。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/18.jpg','2A002-54-30','BS002',10,0,6,'LC002','CC002',5),('19',1,'毛泽东选集（1-5卷）','毛泽东','《毛泽东选集》是毛泽东思想的重要载体，《毛泽东选集》是毛泽东思想的集中展现，是对20世纪中国影响最大的书籍之一。建国后两个版别的《毛泽东选集》，均由人民出版社出版。《毛泽东选集》在建国前即有大量出版。自1944年晋察冀日报社出版第一部《毛泽东选集》。建国后出版的《毛泽东选集》一至四卷，编入的是毛泽东同志在新民主主义革命时期的主要著作。第一版《毛泽东选集》一至四卷，分别于20世纪50年代初和60年代初出版。1991年7月1日，《毛泽东选集》一至四卷第二版正式出版发行。邓小平同志为新版《毛泽东选集》题写了书名。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/19.jpg','1A001-01-01','BS003',9,0,101,'LC002','CC002',5),('2',7,'金瓶梅(全二册)','兰陵笑笑生','《金瓶梅》是我国第一部文人独立创作的长篇白话世情章回小说，以“禁书”、“奇书”闻名。本书借《水浒传》中武松杀嫂一段故事为引子，写潘金莲未被武松杀死，嫁给西门庆为妾，由此转入小说的主体，通过对西门庆及其家庭罪恶生活的描述，体现当时民间的生活面貌。以市井人物为主要角色，通过多侧面多层次的描写，将明代社会的黑暗腐朽暴露得淋漓尽致。在这一点上，《金瓶梅》远胜过《水浒传》。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/2.jpg','2A002-55-03','BS003',5,0,50,'LC002','CC002',5),('20',6,'认知觉醒','周岭','这是一部可以穿透时间的个人成长方法论。通过“大脑构造、潜意识、元认知”等思维规律，你将真正看清自己；通过“深度学习、关联、反馈”事物规律，你将洞悉如何真正成事！如果对自己不了解，我们就会被人的原始天性束缚，这往往会让我们感到很痛苦。然而，如果了解大脑知识，我们就可以观察并指导自己，运用认知的力量去克服天性，从而获得长久而清晰的内在动力，让我们告别绝大多数人生痛苦。一个人的认知越清晰，行动就越坚定。本书解答了很多问题：为什么我们做事总是急于求成、避难趋易？所谓耐心，就是要“咬牙坚持、死磕到底”吗？如何彻底告别用“三分钟热情”和“打鸡血”的方式做事？如何保持极度专注？如何消除焦虑？如何提高学习能力？……一个人真正的耐心从来不是苦哈哈的毅力支撑，而是具有长远目光的结果。只要了解大脑规律，并知晓诸如“复利效应、舒适区边缘、学习权重比、学习平台期...','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/20.jpg','2A002-02-23','BS002',5,0,2,'LC002','CC002',4.2),('21',6,'起床后的黄金1小时','Benjamin Spall,Michael Xander','64位成功人士不藏私分享 50%成功案例 + 50%獨立思維 = 100%專屬早晨習慣 因為 你 就是最佳解答 ★榮獲2018 亞馬遜商業類最佳書籍選書★ ★榮獲2018 5月《金融時報》商業類選書★ ★榮獲《商業內幕》商業類最佳書籍今夏選書★ 「想過什麼樣的人生，就過什麼樣的早晨！」 我們每天做的小事不但會影響自我成長，也會形塑我們的生活樣貌，決定我們成為什麼樣的人。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/21.jpg','2A002-23-12','BS002',5,0,4,'LE001','CA006',4.3),('22',8,'杀死一只知更鸟','Harper Lee','成长总是个让人烦恼的命题。成长有时会很缓慢，如小溪般唱着叮咚的歌曲趟过，有时却如此突如其来，如暴雨般劈头盖脸……三个孩子因为小镇上的几桩冤案经历了猝不及防的成长——痛苦与迷惑，悲伤与愤怒，也有温情与感动。这是爱与真知的成长经典。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/22.jpg','3A005-45-56','BS002',5,0,1,'LE001','CA006',4.6),('23',4,'silent reading','priest','Childhood, upbringing, family background, social relationships, trauma... We are constantly tracing and searching for the motives of the perpetrators, searching for the most subtle joys, sorrows and sorrows, not to put ourselves in sympathy or even forgive them, not to excuse the crime The reason is not to bow to the so-called complexity of human nature, not to reflect on social contradictions, nor to alienate ourselves into monsters—we are just looking for a justice for ourselves and those who still have expectations for this world. just to deal with.','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/23.jpg','3A005-12-12','BS002',0,0,7,'LE001','CA006',4.2),('24',3,'红玫瑰与白玫瑰','张爱玲','“也许每一个男子全都有过这样的两个女人，至少两个。娶了红玫瑰，久而久之，红的变了墙上的一抹蚊子血，白的还是\"床前明月光\"；娶了白玫瑰，白的便是衣服上沾的一粒饭黏子，红的却是心口上一颗朱砂痣”。因为《红玫瑰与白玫瑰》这句话成了脍炙人口的名言……本书收录了张爱玲1944年的中短篇小说作品。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/24.jpg','3A005-12-54','BS002',4,0,11,'LC002','CC002',5),('25',6,'恋练有词考研英语词汇识记与应用大全','俞敏洪','核心词汇由910组词群构成，每组词群包含一个主词及其形近词或同根词，同时还总结了相关词汇。这样归类可以快速提升同学们的记忆效率，找到每个单词的记忆源头，不再是孤立地记单词，而是形成串联式的记忆。此外，这样的编排也可以帮助同学们更好地辨析形近词和近义词的词义和用法，做到精准记忆。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/25.jpg','2B005-12-54','BS002',4,0,31,'LC002','CC002',3.2),('26',7,'解忧杂货店','东野圭吾','现代人内心流失的东西，这家杂货店能帮你找回——僻静的街道旁有一家杂货店，只要写下烦恼投进卷帘门的投信口，第二天就会在店后的牛奶箱里得到回答。因男友身患绝症，年轻女孩静子在爱情与梦想间徘徊；克郎为了音乐梦想离家漂泊，却在现实中寸步难行；少年浩介面临家庭巨变，挣扎在亲情与未来的迷茫中……他们将困惑写成信投进杂货店，随即奇妙的事情竟不断发生。生命中的一次偶然交会，将如何演绎出截然不同的人生？如今回顾写作过程，我发现自己始终在思考一个问题：站在人生的岔路口，人究竟应该怎么做？我希望读者能在掩卷时喃喃自语：我从未读过这样的小说。——东野圭吾','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/26.jpg','5B002-15-12','BS002',2,0,23,'LJ006','CJ007',5),('27',1,'影响力','Robert Cialdini','自1986年出版以来，作为获得美国心理协会、美国心理学基金会年度大奖提名的西奥迪尼经典著作，本书已经成为史上最强大、最震摄人心、最诡谲的心理学畅销书，24年来，被翻译成26种文字广为传播，全球销量超过300万册。时至今日，本书仍位列亚马逊总排行榜Top400之中，并雄踞消费者行为学和应用心理学类畅销书榜首。也正是在这个畅销版本的基础上，西奥迪尼才衍生出后来为斯坦福大学等多所名校所采用的教材版本。 没有专家解读，没有每章导读，这是一本最原汁原味的《影响力》，醇厚甘甜，久而弥笃。阅读本书仿佛是与西奥迪尼面对面，让你可以细细聆听，在定格的经典中体味无孔不入的影响力。 本书由斩获国家级图书大奖”文津奖”的《牛奶可乐经济学》的译者担纲翻译，语言生动流畅，意趣盎然，西奥迪尼式的诡谲与雄辩惟妙惟肖，跃然纸上。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/27.jpg','1B002-15-23','BS002',5,0,2,'LE001','CA006',4.8),('28',9,'山茶文具店','小川糸','在镰仓，有一家帮人代笔的文具店，每代店主均由女性担任，只要有委托便会接受，即使是餐厅的菜单也会帮忙。不知不觉间，雨宫鸠子成为了第11代传人，而与外祖母之间的误会，以及开始独自一人活在世上的恐惧，使她充满迷茫。给死去宠物的吊唁信、宣布离婚的公告信、拒绝借钱的回绝信、写给挚友的分手信……一封封代笔信是客人们的写实生活，也是一节节人生的课堂。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/28.jpg','2B005-22-13','BS002',5,0,1,'LJ006','CJ007',4.8),('29',1,'秋园','杨本芬','听八旬奶奶讲述她和妈妈的故事。1914年，世上有了“秋园”这个人。1918年，汉语有了“她”这个字。秋园，她来过，挣扎过，绝望过，幸福过。今天，她80岁的女儿，把普普通通的她，讲给世界听。“我写了一位普通中国女性一生的故事，写了我们一家人如何像水中的浮木般挣扎求生，写了中南腹地那些乡间人物的生生死死。我知道自己写出的故事如同一滴水，最终将汇入人类历史的长河。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/29.jpg','3A005-45-12','BS002',5,0,2,'LC002','CC002',4.8),('3',7,'三体全集 （套装共3册）','刘慈欣','《三体》是刘慈欣创作的系列长篇科幻小说，由《三体》、《三体Ⅱ·黑暗森林》、《三体Ⅲ·死神永生》组成，第一部于2006年5月起在《科幻世界》杂志上连载，第二部于2008年5月首次出版，第三部则于2010年11月出版。作品讲述了地球人类文明和三体文明的信息交流、生死搏杀及两个文明在宇宙中的兴衰历程。其第一部经过刘宇昆翻译后获得了第73届雨果奖最佳长篇小说奖 ','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/3.jpg','3E001-98-10','BS002',5,1,20,'LC002','CC002',4.8),('30',7,'局外人','阿尔贝•加缪','“今天妈妈死了。也许是昨天，我不清楚。”我是默尔索，一名普通的公司职员。我爱妈妈，但在葬礼上，我没有哭。第二天回到家，和女朋友玛丽寻欢，事后她问我爱不爱她，我说不爱。结婚前夕，一位刚认识的朋友邀请我去海边玩。途中，我连开五枪，杀死了一个陌生人。入狱后被叛了死刑，我选择不上诉。人们说我冷漠、自私、固执。这或许很荒诞，却是我的真实人生——我就是要活出真实的自己，哪怕成为你眼中的局外人！','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/30.jpg','2B005-15-33','BS002',4,0,3,'LF004','CF004',4.3),('31',1,'罗翔说刑法系列','罗翔','『刑法学讲义』+『刑罚的历史』+『刑法中的同意制度』套装。普法故事会，一起做法治之光）(套装共3册)','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/31.jpg','3A006-56-13','BS002',5,0,2,'LC002','CC002',4.6),('32',7,'清醒','斯文·布林克曼','在加速文化的碾压下，现代人不能坚定自己的立场，找不到自己的立足之处。我们就像转轮里面的仓鼠，拼命努力挣脱现实的牢笼，','https://java-ljw.obs.cn-north-4.myhuaweicloud.com/librarySystem/book/32.jpg','2A002-53-65','BS002',10,0,3,'LE001','CD008',4),('4',9,'明朝那些事儿','当年明月','《明朝那些事儿》主要讲述的是从1344年到1644年这三百年间关于明朝的一些事情，以史料为基础，以年代和具体人物为主线，并加入了小说的笔法，对明朝十七帝和其他王公权贵和小人物的命运进行全景展示，尤其对官场政治、战争、帝王心术着墨最多，并加入对当时政治经济制度、人伦道德的演义。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/4.jpg','4A005-25-34','BS002',5,0,5,'LC002','CC002',4.3),('5',8,'你当像鸟飞往你的山','塔拉·韦斯特弗','人们只看到我的与众不同：一个十七岁前从未踏入教室的大山女孩，却戴上一顶学历的高帽，熠熠生辉。只有我知道自己的真面目：我来自一个极少有人能想象的家庭。我的童年由垃圾场的废铜烂铁铸成，那里没有读书声，只有起重机的轰鸣。不上学，不就医，是父亲要我们坚持的忠诚与真理。父亲不允许我们拥有自己的声音，我们的意志是他眼中的恶魔。哈佛大学，剑桥大学，哲学硕士，历史博士……我知道，像我这样从垃圾堆里爬出来的无知女孩，能取得如今的成就，应当感激涕零才对。但我丝毫提不起热情。我曾怯懦、崩溃、自我怀疑，内心里有什么东西腐烂了，恶臭熏天。直到我逃离大山，打开另一个世界。那是教育给我的新世界，那是我生命的无限可能。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/5.jpg','1A005-25-45','BS002',4,0,6,'LE001','CA006',5),('6',7,'囚鸟','库尔特·冯内古特','我们都是受困于时代的“囚鸟”——既渴望逃离，又踟蹰不前。联邦最低限度安保措施成人改造所里，颓唐的小老头儿瓦尔特•斯代布克正在等待领他出狱的狱卒。在他过去的人生中，他曾是斯拉夫移民的儿子，哈佛大学毕业生，前共产党党员，前联邦政府官员，“水门事件”的涉案者……不久他还将获得一个新的身份，神秘的……','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/6.jpg','1A005-23-44','BS002',5,0,1,'LE001','CA006',4.3),('7',7,'绝叫','叶真中显','某处简陋公寓，发现一具数月前死亡的女性尸体。事后死者被屋中十几只饥饿的猫啃噬，惨不忍睹。经警方初步判定，这个名叫铃木阳子的女人系典型的孤独死，可是负责此案的女警官奥贯绫乃（小西真奈美 饰）却有不同的看法、现场的蛛丝马迹显示，阳子之死另有隐情。镜头回溯，我们看到阳子（尾野真千子 饰）跌宕黯淡的一生，她从小不受母亲待见，长大后独自前往东京发展，为了多卖一份保险饱受凌辱。后来，遇人不淑的阳子邂逅利用游民骗取生活补助的神代武（安田显 饰），由此推开了通往地狱的大门。每走一步，阳子都是在绝望地和过去的自己决裂……','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/7.jpg','2A002-55-56','BS002',5,0,20,'LC002','CC002',4.1),('8',7,'围城','钱锺书','围城故事发生于1920到1940年代。主角方鸿渐是个从中国南方乡绅家庭走出的青年人，迫于家庭压力与同乡周家女子订亲。但在其上大学期间，周氏患病早亡。准岳父周先生被方所写的唁电感动，资助他出国求学。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/8.jpg','2A002-55-25','BS002',10,0,55,'LC002','CC002',5),('9',4,'自私的基因','理查德·道金斯','《自私的基因》是英国演化理论学者理查德·道金斯创作的科普读物，首次出版于1976年。作者在《自私的基因》中提出：人们生来是自私的。人类窥见了社会关系中基本的对称性和逻辑性，在人们有了更充分的理解之后，人们的政治见解当会重新获得活力，并对心理学的科学研究提供理论上的支柱。在这一过程中，人们也必将对自己受苦受难的许多根源有一个更深刻的理解。道金斯在《自私的基因》中的突破性贡献在于，把根据自然选择的社会学说的这一重要部分，用简明通俗的形式，妙趣横生的语言介绍给读者。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/9.jpg','3A005-56-12','BS002',4,0,3,'LE001','CE001',4.2),('test',1,'张三的法外生活','张三','刑法与每个人的生活都密不可分，家庭、校园、职场、人际关系、经济活动处处都有违法犯罪行为，相应地，每个人都需要学习刑法。罗翔让本来枯燥专业的刑法课变得“津津有味”，读者直呼上头，“根本停不下来”。','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/book/1591317104100036608.jpg','2A002-26-57','BS002',1,1,17,'LE001','CA006',1);

/*Table structure for table `BookShelf` */

DROP TABLE IF EXISTS `BookShelf`;

CREATE TABLE `BookShelf` (
  `shelf_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '书架id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `book_id` varchar(50) NOT NULL COMMENT '图书id',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `book_delete` int(11) DEFAULT '0' COMMENT '书架逻辑删除',
  `book_star` int(11) DEFAULT '0' COMMENT '图书评价',
  PRIMARY KEY (`shelf_id`),
  KEY `FK_BOOKSHEL_REFERENCE_USER` (`user_id`),
  KEY `FK_BOOKSHEL_REFERENCE_BOOK` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `BookShelf` */

insert  into `BookShelf`(`shelf_id`,`user_id`,`book_id`,`add_time`,`book_delete`,`book_star`) values (7,1,'2','2022-10-23 14:48:49',1,0),(14,1,'8','2022-10-24 14:39:43',1,0),(17,2,'2','2022-10-26 08:26:55',1,0),(18,2,'8','2022-10-26 08:26:58',1,0),(19,1,'13','2022-10-26 19:55:12',1,0),(20,1,'5','2022-10-27 09:28:26',1,0),(21,2,'11','2022-10-31 10:40:00',0,0),(22,1,'24','2022-11-05 08:44:10',1,0),(23,1,'26','2022-11-05 10:34:39',1,0),(24,1,'11','2022-11-05 10:37:09',1,0),(25,1,'13','2022-11-05 10:37:13',1,0),(26,1,'26','2022-11-05 10:37:17',1,0),(28,1,'23','2022-11-06 23:52:01',1,0),(29,1,'2','2022-11-07 08:30:52',1,0),(30,2,'19','2022-11-09 09:14:36',0,0),(32,1,'31','2022-11-09 10:01:48',1,0),(33,-821387263,'24','2022-11-09 21:24:24',0,0),(34,-821387263,'26','2022-11-09 21:24:49',1,0),(40,1,'5','2022-11-10 09:24:09',1,0),(41,1,'25','2022-11-10 09:25:52',1,0),(42,1,'30','2022-11-10 09:25:59',1,0),(43,-821387263,'23','2022-11-10 10:17:10',1,0),(44,-821387263,'5','2022-11-10 10:19:48',0,0),(45,-821387263,'8','2022-11-10 10:19:48',0,0);

/*Table structure for table `Borrow` */

DROP TABLE IF EXISTS `Borrow`;

CREATE TABLE `Borrow` (
  `borrow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '借阅id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `book_id` varchar(50) NOT NULL COMMENT '图书id',
  `borrow_time` datetime NOT NULL COMMENT '借阅时间',
  `return_time` datetime NOT NULL COMMENT '归还时间',
  `borrow_tatus` char(5) NOT NULL DEFAULT 'BWS01' COMMENT '借阅状态',
  `borrow_delete` int(11) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`borrow_id`),
  KEY `FK_BORROW_REFERENCE_USER` (`user_id`),
  KEY `FK_BORROW_REFERENCE_BOOK` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `Borrow` */

insert  into `Borrow`(`borrow_id`,`user_id`,`book_id`,`borrow_time`,`return_time`,`borrow_tatus`,`borrow_delete`) values (8,1,'8','2022-10-23 14:41:58','2022-12-01 14:41:58','BWS01',1),(9,1,'9','2022-10-23 15:28:20','2022-11-22 15:28:20','BWS02',0),(11,2,'8','2022-10-31 10:53:34','2022-11-30 10:53:34','BWS05',0),(14,1,'23','2022-11-06 23:54:42','2022-12-06 23:54:42','BWS02',0),(21,1,'26','2022-11-09 14:55:11','2022-12-09 14:55:11','BWS03',0),(22,-821387263,'24','2022-11-09 21:28:33','2022-12-09 21:28:33','BWS05',0),(23,1,'19','2022-11-10 08:47:36','2022-12-10 08:47:36','BWS01',0),(24,1,'14','2022-11-10 09:18:25','2022-12-10 09:18:25','BWS01',0),(25,1,'13','2022-11-10 09:20:44','2022-12-10 09:20:44','BWS01',0),(26,1,'5','2022-11-10 09:24:18','2022-12-10 09:24:18','BWS01',0),(27,1,'25','2022-11-10 09:26:02','2022-12-10 09:26:02','BWS01',0),(28,1,'30','2022-11-10 09:26:25','2022-12-10 09:26:25','BWS01',0),(29,-821387263,'23','2022-11-10 10:22:01','2022-12-10 10:22:01','BWS01',0);

/*Table structure for table `Comments` */

DROP TABLE IF EXISTS `Comments`;

CREATE TABLE `Comments` (
  `comments_id` varchar(20) NOT NULL COMMENT '留言id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `book_id` varchar(50) DEFAULT NULL COMMENT '图书id',
  `comments_info` varchar(500) DEFAULT NULL COMMENT '留言内容',
  `delete_comments` int(11) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`comments_id`),
  KEY `FK_COMMENTS_REFERENCE_USER` (`user_id`),
  KEY `FK_COMMENTS_REFERENCE_BOOK` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Comments` */

insert  into `Comments`(`comments_id`,`user_id`,`book_id`,`comments_info`,`delete_comments`) values ('1584368878876798976',1,'8','不知道从何时起，“围城”已经变成了许多人抱怨当下情境的口头禅。“外面的人想进来，里面的人想出去。”这个社会好像已经习惯了这样，或者说人类贪婪的劣根性本就决定了他们无论在什么位置上都是不会满足的。就如同婚姻，当未婚者喊着“不能死无葬身之地”时，总有过来人语重心长的劝“坟墓还是别那么早入为好”。',0),('1584368878876798977',2,'8','看论坛上掐架，说的是鲁迅，王小波，钱钟书，架掐得没个所以然，自然最后又可以被人用仁者见仁智者见智的无聊老话总结过。但是发现有人为鲁迅，王小波反驳，对于钱钟书说的却甚少，许是《围城》很多人看过，但若被人奉上一句不足够伟大，却也让人无话可说，而其他的东西如管锥之类，看得人比较少，真的有人出来挑三捡四，到也无从反驳。不过我自己是比较喜欢《围城》这本书，不是最喜欢，也足够写上两句，想想自己为什么喜欢《围城》的理由，和读到过的别人的感观却不大相同，于是记录下来，也算是一个迟到了十几年的读书笔记。',0),('1584368878876798978',3,'8','这是我第四次读《围城》了，第一次读完《围城》便被钱先生惊人的才华所折服；第二次读是为了把第一次阅读中一些不甚理解的地方细细咀嚼；第三次读，是为了那种一气呵成读完的爽快，而从中却也惊喜的发现之前阅读所忽略的精彩细节。',0),('1584368878876798979',4,'8','十多年前读过《围城》，没有留下什么印象，只记得那个毕业于“克莱登”大学的方鸿渐，工作屡屡受挫，爱情“有心栽花花不发，无心插柳柳成荫”。最近一年来想选择性地读一些书，却发现今日的图书犹如菜市场上的蔬菜，需要仔细挑选才能找到合意的。为节约时间，索性找些经典来读，在此心态下重拾《围城》。作品通过讲述四十年代留学归国的方鸿渐在爱情、事业、家庭等方面的一段经历，以精妙的比喻、辛辣的笔调刻画了抗战环境下一批知识分子的彷徨和空虚，讽刺了人性的弱点和种种丑恶的社会现象，同时也道出了许多人生的哲理。',0),('1584368878876798980',5,'8','就本人的阅历来看，似乎还不怎么够格评价这本书的，然对于字里行间的幽默智慧和人性荒谬，细节刻画之入木，说钱先生眼力独到也好，卖弄文字技巧也好，在精妙之处常难免会心大笑，似乎就在说自己和周围的人。或多或少有所共鸣，在其中能觅到自己的影子。整本小说节奏偏慢，喜情节跌宕的读者不宜。',0),('1589287608383602688',1,'9','初读此书，读起来是很费一番功夫的。但最终读下来之后，不禁让人有再次阅读的冲动。从没想过一本书会彻底地颠覆我对事物重构的看法，不得不称赞作者的学识渊博与科学求知。本书对我最大的震撼就是：人的本能注定是自私自利的。看似我们所有无私的举动都掺杂着自私的动机。因为我们是基因制造的机器，我们都是基因的奴隶，我们的肉身会衰亡，基因却可以世代不朽。而只有极其伟大的人能够超脱于这副凡身肉体。',0);

/*Table structure for table `Constant` */

DROP TABLE IF EXISTS `Constant`;

CREATE TABLE `Constant` (
  `coding` char(5) NOT NULL COMMENT '编码',
  `value` varchar(200) DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`coding`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Constant` */

insert  into `Constant`(`coding`,`value`) values ('ACS01','报名中'),('ACS02','活动进行中'),('ACS03','活动已经结束'),('APS01','报名中'),('APS02','报名成功'),('APS03','报名失败'),('APS04','活动进行中'),('APS05','活动已经结束'),('AS001','正在预约中'),('AS002','预约已结束'),('AS003','预约撤回'),('AS004','预约失败'),('AS005','预约成功'),('ASU01','已激活'),('ASU02','未激活'),('BS001','暂无'),('BS002','可借阅'),('BS003','不可借阅'),('BWS01','正在借阅中'),('BWS02','已归还'),('BWS03','已逾期'),('BWS04','续租中'),('BWS05','归还未确认'),('CA006','美国'),('CC002','中华人民共和国'),('CD008','丹麦'),('CE001','英国'),('CF004','法国'),('CG003','德国'),('CI005','意大利'),('CJ007','日本'),('FS001','已开放'),('FS002','未开放'),('GM001','男'),('GM002','女'),('LC002','中文'),('LE001','英文'),('LF004','法语'),('LG003','德语'),('LI005','意大利语'),('LJ006','日语'),('RS001','未加入图书库'),('RS002','已加入图书库'),('RS003','未找到'),('RS004','取消预定'),('RT001','上午'),('RT002','下午');

/*Table structure for table `Manager` */

DROP TABLE IF EXISTS `Manager`;

CREATE TABLE `Manager` (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `manager_name` varchar(50) NOT NULL COMMENT '管理员姓名',
  `manager_age` int(11) NOT NULL COMMENT '管理员年龄',
  `manager_gender` char(5) NOT NULL COMMENT '管理员性别',
  `manager_telephone` char(11) DEFAULT NULL COMMENT '管理员电话',
  `manager_address` varchar(100) DEFAULT NULL COMMENT '管理员地址',
  `manager_delete` int(11) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `Manager` */

insert  into `Manager`(`manager_id`,`manager_name`,`manager_age`,`manager_gender`,`manager_telephone`,`manager_address`,`manager_delete`) values (1,'张大傻',80,'GM002','15566334558','1362468190@qq.com',0),(2,'Black',22,'GM001','13624563522','东北大学软件学院',0);

/*Table structure for table `ManagerLogin` */

DROP TABLE IF EXISTS `ManagerLogin`;

CREATE TABLE `ManagerLogin` (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `manager_login` varchar(50) NOT NULL COMMENT '管理员登陆账号',
  `manager_passwd` varchar(200) NOT NULL DEFAULT '$2a$10$Xp1rWJfLr.UlymUHs5G27.oDQUXU2vcz6N3pniwYMWhZgoBFKp0V.' COMMENT '管理员密码',
  `permission` int(11) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `ManagerLogin` */

insert  into `ManagerLogin`(`manager_id`,`manager_login`,`manager_passwd`,`permission`) values (1,'admin2','$2a$10$tch14uGU8FPR2wHSJ15IbumlpijbbKPGpFcUHGGW6/iOr0LrmUGeW',1),(2,'test','$2a$10$Xp1rWJfLr.UlymUHs5G27.oDQUXU2vcz6N3pniwYMWhZgoBFKp0V.',2);

/*Table structure for table `Open` */

DROP TABLE IF EXISTS `Open`;

CREATE TABLE `Open` (
  `floor_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '楼层id',
  `floor_name` varchar(50) NOT NULL COMMENT '楼层名称',
  `floor_status` char(5) NOT NULL DEFAULT 'FS001' COMMENT '楼层状态',
  `people_count` int(11) NOT NULL COMMENT '预约人数',
  `time_id` int(11) NOT NULL COMMENT '时间id',
  PRIMARY KEY (`floor_id`),
  KEY `FK_OPEN_REFERENCE_APPOINTM` (`time_id`),
  CONSTRAINT `FK_OPEN_REFERENCE_APPOINTM` FOREIGN KEY (`time_id`) REFERENCES `AppointmentsTime` (`time_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `Open` */

insert  into `Open`(`floor_id`,`floor_name`,`floor_status`,`people_count`,`time_id`) values (1,'一层','FS001',100,1),(2,'二层','FS001',100,3),(3,'三层','FS001',100,3),(4,'四层','FS001',100,1),(5,'五层','FS001',100,1);

/*Table structure for table `Scheduled` */

DROP TABLE IF EXISTS `Scheduled`;

CREATE TABLE `Scheduled` (
  `scheduled_id` varchar(20) NOT NULL COMMENT '预定id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `book_name` varchar(100) DEFAULT NULL COMMENT '图书名称',
  `scheduled_status` char(5) DEFAULT 'RS001' COMMENT '预定状态',
  PRIMARY KEY (`scheduled_id`),
  KEY `FK_SCHEDULE_REFERENCE_USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `Scheduled` */

insert  into `Scheduled`(`scheduled_id`,`user_id`,`book_name`,`scheduled_status`) values ('1584480561142112256',1,'张三的幸福','RS002'),('1587274892995383296',1,'夏日终曲','RS001'),('1587279452849754112',1,'默读','RS004'),('1588345661754114048',1,'破云','RS004'),('1590528720633036800',-821387263,'撒野','RS003');

/*Table structure for table `Type` */

DROP TABLE IF EXISTS `Type`;

CREATE TABLE `Type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书种类id',
  `type_name` varchar(100) NOT NULL COMMENT '种类名称',
  `type_info` varchar(500) DEFAULT NULL COMMENT '种类介绍',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `Type` */

insert  into `Type`(`type_id`,`type_name`,`type_info`) values (1,'社会科学','社科类书籍就是社会科学范围内的书籍。社科是社会科学的简称，是以社会现象为研究对象的科学。它的任务是研究与阐述各种社会现象及其发展规律。社会科学是关于社会事物的本质及其规律的科学。'),(2,'自然科学图书','自然科学的根本目的在于寻找隐藏在自然现象背后的规律，但是自然科学的工作尚不包括研究为什么会存在这些规律。自然科学认为超自然的、随意的和自相矛盾的现象是不存在的。自然科学的最重要的两个支柱是观察和逻辑推理。由对自然的观察和逻辑推理自然科学可以引导出大自然中的规律。假如观察的现象与规律的预言不同，那么要么是因为观察中有错误，要么是因为至此为止被认为是正确的规律是错误的。一个超自然因素是不存在的。'),(3,'中文图书','中文图书'),(4,'外文图书','外文图书'),(5,'普通图书','是一堆带有和主题相关内容的纸张，带有文字或图像。书通常由墨水、纸张、羊皮纸或者其他材料固定在书脊上组成。组成书的一张纸称为一张，一面称为一页。在图书馆信息学中，书被称为专著，以区别于杂志、学术期刊、报纸等连载期刊。所有的书面作品（包括图书）的主体是文学。在小说和一些类型（如传记）中，书可能还要分成卷。对书特别喜爱的人被称为爱书者或藏书家，更随意的称呼是书虫或者书呆子。'),(6,'工具书','工具书指一种在学习中和工作中可以作为工具使用的特定类型的书籍，专供查考资料，以解决工作或学习过程中所遇到的某些疑难问题。这些书籍经过汇集、编著或译述的资料，把相关领域的问题与其有关的知识资料按特定的编排方法汇集在一起，形成特定的编排和检索方式，可以让读者于短时间内查出答案，以供参考。'),(7,'小说','小说是文学的一种样式，一般描写人物故事，塑造多种多样的人物形象，但亦有例外。它是拥有不完整布局、发展及主题的文学作品。而对话是不是具有鲜明的个性，每个人物说的没有独特的语言风格，是衡量小说水准的一个重要标准。与其他文学样式相比，小说的容量较大，它可以细致的展现人物性格和命运，可以表现错综复杂的矛盾冲突，同时还可以描述人物所处的社会生活环境。'),(8,'儿童读物','读经教育是一种主要流行于大中华地区的教育主张。其支持者认为儿童自出生至13岁前是记忆力最好的年龄阶段，通过诵读古今中外最经典的篇章，使少年儿童接触代表人类最高智慧的经典文化，以达到潜移默化儿童性情，培养读书风气，启发儿童潜能，落实文化扎根，目标是使儿童成为有气质的文化人；但在实际操作中，读经教育出现了脱离实际等各种问题。'),(9,'非虚构作品','非虚构作品，即纪实作品，与虚构作品相对，是报告或是任何描述事实的作品总称，'),(10,'专业书','泛指有书籍别于天赋，必须耗费时间经由学习、训练或工作经验，才能获得的能力。通常也会将技术涵盖在“专业技能”之内。'),(11,'手册','手册是汇集某一或若干学科和专业领域的基本知识、数据、术语、概念、原理、数据、图表、公式等内容的工具书或参考资料。手册按其收录的内容可分为综合性手册和专业性手册。综合性手册概括的知识面比较广泛。专业性手册的内容只涉及某一领域的专门知识。');

/*Table structure for table `User` */

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) NOT NULL COMMENT '用户姓名',
  `user_idcard` char(18) NOT NULL COMMENT '用户身份证号',
  `user_gender` char(5) NOT NULL COMMENT '用户性别',
  `user_telephone` char(11) DEFAULT NULL COMMENT '用户电话',
  `user_address` varchar(100) DEFAULT NULL COMMENT '用户住址',
  `user_email` varchar(100) DEFAULT NULL COMMENT '用户邮箱',
  `user_image` varchar(200) DEFAULT 'https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/user_img/def.jpg' COMMENT '用户头像',
  `user_age` int(11) DEFAULT NULL COMMENT '用户年龄',
  `user_birth` date DEFAULT NULL COMMENT '用户生日',
  `leaseRenewalNumber` int(11) DEFAULT '1' COMMENT '续租次数',
  `borrowing_number` int(11) DEFAULT '5' COMMENT '借阅次数',
  `status` char(5) DEFAULT 'ASU02' COMMENT '账号状态',
  `user_delete` int(11) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `User` */

insert  into `User`(`user_id`,`user_name`,`user_idcard`,`user_gender`,`user_telephone`,`user_address`,`user_email`,`user_image`,`user_age`,`user_birth`,`leaseRenewalNumber`,`borrowing_number`,`status`,`user_delete`) values (-821387263,'布莱克','213243200101111232','GM001','13453412345','东北大学','1362468712@qq.com','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/user_img/def.jpg',21,'2001-01-11',1,4,'ASU01',0),(1,'张晓萌','211382200503020014','GM001','15336335998','花果山','cb1362468712@outlook.com','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem%2Fuser_img%2F1589506015188123648.jpg',49,'1973-06-21',0,996,'ASU01',0),(2,'苏家楷','211342200305239842','GM001','13344556778','垃圾堆','1362468712@qq.coom','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/user_img/2.png',66,'2022-10-21',1,2,'ASU01',0),(3,'刘大帅哥','211382195511210010','GM001','15566443775','天宫','2163615907@qq.com','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/user_img/3.jpg',18,'2022-10-30',1,5,'ASU01',0),(4,'徐璞石','210133199805231734','GM001','13642567356','辽工','3070806877@qq.com','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/user_img/def.jpg',34,'1990-05-23',1,5,'ASU02',0),(5,'关雅文','210134200103232836','GM001','16354267432','北五','1797495190@qq.com','https://java-ljw.obs.cn-north-4.myhuaweicloud.com:443/librarySystem/user_img/def.jpg',20,'2001-03-23',1,5,'ASU02',0);

/*Table structure for table `UserAppointments` */

DROP TABLE IF EXISTS `UserAppointments`;

CREATE TABLE `UserAppointments` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预约id',
  `floor_id` int(11) NOT NULL COMMENT '楼层id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `appointment_time` datetime NOT NULL COMMENT '预约时间',
  `appointments_status` char(5) NOT NULL DEFAULT 'AS005' COMMENT '当前预约状态',
  `appointments_createTime` datetime DEFAULT NULL COMMENT '创建预约时间',
  `seatName` varchar(50) DEFAULT NULL COMMENT '座位名称',
  PRIMARY KEY (`appointment_id`),
  KEY `FK_USERAPPO_REFERENCE_OPEN` (`floor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `UserAppointments` */

insert  into `UserAppointments`(`appointment_id`,`floor_id`,`user_id`,`appointment_time`,`appointments_status`,`appointments_createTime`,`seatName`) values (1,1,1,'2022-10-29 12:00:00','AS002','2022-10-29 09:26:44','E-1'),(3,2,2,'2022-10-29 12:00:00','AS002','2022-10-29 16:59:54','E-2'),(4,1,2,'2022-10-30 09:25:46','AS002','2022-10-30 09:25:50','E-2'),(5,1,2,'2022-10-30 08:00:00','AS002','2022-10-30 10:52:26','E-2'),(6,1,2,'2022-10-30 08:00:00','AS002','2022-10-30 10:55:16','E-2'),(7,1,3,'2022-10-30 09:00:00','AS002','2022-10-30 14:24:16','E-14'),(8,1,3,'2022-10-30 08:00:00','AS002','2022-10-30 17:27:38','A-3'),(9,2,4,'2022-10-30 11:00:00','AS003','2022-10-30 17:28:10','A-2'),(10,1,2,'2022-10-31 08:00:00','AS002','2022-10-31 08:27:29','A-0'),(11,1,1,'2022-10-31 08:00:00','AS002','2022-10-31 08:28:29','A-1'),(12,1,2,'2022-10-31 08:00:00','AS002','2022-10-31 08:31:48','A-2'),(13,1,1,'2022-10-31 08:00:00','AS002','2022-10-31 09:41:25','A-4'),(14,2,1,'2022-11-02 11:00:00','AS003','2022-11-02 14:21:27','B-17'),(15,5,1,'2022-11-02 13:00:00','AS002','2022-11-02 15:43:07','B-4'),(16,4,1,'2022-11-03 11:00:00','AS003','2022-11-03 17:55:57','C-4'),(17,1,1,'2022-11-04 08:00:00','AS002','2022-11-04 14:37:13','A-5'),(18,1,1,'2022-11-04 08:00:00','AS003','2022-11-04 15:48:58','B-5'),(19,1,1,'2022-11-09 08:00:00','AS003','2022-11-09 09:39:59','A-4'),(20,2,1,'2022-11-09 09:00:00','AS002','2022-11-09 11:38:06','A-5'),(21,2,1,'2022-11-09 09:00:00','AS003','2022-11-09 14:09:35','B-16'),(22,3,1,'2022-11-09 09:00:00','AS003','2022-11-09 14:16:26','B-6'),(23,1,1,'2022-11-09 08:00:00','AS003','2022-11-09 14:17:10','D-5'),(24,4,1,'2022-11-09 10:00:00','AS003','2022-11-09 14:19:23','B-4'),(26,1,1,'2022-11-09 09:00:00','AS003','2022-11-09 21:34:19','B-4'),(27,1,1,'2022-11-09 08:00:00','AS003','2022-11-09 21:34:45','A-5'),(28,1,1,'2022-11-09 09:00:00','AS003','2022-11-09 21:36:00','B-5'),(29,1,1,'2022-11-09 09:00:00','AS003','2022-11-09 21:36:40','A-5'),(30,1,1,'2022-11-09 09:00:00','AS003','2022-11-09 21:39:22','B-5'),(31,1,1,'2022-11-09 08:00:00','AS003','2022-11-09 21:40:41','A-4'),(32,2,1,'2022-11-09 09:00:00','AS003','2022-11-09 21:41:16','B-5'),(33,1,1,'2022-11-10 08:00:00','AS002','2022-11-10 10:56:47','B-5'),(34,1,3,'2022-11-10 08:00:00','AS003','2022-11-10 10:58:29','B-15');

/*Table structure for table `UserLogin` */

DROP TABLE IF EXISTS `UserLogin`;

CREATE TABLE `UserLogin` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_login` varchar(50) NOT NULL COMMENT '登录账号',
  `user_passwd` varchar(300) NOT NULL COMMENT '登陆密码',
  `permission` int(11) DEFAULT '1' COMMENT '权限',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2110500866 DEFAULT CHARSET=utf8;

/*Data for the table `UserLogin` */

insert  into `UserLogin`(`user_id`,`user_login`,`user_passwd`,`permission`) values (-821387263,'Bei','$2a$10$Xp1rWJfLr.UlymUHs5G27.oDQUXU2vcz6N3pniwYMWhZgoBFKp0V.',1),(1,'user_1','$2a$10$5KBiHsHpkpk05NzaE4UbRuEDgjRLVig7C0muodtL2NW2TCce6ffj6',1),(2,'user_2','$2a$10$ZIV/AYoQzTiAAVr8vVT4iOTEP1v595RIhaPBVX76mrQSksoqVLbTK',1),(3,'user_3','$2a$10$ZIV/AYoQzTiAAVr8vVT4iOTEP1v595RIhaPBVX76mrQSksoqVLbTK',1),(4,'user_4','$2a$10$ZIV/AYoQzTiAAVr8vVT4iOTEP1v595RIhaPBVX76mrQSksoqVLbTK',1),(5,'user_5','$2a$10$ZIV/AYoQzTiAAVr8vVT4iOTEP1v595RIhaPBVX76mrQSksoqVLbTK',1);

/*Table structure for table `activity` */

DROP TABLE IF EXISTS `activity`;

CREATE TABLE `activity` (
  `activityId` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `activityName` varchar(200) DEFAULT NULL COMMENT '活动名称',
  `activityTypeId` int(11) DEFAULT NULL COMMENT '活动种类id',
  `activityInfo` varchar(3000) DEFAULT NULL COMMENT '活动信息',
  `activityOrganizer` varchar(200) DEFAULT NULL COMMENT '活动举办方',
  `activityDate` datetime DEFAULT NULL COMMENT '活动截至日期',
  `activityApplication` datetime DEFAULT NULL COMMENT '报名截止日期',
  `activityAge` int(11) DEFAULT NULL COMMENT '活动要求年龄',
  `activityStatus` char(5) DEFAULT 'ACS01' COMMENT '活动状态',
  `activityDelete` int(11) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`activityId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `activity` */

insert  into `activity`(`activityId`,`activityName`,`activityTypeId`,`activityInfo`,`activityOrganizer`,`activityDate`,`activityApplication`,`activityAge`,`activityStatus`,`activityDelete`) values (1,'亲子贴贴乐',1,'父母和孩子一起玩贴一贴游戏，当在规定时间内贴一贴次数最高获胜','[\"腾讯\",\"小米\"]','2022-10-27 10:18:13','2022-10-25 10:18:19',12,'ACS03',0),(2,'读者见面会',1,'读者见面交流','[\"腾讯\",\"小米\"]','2022-11-01 14:16:21','2022-11-01 15:17:23',13,'ACS03',0),(9,'关于元宇宙',1,'元宇宙','1','2022-11-19 00:00:00','2022-11-18 00:00:00',10,'ACS01',1),(10,'关于元宇宙',1,'元宇宙','1','2022-11-30 00:00:00','2022-11-28 00:00:00',10,'ACS01',1),(11,'关于元宇宙',1,'元宇宙','1','2022-11-29 00:00:00','2022-11-27 00:00:00',10,'ACS01',1),(12,'关于元宇宙',1,'元宇宙','[\"华为\"]','2022-11-30 00:00:00','2022-11-28 00:00:00',10,'ACS01',0);

/*Table structure for table `activityType` */

DROP TABLE IF EXISTS `activityType`;

CREATE TABLE `activityType` (
  `activityTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动种类Id',
  `activityTypeName` varchar(300) DEFAULT NULL COMMENT '种类名称',
  `activityTypeInfo` varchar(500) DEFAULT NULL COMMENT '种类介绍',
  PRIMARY KEY (`activityTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `activityType` */

insert  into `activityType`(`activityTypeId`,`activityTypeName`,`activityTypeInfo`) values (1,'文化活动','传播中国传统文化');

/*Table structure for table `application` */

DROP TABLE IF EXISTS `application`;

CREATE TABLE `application` (
  `applicationId` varchar(100) NOT NULL COMMENT '报名id',
  `userId` int(11) DEFAULT NULL COMMENT '用户Id',
  `applicationStatus` char(5) DEFAULT 'APS01' COMMENT '报名状态',
  `activityId` int(11) DEFAULT NULL COMMENT '活动id',
  PRIMARY KEY (`applicationId`),
  KEY `FK_APPLICAT_REFERENCE_ACTIVITY` (`activityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `application` */

insert  into `application`(`applicationId`,`userId`,`applicationStatus`,`activityId`) values ('1587337656975724544',1,'APS03',2),('2',2,'APS03',1);

/*Table structure for table `bookTag` */

DROP TABLE IF EXISTS `bookTag`;

CREATE TABLE `bookTag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tag_value` varchar(20) DEFAULT NULL COMMENT '标签值',
  `tag_delete` int(11) DEFAULT '0' COMMENT '逻辑删除',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `bookTag` */

insert  into `bookTag`(`tag_id`,`tag_value`,`tag_delete`,`user_id`) values (1,'言情',0,NULL),(2,'爱情',1,NULL),(3,'纯情\n',0,NULL),(4,'历史',0,NULL),(5,'推理',0,NULL),(6,'青春',0,NULL),(7,'暴力',0,NULL),(8,'黄色',0,NULL),(9,'温馨',0,NULL),(34,'血腥',0,2),(35,'恐怖',1,-821387263),(36,'英文',0,1),(37,'生活',0,NULL),(38,'恐怖',0,NULL),(45,'纪实',1,NULL),(46,'学习',1,NULL),(47,'学习',1,NULL);

/*Table structure for table `bookTap` */

DROP TABLE IF EXISTS `bookTap`;

CREATE TABLE `bookTap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` varchar(50) DEFAULT NULL COMMENT '图书id',
  `tapId` int(11) DEFAULT NULL COMMENT '标签id',
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;

/*Data for the table `bookTap` */

insert  into `bookTap`(`id`,`bookId`,`tapId`,`userId`) values (67,'1',2,NULL),(68,'2',2,NULL),(69,'3',2,NULL),(70,'4',2,NULL),(155,'8',4,NULL),(156,'2',4,NULL),(157,'31',4,NULL),(158,'31',38,NULL),(159,'25',46,NULL),(166,'25',47,NULL),(167,'8',37,NULL);

/*Table structure for table `moduleInfo` */

DROP TABLE IF EXISTS `moduleInfo`;

CREATE TABLE `moduleInfo` (
  `module_id` int(11) NOT NULL COMMENT '模块id',
  `name` varchar(50) NOT NULL COMMENT '模块名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `moduleInfo` */

insert  into `moduleInfo`(`module_id`,`name`) values (1,'图书管理'),(2,'留言、预定管理'),(3,'借阅管理'),(4,'编码管理'),(5,'活动管理'),(6,'楼层管理'),(7,'座位管理'),(8,'权限管理'),(9,'人员管理'),(10,'基本权限');

/*Table structure for table `roleInfo` */

DROP TABLE IF EXISTS `roleInfo`;

CREATE TABLE `roleInfo` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(50) NOT NULL COMMENT '权限名称',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `roleInfo` */

insert  into `roleInfo`(`role_id`,`name`) values (1,'超级管理员'),(2,'图书管理员'),(3,'保洁');

/*Table structure for table `roleModule` */

DROP TABLE IF EXISTS `roleModule`;

CREATE TABLE `roleModule` (
  `role_id` int(11) NOT NULL COMMENT '权限id',
  `module_id` int(4) NOT NULL COMMENT '模块id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `roleModule` */

insert  into `roleModule`(`role_id`,`module_id`) values (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(2,1),(2,2),(2,3),(3,6),(3,7),(1,9),(1,10);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
