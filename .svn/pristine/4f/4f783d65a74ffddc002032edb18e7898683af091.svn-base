CREATE TABLE `cms_epk` (
  `epkId` int(8) NOT NULL COMMENT '批次号',
  `cardLength` int(1) DEFAULT NULL COMMENT '卡号长度:0:是８位 １:是10位',
  `num` int(11) DEFAULT NULL COMMENT '生成的卡数量',
  `cardUsenum` int(11) DEFAULT NULL COMMENT '可兑换次数',
  `validTime` date DEFAULT NULL COMMENT '有效时间',
  `describe` varchar(500) DEFAULT NULL COMMENT '备注',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`epkId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8


CREATE TABLE `cms_evcn` (
  `evcnId` bigint(10) NOT NULL COMMENT '计次卡号',
  `cardUsenum` int(11) DEFAULT NULL COMMENT '剩余次数',
  `epkId` int(8) DEFAULT NULL COMMENT '属性批次',
  `status` int(1) DEFAULT '0' COMMENT '计次卡状态',
  PRIMARY KEY (`evcnId`),
  KEY `epkId` (`epkId`),
  CONSTRAINT `cms_evcn_ibfk_1` FOREIGN KEY (`epkId`) REFERENCES `cms_epk` (`epkId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8


CREATE TABLE `epk_sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seqname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8

