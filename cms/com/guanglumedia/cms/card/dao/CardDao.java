package com.guanglumedia.cms.card.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.card.entity.CardEpk;

@Repository
public interface CardDao {
    public int addCardEpk(CardEpk cardEpk);

    public Integer createBatchkey(String epkBatchkey);

    public int insertCardNum(List<CardEpk> cardEpks);

    public List<Map<String, Object>> findcardepklist(CardEpk cardEpk, RowBounds rowBounds);

    public int findCount();

    // 计次卡使用信息
    public List<Map<String, Object>> finduseinfolist(CardEpk cardEpk, RowBounds rowBounds);

    public int findUseinfoCount();

    public List<Map<String, Object>> exportcardepk(List<Integer> list);

    public int insertIntoEvcn(CardEpk cardEpk);

    public void updateEpkStatus(int epkId);

    public void updateExportEpkStatus(List<Integer> epkIds);
}
