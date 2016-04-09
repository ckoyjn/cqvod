package com.guanglumedia.api.utils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.soap.MessageFactory;
import javax.xml.soap.SOAPBody;
import javax.xml.soap.SOAPConnection;
import javax.xml.soap.SOAPConnectionFactory;
import javax.xml.soap.SOAPElement;
import javax.xml.soap.SOAPEnvelope;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPMessage;

import org.apache.log4j.Logger;
import org.w3c.dom.CDATASection;
import org.w3c.dom.NodeList;


public class IMP {
    private Logger log = Logger.getLogger(IMP.class);
    private SOAPMessage sm = null;
    private SOAPElement requestContent = null;
    private String  SoapQueryUrl = "http://172.16.84.18/CCN/acctInfoPS";
    
    private boolean initSoapMessage() {
        MessageFactory mf = null;
        SOAPEnvelope envelope = null;

        try {
            mf = MessageFactory.newInstance();
            sm = mf.createMessage();
            sm.getSOAPHeader().setPrefix("soapenv");
            envelope = sm.getSOAPPart().getEnvelope();
            envelope.addNamespaceDeclaration("ws",
                    "http://ws.external.boss.ailk.com");
            envelope.setPrefix("soapenv");

            SOAPBody body = envelope.getBody();
            body.setPrefix("soapenv");

            SOAPElement ossRequest = body.addChildElement("ossRequest", "ws");

            SOAPElement in0 = ossRequest.addChildElement("in0", "ws");

            SOAPElement encryptInfo = in0.addChildElement("encryptInfo", "ws");
            SOAPElement extendInfo = in0.addChildElement("extendInfo", "ws");
            requestContent = in0.addChildElement("requestContent", "ws");
            SOAPElement requestNo = in0.addChildElement("requestNo", "ws");
            SOAPElement requestSystemNo = in0.addChildElement(
                    "requestSystemNo", "ws");
            SOAPElement versionNo = in0.addChildElement("versionNo", "ws");

            requestNo.setTextContent("001");
            requestSystemNo.setTextContent("006");
            versionNo.setTextContent("1");

            encryptInfo.setAttribute("id", "?");
            encryptInfo.setAttribute("href", "?");
            encryptInfo.setTextContent("?");

            extendInfo.setAttribute("id", "?");
            extendInfo.setAttribute("href", "?");
            extendInfo.setTextContent("?");

            requestContent.setAttribute("id", "?");
            requestContent.setAttribute("href", "?");

        } catch (SOAPException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    public EpgResult querySoap(String QryType, String QryId) {
        log.info("-----------------------------查询开始----------------------------------");
        EpgResult ret = new EpgResult();
        if (!initSoapMessage()) {
            ret.setResult("-1");
            log.error("初始化soapmessage出错");
            return ret;
        }
        String cdataStr = "<oss-request>" + "<QryType>" + QryType
                + "</QryType>" + "<QryId>" + QryId + "</QryId>"
                + "</oss-request>";
        CDATASection cdata = requestContent.getOwnerDocument()
                .createCDATASection(cdataStr);
        requestContent.appendChild(cdata);

        URL url = null;
        try {
            url = new URL(SoapQueryUrl);
        } catch (MalformedURLException e) {
            ret.setResult("-1");
            log.error("初始化Url[" + SoapQueryUrl + "]出错",e);
            return ret;
        }

        SOAPConnectionFactory factory;
        SOAPConnection con;
        SOAPMessage retSM;
        try {
            factory = SOAPConnectionFactory.newInstance();
            con = factory.createConnection();
            log.info("QuerySoap send:[" + getSoapMessageString(sm) + "]");
            retSM = con.call(sm, url);
            con.close();
        } catch (UnsupportedOperationException e) {
            ret.setResult("-1");
            log.error("SOAPConnectionFactory error",e);
            return ret;
        } catch (SOAPException e) {
            ret.setResult("-1");
            log.error("通讯出错:Url[" + SoapQueryUrl + "]",e);
            return ret;
        }

        log.debug("查询收到BOSS返回信息");

        /* 收到 */
        SOAPBody retBody;
        try {
            retBody = retSM.getSOAPBody();
        } catch (SOAPException e) {
            ret.setResult("-1");
            log.error("解析返回Soap报文出错",e);
            return ret;
        }
        
        SOAPElement ossRequestResponse = (SOAPElement) retBody.getFirstChild();
        SOAPElement ossRequestReturn = (SOAPElement) ossRequestResponse
                .getFirstChild();
        SOAPElement oss_response = (SOAPElement) ossRequestReturn
                .getFirstChild();
        if (!oss_response.getAttribute("return-code").equals("000")) {
            ret.setResult("-1");
            log.error("查询处理失败，BOSS返回错误信息["
                    + oss_response.getAttribute("return-message") + "]");
            return ret;
        }
        int khBalance=0;//客户余额   ServiceId ServId都为0
        int zhBalance=0;//账户余额   ServiceId=0 ServId=ProdInstID
        NodeList nl = retBody.getElementsByTagName("ProdInstID");   
        String ProdInstID = nl.item(0).getFirstChild().getNodeValue();
        NodeList n2 = retBody.getElementsByTagName("OweTotalFee");
        log.info("OweTotalFee"+n2.item(0).getNodeValue()+"====="+n2.item(0).getFirstChild().getNodeValue());
        int oweTotalFee = Integer.parseInt(n2.item(0).getFirstChild().getNodeValue());//OweTotalFee欠费
        if(oweTotalFee>0){//欠费大于0说明余额为0
            ret.setResult("0");
            ret.setOweTotalFee(oweTotalFee);
        }else{
            NodeList n3 = retBody.getElementsByTagName("ServiceBalanceList").item(0).getChildNodes();//ServiceBalanceList余额列表
            log.info("ServiceBalanceList length:"+n3.getLength());
            for(int i=0;i<n3.getLength();i++){
                NodeList n =  n3.item(i).getChildNodes();
                log.info("item length:"+n.getLength());
                String ServiceId = n.item(0).getFirstChild().getNodeValue();
                String ServId = n.item(6).getFirstChild().getNodeValue();
                log.info("ServiceId:"+ServiceId+"-----ServId:"+ServId);
                if("0".equals(ServiceId)&&"0".equals(ServId)){
                    log.info("khBalance---"+n.item(7).getFirstChild().getNodeValue());
                    khBalance = Integer.parseInt(n.item(7).getFirstChild().getNodeValue());
                }else if("0".equals(ServiceId)&&ServId.equals(ProdInstID)){
                    log.info("zhBalance---"+n.item(7).getFirstChild().getNodeValue());
                    zhBalance = Integer.parseInt(n.item(7).getFirstChild().getNodeValue());
                }
            }
            ret.setResult("2");
            ret.setBalance(zhBalance+khBalance);
            log.info("zhBalance:"+zhBalance+"-----khBalance:"+khBalance);
        }
        
        ret.setProdInstID(ProdInstID);
        log.info("ProdInstID:[" + ProdInstID + "]");
        log.info("-----------------------------查询结束----------------------------------");
        return ret;
    }
    
    private String getSoapMessageString(SOAPMessage sm) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try {
            sm.writeTo(out);
        } catch (SOAPException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String strMsg = new String(out.toByteArray());
        return strMsg;
    }
}
