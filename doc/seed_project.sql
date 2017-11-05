#
# SQL Export
# Created by Querious (201009)
# Created: 2017年11月3日 GMT+8 下午3:38:09
# Encoding: Unicode (UTF-8)
#


SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


DROP TABLE IF EXISTS `sys_role_user`;
DROP TABLE IF EXISTS `sys_role`;
DROP TABLE IF EXISTS `sys_node`;
DROP TABLE IF EXISTS `sys_admin_user_login_log`;
DROP TABLE IF EXISTS `sys_admin_user`;
DROP TABLE IF EXISTS `sys_access`;


CREATE TABLE `sys_access` (
  `role_id` int(11) unsigned NOT NULL COMMENT '角色ID',
  `node_id` int(11) unsigned NOT NULL COMMENT '节点ID,sys_node中的ID',
  KEY `role_id` (`role_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';


CREATE TABLE `sys_admin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户UID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` char(60) NOT NULL COMMENT '登录密码',
  `real_name` varchar(20) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `phone` varchar(18) NOT NULL DEFAULT '' COMMENT '联系号码',
  `email` varchar(30) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `auth_key` varchar(60) NOT NULL DEFAULT '' COMMENT 'auth_key',
  `access_token` varchar(60) NOT NULL DEFAULT '' COMMENT 'access_token',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，0：禁用，1：正常',
  `birth_date` date DEFAULT NULL COMMENT '生日日期',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户表';


CREATE TABLE `sys_admin_user_login_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL COMMENT '登录UID',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `data` text COMMENT '请求参数,json格式',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '请求Url地址',
  `client_name` varchar(60) NOT NULL DEFAULT '' COMMENT '客户端名称',
  `client_version` varchar(60) NOT NULL DEFAULT '' COMMENT '客户端版本',
  `platform` varchar(60) NOT NULL DEFAULT '' COMMENT '客户端系统',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='系统用户登录日志表';


CREATE TABLE `sys_node` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID,0:顶级节点',
  `name` varchar(100) NOT NULL COMMENT '操作名称，或菜单名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url地址',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态,1正常  0禁用',
  `is_menu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是菜单，0：否，1：是',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '等级',
  `can_del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可以删除，0：不可以，1：可以',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '排序',
  `font_icon` varchar(100) DEFAULT '' COMMENT '菜单字体图片',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `is_menu` (`is_menu`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='操作节点表';


CREATE TABLE `sys_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '角色名字',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1正常 0禁用',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';


CREATE TABLE `sys_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色ID，对应sys_role表主键',
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;


SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


LOCK TABLES `sys_access` WRITE;
ALTER TABLE `sys_access` DISABLE KEYS;
INSERT INTO `sys_access` (`role_id`, `node_id`) VALUES
  (4,2),
  (1,4),
  (1,3),
  (1,2),
  (1,1);
ALTER TABLE `sys_access` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `sys_admin_user` WRITE;
ALTER TABLE `sys_admin_user` DISABLE KEYS;
INSERT INTO `sys_admin_user` (`id`, `username`, `password`, `real_name`, `phone`, `email`, `auth_key`, `access_token`, `status`, `birth_date`, `created`, `updated`) VALUES
  (1,'admin','$2y$13$2TY3rdo.Y3jUoZ6O3STC4OAWDFux1Q3h5yzRqDpLYJQSjmTxt6qxK','admin','','admin@126.com','','',1,'2017-09-30','2017-09-15 15:09:18','2017-09-15 20:09:42');
ALTER TABLE `sys_admin_user` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `sys_admin_user_login_log` WRITE;
ALTER TABLE `sys_admin_user_login_log` DISABLE KEYS;
INSERT INTO `sys_admin_user_login_log` (`id`, `uid`, `ip`, `data`, `url`, `client_name`, `client_version`, `platform`, `created`) VALUES
  (1,1,'127.0.0.1','{"post":{"username":"admin","password":"123456","_csrf":"4n0wZvtkIFs6qkW0LUZgoyoDG_3dIwjDd3mOp8Qh-7R0bQEfyqzygK8u0wKFvJZ66fpq5LKg6yWFypFz9DqyQw=="},"get":[]}','/index.php','Google Chrome','61.0.3163.91','MAC','2017-09-16 18:44:21'),
  (2,1,'127.0.0.1','{"post":{"username":"admin","password":"123456","_csrf":"omCf5C2sX0SxVLDoIiXTHDvZdh0TVheSe-B_nEx-Rfo0cK6dHGSNnyTQJl6K3yXF-CAHBHzV9HSJU2BIfGUMDQ=="},"get":[]}','http://general.yii.com/login/do','Google Chrome','61.0.3163.91','MAC','2017-09-16 18:46:08'),
  (3,1,'127.0.0.1','{"post":{"username":"admin","password":"123456","_csrf":"IR_B7JTUGKEEoQ5KwZLjuWp2nSb6UiQTGOM0JKv0pUC3D_CVpRzKepElmPxpaBVgqY_sP5XRx_XqUCvwm-_stw=="},"get":[]}','http://general.yii.com/login/do','Google Chrome','61.0.3163.91','MAC','2017-09-16 18:46:48'),
  (4,1,'127.0.0.1','{"post":{"username":"admin","password":"123456","_csrf":"hbf2qsvp6OVGCbV8B2qVncLcvCaiPnObgItrmIX72cATp8fT-iE6PtONI8qvkGNEASXNP829kH1yOHRMteCQNw=="},"get":[]}','http://general.yii.com/login/do','Google Chrome','61.0.3163.91','MAC','2017-09-16 18:51:29'),
  (5,1,'127.0.0.1','{"post":{"username":"admin","password":"123456","_csrf":"Z305ZWWk7Y5mpWJOqWK7F3-gBwoKM6FqcEWahkhtOCvxbQgcVGw_VfMh9PgBmE3OvFl2E2WwQoyC9oVSeHZx3A=="},"get":[]}','http://general.yii.com/login/do','Google Chrome','61.0.3163.91','MAC','2017-09-16 18:58:51'),
  (6,1,'127.0.0.1','{"post":{"username":"admin","password":"123456","_csrf":"0FsTN_q729jdA4-38m9Bp8wD3SlvgJVqig8vaNU-b9cbCY-iGXBhjSgFrTBcDRLP95egb_tRXz6reygsM2YLpg=="},"get":[]}','http://general.yii.com/login/do','Google Chrome','61.0.3163.91','MAC','2017-09-20 16:37:57'),
  (7,1,'127.0.0.1','{"post":{"username":"admin","password":"123456","_csrf":"lasGIhSm6G6QmYcTPi5x3jnJNxXjaDo9PONfPzqZIWYhLJWeWJ-JpMz2jSnqvcQqKUCnDX3Y1P5G0R-WB37lwQ=="},"get":[]}','http://general.yii.com/login/do','Google Chrome','61.0.3163.91','MAC','2017-09-22 10:58:47'),
  (8,1,'127.0.0.1','{"post":{"username":"admin","password":"123456","token":"vBJPsbCsFjwNrBYNt6LQqVZMFX-nkWtxBTdlY8NFZSrtPzbI--pyWDjlZW_Z8OHZYg10G__iXjVGA1FSiSFcQQ=="},"get":[]}','http://mall.yg.com/admin/login/do','Google Chrome','61.0.3163.100','MAC','2017-11-03 15:16:50'),
  (9,1,'127.0.0.1','{"post":{"username":"admin","password":"123456","token":"jt4olgs2nKZOyTS4USX8gbVUON7FElWlomukK4o9n3Tf81HvQHD4wnuAR9o_d83xgRVZup1hYOHhX5AawFmmHw=="},"get":[]}','http://mall.yg.com/login/do','Google Chrome','61.0.3163.100','MAC','2017-11-03 15:26:00'),
  (10,1,'127.0.0.1','{"post":{"username":"admin","password":"123456","token":"zR4Bp2-byAO6vbp_GohuvMxCQf4QllE4j4GaFLuHggKcM3jeJN2sZ4_0yR102l_M-AMgmkjlZHzMta4l8eO7aQ=="},"get":[]}','http://mall.yg.com/login/do','Google Chrome','61.0.3163.100','MAC','2017-11-03 15:28:46'),
  (11,1,'127.0.0.1','{"post":{"username":"admin","password":"123456","token":"v_28fKAEfrt2cBLUC5S1b_ct2m0UbNDH1jcn6cmQsVbu0MUF60Ia30M5YbZlxoQfw2y7CUwf5YOVAxPYg_SIPQ=="},"get":[]}','http://mall.yg.com/login/do','Google Chrome','61.0.3163.100','MAC','2017-11-03 15:36:46');
ALTER TABLE `sys_admin_user_login_log` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `sys_node` WRITE;
ALTER TABLE `sys_node` DISABLE KEYS;
INSERT INTO `sys_node` (`id`, `pid`, `name`, `url`, `status`, `is_menu`, `level`, `can_del`, `sort`, `font_icon`) VALUES
  (1,0,'系统管理','#',1,1,1,0,0,'cog'),
  (2,1,'菜单管理','/admin/systems/node/index',1,1,1,0,0,''),
  (3,1,'角色管理','/admin/systems/role/index',1,1,1,0,0,''),
  (4,1,'系统用户','/admin/systems/user/index',1,1,1,0,0,'');
ALTER TABLE `sys_node` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `sys_role` WRITE;
ALTER TABLE `sys_role` DISABLE KEYS;
INSERT INTO `sys_role` (`id`, `name`, `status`, `remark`) VALUES
  (1,'系统管理员',1,'系统管理员'),
  (2,'sdfds',1,'sfs'),
  (4,'aaa',1,'ddd');
ALTER TABLE `sys_role` ENABLE KEYS;
UNLOCK TABLES;


LOCK TABLES `sys_role_user` WRITE;
ALTER TABLE `sys_role_user` DISABLE KEYS;
INSERT INTO `sys_role_user` (`role_id`, `user_id`) VALUES
  (2,2),
  (2,4),
  (4,4),
  (2,3),
  (4,3),
  (2,6),
  (4,6);
ALTER TABLE `sys_role_user` ENABLE KEYS;
UNLOCK TABLES;




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;


