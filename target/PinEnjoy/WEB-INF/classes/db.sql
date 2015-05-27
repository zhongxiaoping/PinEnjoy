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
  account_subscribeIds VARCHAR(1024),
  account_roleIds VARCHAR(1024),
  PRIMARY KEY (account_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create index idx_t_account_account_id on t_account(account_id);

                                
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

INSERT INTO t_image VALUES (1, 'ʦ������', '����ʦ����ѧλ�ڽ���ʡ�ϲ��������������99�ţ���...', '����', 1, 0, 0, 0, 0, 0, 'static/image/user/jxnormal.jpg',
                              now(), TRUE, 'taylor swift', '', FALSE, NULL);
INSERT INTO t_image VALUES (2, '�Ұ��Ҽ�', '�Ҿ���ƣ� ʱ�У� ʱ�У� ��ʱ�У�', '���', 1, 0, 0, 0, 0, 0, 'static/image/user/pic1.jpg',
                              now(), TRUE, 'taylor swift', '', FALSE, NULL);
INSERT INTO t_image VALUES (3, 'ɳ��', '�й����죬�����գ�', '���', 1, 0, 0, 0, 0, 0, 'static/image/user/pic3.jpg',
                              now(), TRUE, 'taylor swift', '', FALSE, NULL);
INSERT INTO t_image VALUES (4, 'ѽѽѽ', '��Ӱ�� ���ǣ� ɾ', '��', 1, 0, 0, 0, 0, 0, 'static/image/user/p4.jpg',
                              now(), TRUE, 'taylor swift', '', FALSE, NULL);
INSERT INTO t_image VALUES (5, '��', '����ģ��Ѽѵ�', '����', 1, 0, 0, 0, 0, 0, 'static/image/user/img1.jpg',
                              now(), TRUE, '�ƼҾ�', '', FALSE, NULL);
INSERT INTO t_image VALUES (6, '��', 'ǧ���������ǰ���͹(ܳ��ܳ )', '����', 1, 0, 0, 0, 0, 0, 'static/image/user/img2.jpg',
                              now(), TRUE, '�ƼҾ�', '', FALSE, NULL);
INSERT INTO t_image VALUES (7, 'ɽ��', '������ë��ϲ����ݰ���', '����', 1, 0, 0, 0, 0, 0, 'static/image/user/img3.jpg',
                              now(), TRUE, '�ƼҾ�', '', FALSE, NULL);
INSERT INTO t_image VALUES (8, '����', '��ʿ�ᣬ��ѩ��Ե��������', '����', 1, 0, 0, 0, 0, 0, 'static/image/user/img4.jpg',
                              now(), TRUE, '�ƼҾ�', '', FALSE, NULL);
INSERT INTO t_image VALUES (9, '����', '���ݳ�����Ų�ѩ', '����', 1, 0, 0, 0, 0, 0, 'static/image/user/img4.jpg',
                            now(), TRUE, '�ƼҾ�', '', FALSE, NULL);
INSERT INTO t_image VALUES (10, '����', '��ʿ�ᣬ��ѩ��Ե��������', '����', 1, 0, 0, 0, 0, 0, 'static/image/user/img4.jpg',
                            now(), TRUE, '�ƼҾ�', '', FALSE, NULL);
INSERT INTO t_image VALUES (11, 'dfasf', '��ʿ�ᣬ��ѩ��Ե��������', '����', 1, 0, 0, 0, 0, 0, 'static/image/user/img4.jpg',
                            now(), TRUE, '�ƼҾ�', '', FALSE, NULL);
INSERT INTO t_image VALUES (12, '����', '��ʿ�ᣬ��ѩ��Ե��������', '����', 1, 0, 0, 0, 0, 0, 'static/image/user/img4.jpg',
                            now(), TRUE, '�ƼҾ�', '', FALSE, NULL);
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




