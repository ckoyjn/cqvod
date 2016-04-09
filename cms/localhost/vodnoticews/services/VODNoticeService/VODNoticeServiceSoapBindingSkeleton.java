/**
 * VODNoticeServiceSoapBindingSkeleton.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package localhost.vodnoticews.services.VODNoticeService;

public class VODNoticeServiceSoapBindingSkeleton implements localhost.vodnoticews.services.VODNoticeService.VODNoticeService, org.apache.axis.wsdl.Skeleton {
    private localhost.vodnoticews.services.VODNoticeService.VODNoticeService impl;
    private static java.util.Map _myOperations = new java.util.Hashtable();
    private static java.util.Collection _myOperationsList = new java.util.ArrayList();

    /**
    * Returns List of OperationDesc objects with this name
    */
    public static java.util.List getOperationDescByName(java.lang.String methodName) {
        return (java.util.List)_myOperations.get(methodName);
    }

    /**
    * Returns Collection of OperationDescs
    */
    public static java.util.Collection getOperationDescs() {
        return _myOperationsList;
    }

    static {
        org.apache.axis.description.OperationDesc _oper;
        org.apache.axis.description.FaultDesc _fault;
        org.apache.axis.description.ParameterDesc [] _params;
        _params = new org.apache.axis.description.ParameterDesc [] {
            new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "id"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false), 
        };
        _oper = new org.apache.axis.description.OperationDesc("downloadFinishNotice", _params, new javax.xml.namespace.QName("", "downloadFinishNoticeReturn"));
        _oper.setReturnType(new javax.xml.namespace.QName("urn:VODNoticeService", "ParaOut"));
        _oper.setElementQName(new javax.xml.namespace.QName("http://service.chargews.dmam.dayang.com", "downloadFinishNotice"));
        _oper.setSoapAction("");
        _myOperationsList.add(_oper);
        if (_myOperations.get("downloadFinishNotice") == null) {
            _myOperations.put("downloadFinishNotice", new java.util.ArrayList());
        }
        ((java.util.List)_myOperations.get("downloadFinishNotice")).add(_oper);
        _params = new org.apache.axis.description.ParameterDesc [] {
            new org.apache.axis.description.ParameterDesc(new javax.xml.namespace.QName("", "id"), org.apache.axis.description.ParameterDesc.IN, new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false), 
        };
        _oper = new org.apache.axis.description.OperationDesc("programDeleteNotice", _params, new javax.xml.namespace.QName("", "programDeleteNoticeReturn"));
        _oper.setReturnType(new javax.xml.namespace.QName("urn:VODNoticeService", "ParaOut"));
        _oper.setElementQName(new javax.xml.namespace.QName("http://service.chargews.dmam.dayang.com", "programDeleteNotice"));
        _oper.setSoapAction("");
        _myOperationsList.add(_oper);
        if (_myOperations.get("programDeleteNotice") == null) {
            _myOperations.put("programDeleteNotice", new java.util.ArrayList());
        }
        ((java.util.List)_myOperations.get("programDeleteNotice")).add(_oper);
    }

    public VODNoticeServiceSoapBindingSkeleton() {
        this.impl = new localhost.vodnoticews.services.VODNoticeService.VODNoticeServiceSoapBindingImpl();
    }

    public VODNoticeServiceSoapBindingSkeleton(localhost.vodnoticews.services.VODNoticeService.VODNoticeService impl) {
        this.impl = impl;
    }
    public VODNoticeService.ParaOut downloadFinishNotice(java.lang.String id) throws java.rmi.RemoteException
    {
        VODNoticeService.ParaOut ret = impl.downloadFinishNotice(id);
        return ret;
    }

    public VODNoticeService.ParaOut programDeleteNotice(java.lang.String id) throws java.rmi.RemoteException
    {
        VODNoticeService.ParaOut ret = impl.programDeleteNotice(id);
        return ret;
    }

}
