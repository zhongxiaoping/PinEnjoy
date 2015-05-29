drop table if exists t_emailCheck;
CREATE TABLE t_emailCheck (
  emailCheck_id VARCHAR(32) NOT NULL,
  emailCheck_accountNickname VARCHAR(198) NOT NULL,
  emailCheck_code VARCHAR(32) NOT NULL,
  emailCheck_generateTime DATETIME NOT NULL,
	PRIMARY KEY (emailCheck_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create index idx_t_emailCheck_emailCheck_id on t_emailCheck(emailCheck_id);

DROP TABLE IF EXISTS t_guest;
CREATE TABLE t_guest (
  guest_id VARCHAR(32) NOT NULL,
  guest_lastVisitedTime DATETIME NOT NULL,
  guest_accountThumb VARCHAR(1024),
  guest_guestAccountNickname VARCHAR(198) NOT NULL,
  guest_homeAccountNickname VARCHAR(198) NOT NULL,
  PRIMARY KEY (guest_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO t_guest VALUES ('41ae5bb32c3f4d1fac3a7da8902356da', '2015-05-28 22:59:12', 'static/image/user/taylorThumb.png', '泰勒斯威夫特', '黄家驹');
INSERT INTO t_guest VALUES ('41be5bb31c3f4d1fac3a7da8902356da', '2015-05-28 22:59:12', 'static/image/user/wb.png', '伍佰', '黄家驹');
INSERT INTO t_guest VALUES ('41de5bb31c3f4d1fac3a7da8902356da', '2015-05-28 22:59:12', 'static/image/user/lennon.png', '约翰列侬', '黄家驹');
INSERT INTO t_guest VALUES ('41cd5bb30c3f4d1fac3a7da8902356da', '2015-05-28 22:59:12', 'static/image/user/zjl.png', '周杰伦', '黄家驹');

drop table if exists t_account;
CREATE TABLE t_account (
  account_id VARCHAR(32) NOT NULL COMMENT '用户Id',
  account_nickname VARCHAR(198) NOT NULL,
  account_password VARCHAR(198) NOT NULL,
  account_email VARCHAR(198) NOT NULL,
  account_birthday DATE,
  account_resume VARCHAR(1024),
  account_sex VARCHAR(72),
  account_thumb VARCHAR(1024),
  account_registerTime DATETIME NOT NULL,
  account_lastLoginTime DATETIME,
  account_isLock BOOLEAN DEFAULT TRUE,
  account_fansCount INT UNSIGNED,
  account_uploadImageCount INT UNSIGNED,
  account_collectImageIds varchar(1024),
  account_subscribeCount INT UNSIGNED,
  account_publishIds VARCHAR(1024),
  account_subscribeIds VARCHAR(1024),
  account_roleIds VARCHAR(1024),
  PRIMARY KEY (account_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create index idx_t_account_account_id on t_account(account_id);

INSERT INTO t_account VALUES ('41ce5bb34c3f4d1fac3a7da8902356db', '黄家驹', 'D04F4BB993849D4697B35C7EE8D4D00C', 'tianex163@163.com', '1962-6-10', '大家好，我叫黄家驹，来自香港，beyond乐队成员，一个已经去世了22年了的男人，感谢PinEnjoy让我复活....',
            '男', 'static/image/user/sky.jpg', '2015-05-28 22:49:12', NULL, FALSE, 1, 8, NULL, 0, NULL, NULL, NULL);
INSERT INTO t_account VALUES ('522a39ce7d1f4b1b9c26e82f77ce1e42', '周杰伦', '4CAB42F6F5DC7901A9F2C102A1ED23EF', 'alibaba@163.com', '1979-1-18', '出生于台湾新北市，华语流行男歌手、词曲创作人、制作人、演员、MV及电影导演、编剧及监制....',
                              '男', 'static/image/user/zjl.png', '2015-05-28 22:59:12', NULL, FALSE, 1, 4, NULL, 0, NULL, NULL, NULL);
INSERT INTO t_account VALUES ('41de5bb34c3f4d1fac3a7da8902356db', '泰勒斯威夫特', 'D04F4BB993849D4697B35C7EE8D4D00C', '2818087568@qq.com', '1989-12-13', '入选美国《时代》周刊“2014年度人物”的最终候选人,获颁第50届乡村音乐学院奖“最高荣誉”成就奖....',
                              '女', 'static/image/user/taylorThumb.png', '2015-05-28 23:49:12', NULL, FALSE, 1, 6, NULL, 0, NULL, NULL, NULL);
INSERT INTO t_account VALUES ('42ce5bb34c3f4d1fac3a7da8902386db', '伍佰', 'D04F4BB993849D4697B35C7EE8D4D00C', 'huawei@gmail.com', '1968-1-14', '长大后，他做过业务员、卖过保险、摆过地摊，但在一次偶然看到乐器行的征人启事，才成为了一名音乐人....',
                              '男', 'static/image/user/wb.png', '2015-05-18 22:49:12', NULL, FALSE, 1, 2, NULL, 0, NULL, NULL, NULL);
INSERT INTO t_account VALUES ('48ce5bb34c3f4d1fac3a7da8909256db', '约翰列侬', 'D04F4BB993849D4697B35C7EE8D4D00C', 'zte@163.com', '1940-10-9', '英国摇滚乐队“披头士”成员，摇滚音乐家，诗人，社会活动家, 入选《滚石》杂志评出的历史上最伟大的50位流行音乐家....',
                              '男', 'static/image/user/lennon.png', '2015-04-28 22:49:12', NULL, FALSE, 1, 7, NULL, 0, NULL, NULL, NULL);
INSERT INTO t_account VALUES ('44ce5bb44c3f4d1fac3a7da8902356db', '邵逸夫', 'D04F4BB993849D4697B35C7EE8D4D00C', 'dji@163.com', '1907-11-19', '香港电视广播有限公司荣誉主席，邵氏兄弟电影公司的创办人之一....',
                              '男', 'static/image/user/syf.png', '2015-05-21 22:49:12', NULL, FALSE, 1, 7, NULL, 0, NULL, NULL, NULL);
INSERT INTO t_account VALUES ('47ce5bb34c7f4d1fac3a7da8902366db', '李小文', 'D04F4BB993849D4697B35C7EE8D4D00C', 'lenovo@foxmail.com', '1947-03-02', 'Li-Strahler几何光学学派的创始人，成名作被列入国际光学工程协会“里程碑系列”，在国内外遥感界享有盛誉....',
                              '男', 'static/image/user/lxw.png', '2015-05-20 22:49:12', NULL, FALSE, 1, 7, NULL, 0, NULL, NULL, NULL);

                                
drop table if exists t_image;
CREATE TABLE t_image (
  image_id VARCHAR(32) NOT NULL,
  image_title VARCHAR(1024) NOT NULL,
  image_description VARCHAR(1024),
  image_catalogeName VARCHAR(1024),
  image_score INT UNSIGNED,
  image_likeCount INT UNSIGNED,
  image_shareCount INT UNSIGNED,
  image_disLikeCount INT UNSIGNED,
  image_downloadCount INT UNSIGNED,
  image_collectCount INT UNSIGNED,
  image_location VARCHAR(1024) NOT NULL,
  image_uploadTime DATETIME NOT NULL,
  image_checked BOOLEAN DEFAULT FALSE,
  image_accountNickname VARCHAR(198) NOT NULL,
  image_accountThumb VARCHAR(1024),
  image_isAutoDelete BOOLEAN DEFAULT FALSE,
  image_autoDeleteTime DATETIME,
  PRIMARY KEY (image_id)
) ENGINE=innoDB DEFAULT CHARSET=utf8;

create index idx_t_image_image_id on t_image(image_id);
create index idx_t_image_image_accountNickname on t_image(image_accountNickname);

INSERT INTO t_image VALUES ('c427d67ad9b946c2a4f13ade5ae2e43a', 'DJI Phantom 2 Vision 首发', '多旋翼控制系统及地面站系统，禅思系列高精工业云台，筋斗云系列多旋翼航拍飞行器，包含了高清数字图传的如来系列手持控制一体机',
                            '科技', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '李小文', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c415d67ad9b946c2a4f13ade5ae2e43a', '华为Mate7采用麒麟K925处理器', '采用6英寸跨界屏幕尺寸，不过为超窄边框设计，同时机身也更薄仅为7.9毫米，它采用了一体化机身设计，并使用了航空铝材质，握持感无疑会有很大改善',
                            '科技', 88, 333, 13, 0, 16, 47, 'static/image/user/haiweimate.png', '2015-05-21 22:49:12', TRUE, '李小文', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d97ad9b946c2a4f13ade5ae2e43a', '联想IdeaPad Yoga', '联想Yoga系列包含Yoga13、Yoga11、Yoga11s三款产品',
                            '科技', 77, 301, 13, 0, 10, 17, 'static/image/user/yoga.png', '2015-05-20 12:49:12', TRUE, '李小文', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d17ad9b946c2a4f13ade5ae2e43a', '乐高EV3机器人', 'EV3配备了一块“智能砖头”，用户可以使用它来对自己的机器人编辑各种指令。而在过去，使用者只能通过计算机来进行该操作',
                            '科技', 10, 14, 9, 0, 9, 5, 'static/image/user/ev3.png', '2015-05-20 22:49:12', TRUE, '李小文', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d61ad9b946c2a4f13ade5ae2e43a', '索尼PS4', '索尼的最新一代游戏机。PS4拥有5倍于电脑APU-7850k的超强大APU处理器，使得PS4的大部分游戏都能输出原生1080p分辨率',
                            '科技', 20, 74, 13, 0, 16, 37, 'static/image/user/sonyps4.png', '2015-05-24 9:19:12', TRUE, '李小文', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b146c2a4f13ade5ae2e43a', '3D打印机', '不仅可以“打印”一幢完整的建筑，甚至可以在航天飞船中给宇航员打印任何所需的物品的形状',
                            '科技', 16, 24, 13, 0, 9, 22, 'static/image/user/3dprinter.png', '2015-05-22 22:49:12', TRUE, '李小文', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b910c2a4f13ade5ae2e43a', '航模', '航空模型是一种重于空气的，有尺寸限制的，带有或不带有发动机的，不能载人的航空器',
                            '科技', 100, 244, 23, 0, 36, 57, 'static/image/user/hangmo.png', '2015-05-20 22:49:12', TRUE, '李小文', 'static/image/user/lxw.png', FALSE, NULL);

INSERT INTO t_image VALUES ('c417d67ad9b946c1a4f13ade5ae2e43a', '万里长城', '八达岭长城, 位于北京市延庆县军都山关沟古道北口',
                            '人文', 200, 544, 123, 0, 156, 177, 'static/image/user/greatWall.png', '2015-05-20 22:49:12', TRUE, '黄家驹', 'static/image/user/sky.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b946c3a4f13ade5ae2e43a', '世界七大奇迹', '埃及现存金字塔八十座，其中最大的一座金字塔是在公元前2600年左右建成的吉札金字塔，全都是由人工建成',
                            '人文', 100, 344, 23, 0, 56, 77, 'static/image/user/gold.png', '2015-05-20 22:49:12', TRUE, '黄家驹', 'static/image/user/sky.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b946c2a5f13ade5ae2e43a', '珠穆朗玛峰', '珠穆朗玛峰是喜马拉雅山脉的主峰，位于中国与尼泊尔两国边界上，它的北坡在中国青藏高原境内，南坡在尼泊尔境内',
                            '人文', 100, 344, 23, 0, 56, 77, 'static/image/user/zmlmf.png', '2015-05-20 23:49:12', TRUE, '黄家驹', 'static/image/user/sky.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d65ad9b946c2a4f13ade5ae2e43a', '夜晚的咖啡馆', '作品预示了超现实主义用透视作为幻想表现手段的探索，但是没有一种探索，能有如此震撼人心的力量',
                            '人文', 100, 344, 23, 0, 56, 77, 'static/image/user/ywcafe.png', '2015-05-23 22:49:12', TRUE, '黄家驹', 'static/image/user/sky.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d68ad9b946c2a4f13ade5ae2e43a', '有乌鸦的麦田', '这幅画是以黑暗，严酷的天空显示了梵高的精神状态的困扰，与徘徊不决的通往不同方向的三种途径，与黑色乌鸦架空的预示死亡迹象',
                            '人文', 100, 344, 23, 0, 56, 77, 'static/image/user/ywy.png', '2015-05-20 22:49:12', TRUE, '黄家驹', 'static/image/user/sky.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b946c2a4f18ade5ae2e43a', '黄山文笔峰', '老笔纵横，苍劲有力，以赭色浓重施于山体阳面，多以皴擦为之',
                            '人文', 100, 344, 23, 0, 56, 77, 'static/image/user/hswbf.png', '2015-05-20 22:49:12', TRUE, '黄家驹', 'static/image/user/sky.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b946c2a4f98ade5ae2e43a', '金笺峨嵋记青山中花', '泼彩山水图',
                            '人文', 100, 344, 23, 0, 56, 77, 'static/image/user/zdq.png', '2015-05-20 22:49:12', TRUE, '黄家驹', 'static/image/user/sky.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b946c2a4f19ade5ae2e43a', '田横五百士', '徐悲鸿的成名大作, 选取了田横与五百壮士惜别的戏剧性场景来表现',
                            '人文', 100, 344, 23, 0, 56, 77, 'static/image/user/thang.png', '2015-05-20 22:49:12', TRUE, '黄家驹', 'static/image/user/sky.png', FALSE, NULL);

INSERT INTO t_image VALUES ('c417d67ad9b946c2a4f10ade5ae2e43a', '听宋', '哎呦，这个屌哟! 其内容似乎是描写宋代伟大的爱国将领岳飞',
                            '音乐', 55, 344, 23, 0, 56, 77, 'static/image/user/tingsong.png', '2015-05-20 22:49:12', TRUE, '周杰伦', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c117d67ad9b946c2a4f13ade5ae2e43a', '入殓师', '哎呦，这个屌哟! 心动奇迹 玛丽和三只小狗的故事',
                            '音乐', 41, 344, 23, 0, 56, 77, 'static/image/user/ryanshi.png', '2015-05-20 22:49:12', TRUE, '周杰伦', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c517d67ad9b946c2a4f13ade5ae6e43a', '机甲创世纪', '获得第81届奥斯卡金像奖最佳外语片奖',
                            '音乐', 32, 233, 23, 0, 56, 77, 'static/image/user/shijiur.png', '2015-05-20 22:49:12', TRUE, '周杰伦', 'static/image/user/lxw.png', FALSE, NULL);

drop table if exists t_cataloge;
CREATE TABLE t_cataloge (
  cataloge_id VARCHAR(32) NOT NULL,
  cataloge_name VARCHAR(1024) NOT NULL,
  cataloge_thumb VARCHAR(1024),
  cataloge_description VARCHAR(1024),
  PRIMARY KEY (cataloge_id)
) ENGINE=innoDB DEFAULT CHARSET=utf8;

INSERT INTO t_cataloge VALUES ('a417d67ad9b946c2a4f10ade5ae2e43a', '音乐', 'static/image/user/musicThumb.png', '音乐是反映人类现实生活情感的一种艺术');
INSERT INTO t_cataloge VALUES ('a317d67ad9b946c2a4f10ade5ae2e43a', '科技', 'static/image/user/techThumb.png', '科技是指科学与技术的融合而形成的概念');
INSERT INTO t_cataloge VALUES ('a417d69ad9b946c2a4f10ade5ae2e43a', '风景', 'static/image/user/lookThumb.png', '供观赏的自然风光、景物，包括自然景观和人文景观');
INSERT INTO t_cataloge VALUES ('a416d67ad9b946c2a4f10ade5ae2e43a', '人文', 'static/image/user/culThumb.png', '人文就是人类文化中的先进部分和核心部分，即先进的价值观及其规范');
INSERT INTO t_cataloge VALUES ('a417d68ad9b946c2a4f10ade5ae2e93a', '美女', 'static/image/user/beautyThumb.png', '中国古代关于美女的形容词和诗词歌赋众多，形成了丰富的美学资料');
INSERT INTO t_cataloge VALUES ('a417d68ad9b946c2a4f10ade5ae2e43a', '其他', 'static/image/user/otherThumb.png', '');


drop table if exists t_role;
create table t_role (
  role_id VARCHAR(32) NOT NULL,
  role_label varchar(127),
  role_description varchar(127),
  role_resourceIds varchar(127),
  role_available BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (role_id)
) ENGINE=innoDB DEFAULT CHARSET=utf8;
create index idx_t_role_resource_ids on t_role(role_resourceIds);

insert into t_role values('1', 'admin', '超级管理员', '21,31,41', true);

drop table if exists t_resource;
create table t_resource (
  resource_id VARCHAR(32) NOT NULL,
  resource_name VARCHAR(127),
  resource_permission VARCHAR(127),
  resource_available BOOLEAN DEFAULT FALSE,
  resource_url VARCHAR(1024),
  PRIMARY KEY (resource_id)
) ENGINE=innoDB DEFAULT CHARSET=utf8;

insert into t_resource values('1', '资源', '', true, null);

insert into t_resource values('21', '用户管理', 'user:*', true, null);
insert into t_resource values('22', '用户新增', 'user:create', true, null);
insert into t_resource values('23', '用户修改', 'user:update', true, null);
insert into t_resource values('24', '用户删除', 'user:delete', true, null);
insert into t_resource values('25', '用户查看', 'user:view', true, null);

insert into t_resource values('31', '资源管理', 'resource:*', true, null);
insert into t_resource values('32', '资源新增', 'resource:create', true, null);
insert into t_resource values('33', '资源修改', 'resource:update', true, null);
insert into t_resource values('34', '资源删除', 'resource:delete', true, null);
insert into t_resource values('35', '资源查看', 'resource:view', true, null);

insert into t_resource values('41', '角色管理', 'role:*', true, null);
insert into t_resource values('42', '角色新增', 'role:create', true, null);
insert into t_resource values('43', '角色修改', 'role:update', true, null);
insert into t_resource values('44', '角色删除', 'role:delete', true, null);
insert into t_resource values('45', '角色查看', 'role:view', true, null);




