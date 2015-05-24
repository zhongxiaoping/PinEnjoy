CREATE TABLE t_account (
  account_id int(11) NOT NULL auto_increment COMMENT '用户ID',
  account_nickName VARCHAR (32) NOT NULL COMMENT '用户昵称',
  account_email VARCHAR (32) NOT NULL COMMENT '用户邮箱',
  account_password VARCHAR (32) NOT NULL COMMENT '用户密码',
  account_age VARCHAR (6) DEFAULT "男" COMMENT '用户年龄',
  account_introduction VARCHAR (1024) DEFAULT "" COMMENT '用户自我简介',
  account_location_thumb VARCHAR (1024) DEFAULT "",
  account_registerDate DATE DEFAULT "" COMMENT '用户注册日期',
  account_loginDate DATE DEFAULT "" COMMENT '登录日期',
  account_uploadImagesIds VARCHAR (10240) DEFAULT "" COMMENT '用户上传图片的Id集合',
  account_subscribeIds VARCHAR (10240) DEFAULT "" COMMENT '用户订阅其他用户的Id集合',
  account_privateLetterIds VARCHAR (10240) DEFAULT "" COMMENT '用户接受的私信Id集合',
  PRIMARY KEY (account_id)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE t_image (
  image_id int(11) NOT NULL auto_increment COMMENT '图片Id',
  image_title VARCHAR (64) Not NULL DEFAULT "" COMMENT '图片标题',
  image_describe VARCHAR (1024) NOT NULL DEFAULT "" COMMENT '图片描述',
  image_cataloge VARCHAR (64) NOT NULL DEFAULT "" COMMENT '图片类别',
  image_location VARCHAR (1024) NO NULL COMMENT '图片存放在服务器的位置',
  image_uploadDate DATE NO NULL COMMENT '上传的时间',
  image_isChecked VARCHAR (12) COMMENT '是否审核',
  account_id int(11) NOT NULL COMMENT '上传图片用户的Id',
  image_commentIds VARCHAR (10240) NOT NULL DEFAULT "" COMMENT '图片的评论Id集合',
  image_isAutoDelete VARCHAR (12) NOT NULL COMMENT '是否启动阅后即焚',
  image_autoDeleteTime DATE NOT NULL COMMENT '阅后即焚的时间',
  PRIMARY KEY (image_id)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;