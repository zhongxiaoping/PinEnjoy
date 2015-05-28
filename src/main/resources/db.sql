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

drop table if exists t_account;
CREATE TABLE t_account (
  account_id VARCHAR(32) NOT NULL COMMENT '�û�Id',
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

INSERT INTO t_account VALUES ('41ce5bb34c3f4d1fac3a7da8902356db', '�ƼҾ�', 'D04F4BB993849D4697B35C7EE8D4D00C', 'tianex163@163.com', '1962-6-10', '��Һã��ҽлƼҾԣ�������ۣ�beyond�ֶӳ�Ա��һ���Ѿ�ȥ����22���˵����ˣ���лPinEnjoy���Ҹ���....',
            '��', 'static/image/user/sky.jpg', '2015-05-28 22:49:12', NULL, FALSE, 1, 7, NULL, 0, NULL, NULL, NULL);
INSERT INTO t_account VALUES ('522a39ce7d1f4b1b9c26e82f77ce1e42', '�ܽ���', '4CAB42F6F5DC7901A9F2C102A1ED23EF', 'alibaba@163.com', '1979-1-18', '������̨���±��У����������и��֡����������ˡ������ˡ���Ա��MV����Ӱ���ݡ���缰����....',
                              '��', 'static/image/user/zjl.png', '2015-05-28 22:59:12', NULL, FALSE, 1, 4, NULL, 0, NULL, NULL, NULL);
INSERT INTO t_account VALUES ('41ce5bb34c3f4d1fac3a7da8902356db', '̩��˹������', 'D04F4BB993849D4697B35C7EE8D4D00C', '2818087568@qq.com', '1989-12-13', '��ѡ������ʱ�����ܿ���2014�����������պ�ѡ��,����50���������ѧԺ��������������ɾͽ�....',
                              'Ů', 'static/image/user/taylorThumb.png', '2015-05-28 23:49:12', NULL, FALSE, 1, 6, NULL, 0, NULL, NULL, NULL);
INSERT INTO t_account VALUES ('41ce5bb34c3f4d1fac3a7da8902386db', '���', 'D04F4BB993849D4697B35C7EE8D4D00C', 'huawei@gmail.com', '1968-1-14', '�����������ҵ��Ա���������ա��ڹ���̯������һ��żȻ���������е��������£��ų�Ϊ��һ��������....',
                              '��', 'static/image/user/wb.png', '2015-05-18 22:49:12', NULL, FALSE, 1, 2, NULL, 0, NULL, NULL, NULL);
INSERT INTO t_account VALUES ('41ce5bb34c3f4d1fac3a7da8909256db', 'Լ����ٯ', 'D04F4BB993849D4697B35C7EE8D4D00C', 'zte@163.com', '1940-10-9', 'Ӣ��ҡ���ֶӡ���ͷʿ����Ա��ҡ�����ּң�ʫ�ˣ������, ��ѡ����ʯ����־��������ʷ����ΰ���50λ�������ּ�....',
                              '��', 'static/image/user/lennon.png', '2015-04-28 22:49:12', NULL, FALSE, 1, 7, NULL, 0, NULL, NULL, NULL);
INSERT INTO t_account VALUES ('41ce5bb44c3f4d1fac3a7da8902356db', '���ݷ�', 'D04F4BB993849D4697B35C7EE8D4D00C', 'dji@163.com', '1907-11-19', '��۵��ӹ㲥���޹�˾������ϯ�������ֵܵ�Ӱ��˾�Ĵ�����֮һ....',
                              '��', 'static/image/user/syf.png', '2015-05-21 22:49:12', NULL, FALSE, 1, 7, NULL, 0, NULL, NULL, NULL);
INSERT INTO t_account VALUES ('41ce5bb34c7f4d1fac3a7da8902366db', '��С��', 'D04F4BB993849D4697B35C7EE8D4D00C', 'lenovo@foxmail.com', '1947-03-02', 'Li-Strahler���ι�ѧѧ�ɵĴ�ʼ�ˣ���������������ʹ�ѧ����Э�ᡰ��̱�ϵ�С����ڹ�����ң�н�����ʢ��....',
                              '��', 'static/image/user/lxw.png', '2015-05-20 22:49:12', NULL, FALSE, 1, 7, NULL, 0, NULL, NULL, NULL);

                                
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

INSERT INTO t_image VALUES ('c427d67ad9b946c2a4f13ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c415d67ad9b946c2a4f13ade5ae2e43a', '��ΪMate7��������K925������', '����6Ӣ������Ļ�ߴ磬����Ϊ��խ�߿���ƣ�ͬʱ����Ҳ������Ϊ7.9���ף���������һ�廯������ƣ���ʹ���˺��������ʣ��ճָ����ɻ��кܴ����',
                            '�Ƽ�', 88, 333, 13, 0, 16, 47, 'static/image/user/haiweimate.png', '2015-05-21 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d97ad9b946c2a4f13ade5ae2e43a', '����IdeaPad Yoga', '����Yogaϵ�а���Yoga13��Yoga11��Yoga11s�����Ʒ',
                            '�Ƽ�', 77, 301, 13, 0, 10, 17, 'static/image/user/yoga.png', '2015-05-20 12:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d17ad9b946c2a4f13ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d61ad9b946c2a4f13ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b146c2a4f13ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b910c2a4f13ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b946c1a4f13ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b946c3a4f13ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b946c2a5f13ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d65ad9b946c2a4f13ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d68ad9b946c2a4f13ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b946c2a4f18ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b946c2a4f98ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b946c2a4f19ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c417d67ad9b946c2a4f10ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c117d67ad9b946c2a4f13ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);
INSERT INTO t_image VALUES ('c117d67ad9b946c2a4f13ade5ae2e43a', 'DJI Phantom 2 Vision �׷�', '���������ϵͳ������վϵͳ����˼ϵ�и߾���ҵ��̨�����ϵ�ж������ķ������������˸�������ͼ��������ϵ���ֳֿ���һ���',
                            '�Ƽ�', 100, 344, 23, 0, 56, 77, 'static/image/user/dji.png', '2015-05-20 22:49:12', TRUE, '��С��', 'static/image/user/lxw.png', FALSE, NULL);

drop table if exists t_cataloge;
CREATE TABLE t_cataloge (
  cataloge_id VARCHAR(32) NOT NULL,
  cataloge_name VARCHAR(1024) NOT NULL,
  PRIMARY KEY (cataloge_id)
) ENGINE=innoDB DEFAULT CHARSET=utf8;

INSERT INTO t_cataloge VALUES (1, '����');
INSERT INTO t_cataloge VALUES (2, '��');
INSERT INTO t_cataloge VALUES (3, '���');
INSERT INTO t_cataloge VALUES (4, '����');


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

insert into t_role values('1', 'admin', '��������Ա', '21,31,41', true);

drop table if exists t_resource;
create table t_resource (
  resource_id VARCHAR(32) NOT NULL,
  resource_name VARCHAR(127),
  resource_permission VARCHAR(127),
  resource_available BOOLEAN DEFAULT FALSE,
  resource_url VARCHAR(1024),
  PRIMARY KEY (resource_id)
) ENGINE=innoDB DEFAULT CHARSET=utf8;

insert into t_resource values('1', '��Դ', '', true, null);

insert into t_resource values('21', '�û�����', 'user:*', true, null);
insert into t_resource values('22', '�û�����', 'user:create', true, null);
insert into t_resource values('23', '�û��޸�', 'user:update', true, null);
insert into t_resource values('24', '�û�ɾ��', 'user:delete', true, null);
insert into t_resource values('25', '�û��鿴', 'user:view', true, null);

insert into t_resource values('31', '��Դ����', 'resource:*', true, null);
insert into t_resource values('32', '��Դ����', 'resource:create', true, null);
insert into t_resource values('33', '��Դ�޸�', 'resource:update', true, null);
insert into t_resource values('34', '��Դɾ��', 'resource:delete', true, null);
insert into t_resource values('35', '��Դ�鿴', 'resource:view', true, null);

insert into t_resource values('41', '��ɫ����', 'role:*', true, null);
insert into t_resource values('42', '��ɫ����', 'role:create', true, null);
insert into t_resource values('43', '��ɫ�޸�', 'role:update', true, null);
insert into t_resource values('44', '��ɫɾ��', 'role:delete', true, null);
insert into t_resource values('45', '��ɫ�鿴', 'role:view', true, null);




