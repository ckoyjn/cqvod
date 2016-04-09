package com.guanglumedia.cms.card.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.velocity.runtime.parser.node.SetExecutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.cms.card.dao.CardDao;
import com.guanglumedia.cms.card.entity.CardEpk;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.util.SequenceUtil;

@Service
public class CardService {
    @Autowired
    private CardDao cardEpkDao;

    public int addCardEpk(CardEpk cardEpk) {
        cardEpk.setEpkId(Integer.parseInt(SequenceUtil.getInstance().getKey(cardEpkDao.createBatchkey("epkBatchkey"), 8)));
       /*
      
        List<CardEpk> cardEpks = new ArrayList<CardEpk>();
        String type = cardEpk.getType();
        // 生成８位的卡
        if ("0".equals(type)) {
            int epk = cardEpkDao.addCardEpk(cardEpk);
            for (int i = 0; i < cardEpk.getEpkNum(); i++) {
                CardEpk card = new CardEpk();
                long snNum = (cardEpk.getEpkId() - 10000000) * ((int) Math.pow(10, cardEpk.getMaxEpkBit())) + 10000000 + i;
                card.setEvcnId(SequenceUtil.getInstance().get8BKey(snNum, cardEpk.getMaxEpkBit()));
                card.setEpkId(cardEpk.getEpkId());
                cardEpks.add(card);
            }
            cardEpkDao.insertCardNum(cardEpks);
            return epk;
        } else {
            // 生成１０位的卡
            int epk = cardEpkDao.addCardEpk(cardEpk);
            for (int i = 0; i < cardEpk.getEpkNum(); i++) {
                CardEpk card = new CardEpk();
                long snNum = (cardEpk.getEpkId() - 10000000) * ((int) Math.pow(10, cardEpk.getMaxEpkBit())) + 10000000 + i;
                card.setEvcnId(SequenceUtil.getInstance().get10BKey(snNum, cardEpk.getMaxEpkBit()));
                card.setEpkId(cardEpk.getEpkId());
                cardEpks.add(card);
            }
            
            cardEpkDao.insertCardNum(cardEpks);
            return epk;

        }
          */
        int epk = cardEpkDao.addCardEpk(cardEpk);
        return epk;

    }
    @Transactional
    public PagedModelList<Map<String, Object>> findcardepklist(CardEpk cardEpk, int pageNo, int pageRow) {
        List<Map<String, Object>> list = cardEpkDao.findcardepklist(cardEpk,new RowBounds((pageNo - 1) * pageRow, pageRow));
        int count = this.cardEpkDao.findCount();
        PagedModelList<Map<String, Object>> pml = new PagedModelList<Map<String, Object>>(pageNo, pageRow, count);
        pml.addModels(list);
        return pml;
    }
    @Transactional
    public PagedModelList<Map<String, Object>> finduseinfolist(CardEpk cardEpk, int pageNo, int pageRow) {
        
        List<Map<String, Object>> list = cardEpkDao.finduseinfolist( cardEpk,new RowBounds((pageNo - 1) * pageRow, pageRow));
        int count = this.cardEpkDao.findUseinfoCount();
        PagedModelList<Map<String, Object>> pml = new PagedModelList<Map<String, Object>>(pageNo, pageRow, count);
        pml.addModels(list);
        return pml;
    }
    public List<Map<String, Object>> exportcardepk(CardEpk cardEpk) {
        List<Integer> epkIds = new ArrayList<Integer>();
        if(cardEpk.getEpkIds()!=null){
            String idStrSplit[] = cardEpk.getEpkIds().split("::r::");
            for(String str:idStrSplit){
                String ids[]=str.split("::c::");
                epkIds.add(Integer.parseInt(ids[0]));
            }
        }
        List<Map<String, Object>> list=cardEpkDao.exportcardepk(epkIds);
        cardEpkDao.updateExportEpkStatus(epkIds);
        return list;
        }
        
    public int insertIntoEvcn(CardEpk cardEpk) {
        List<CardEpk> cardEpks = new ArrayList<CardEpk>();
        if(cardEpk.getEpkIds()!=null){
            String[] itemsArr = cardEpk.getEpkIds().split("::r::");
            for(String str:itemsArr)
            {
               CardEpk epk=new CardEpk();
               String[] itemArr = str.split("::c::");
               if ("0".equals(itemArr[3])) {
                   for (int i = 0; i < Integer.parseInt(itemArr[1]); i++) {
                       CardEpk card = new CardEpk();
                       long snNum = (Integer.parseInt(itemArr[0]) - 10000000) * ((int) Math.pow(10, cardEpk.getMaxEpkBit())) + 10000000 + i;
                       card.setEvcnId(SequenceUtil.getInstance().get8BKey(snNum, cardEpk.getMaxEpkBit()));
                       card.setEpkId(Integer.parseInt(itemArr[0]));
                       cardEpks.add(card);
                   }
                  int result= cardEpkDao.insertCardNum(cardEpks);
                     cardEpkDao.updateEpkStatus(Integer.parseInt(itemArr[0]));
                   return result;
               } else {
                   // 生成１０位的卡
                   for (int i = 0; i < Integer.parseInt(itemArr[1]); i++) {
                       CardEpk card = new CardEpk();
                       long snNum = (Integer.parseInt(itemArr[0]) - 10000000) * ((int) Math.pow(10, cardEpk.getMaxEpkBit())) + 10000000 + i;
                       card.setEvcnId(SequenceUtil.getInstance().get10BKey(snNum, cardEpk.getMaxEpkBit()));
                       card.setEpkId(Integer.parseInt(itemArr[0]));
                       cardEpks.add(card);
                   }
                   
                   int result= cardEpkDao.insertCardNum(cardEpks);
                   cardEpkDao.updateEpkStatus(Integer.parseInt(itemArr[0]));
                   return result;

               }
            }
        }
       
        return cardEpkDao.insertIntoEvcn(cardEpk);
    }
}
