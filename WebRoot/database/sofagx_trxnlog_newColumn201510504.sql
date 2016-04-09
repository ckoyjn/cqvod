
  ALTER TABLE trxnlog ADD COLUMN type int default 0 COMMENT '消费类型：0实付，１计次卡';

  ALTER TABLE trxnlog ADD COLUMN evcnId bigint(10) DEFAULT NULL COMMENT '计次卡号';
