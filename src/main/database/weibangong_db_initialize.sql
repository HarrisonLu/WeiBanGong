-- ----------------------------
--  Records of `t_approval_stage`
-- ----------------------------
BEGIN;
INSERT INTO `t_approval_stage` VALUES ('1', '审批中'), ('2', '被驳回'), ('3', '可报销'), ('4', '已完成'), ('5', '未提交');
COMMIT;

-- ----------------------------
--  Records of `t_approval_status`
-- ----------------------------
BEGIN;
INSERT INTO `t_approval_status` VALUES ('1', '草稿'), ('2', '提交'), ('3', '归档');
COMMIT;

-- ----------------------------
--  Records of `t_approval_type`
-- ----------------------------
BEGIN;
INSERT INTO `t_approval_type` VALUES ('1', '休假申请'), ('2', '出差申请'), ('3', '费用报销'), ('4', '物品申请'), ('5', '经费申请'), ('6', '加班申请'), ('7', '其他申请');
COMMIT;

-- ----------------------------
--  Records of `t_claim_type`
-- ----------------------------
BEGIN;
INSERT INTO `t_claim_type` VALUES ('1', '奖励金'), ('2', '招待费'), ('3', '采购费'), ('4', '活动费'), ('5', '其他');
COMMIT;

-- ----------------------------
--  Records of `t_discuss_stage`
-- ----------------------------
BEGIN;
INSERT INTO `t_discuss_stage` VALUES ('1', '未洽谈'), ('2', '洽谈中'), ('3', '合作期'), ('4', '其他');
COMMIT;

-- ----------------------------
--  Records of `t_funds_type`
-- ----------------------------
BEGIN;
INSERT INTO `t_funds_type` VALUES ('1', '奖励金'), ('2', '招待费'), ('3', '采购费'), ('4', '活动费'), ('5', '其他');
COMMIT;

-- ----------------------------
--  Records of `t_goods_type`
-- ----------------------------
BEGIN;
INSERT INTO `t_goods_type` VALUES ('1', '办公用品'), ('2', '礼品赠品'), ('3', '其他');
COMMIT;

-- ----------------------------
--  Records of `t_leave_type`
-- ----------------------------
BEGIN;
INSERT INTO `t_leave_type` VALUES ('1', '带薪年假'), ('2', '事假'), ('3', '病假'), ('4', '其他');
COMMIT;

-- ----------------------------
--  Records of `t_priority`
-- ----------------------------
BEGIN;
INSERT INTO `t_priority` VALUES ('1', '高'), ('2', '中'), ('3', '低');
COMMIT;

-- ----------------------------
--  Records of `t_stage_project`
-- ----------------------------
BEGIN;
INSERT INTO `t_stage_project` VALUES ('1', '未开始'), ('2', '进行中'), ('3', '已完成'), ('4', '已关闭');
COMMIT;

