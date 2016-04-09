/**
 * VODNoticeServiceServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package localhost.vodnoticews.services.VODNoticeService;

public class VODNoticeServiceServiceLocator extends org.apache.axis.client.Service implements localhost.vodnoticews.services.VODNoticeService.VODNoticeServiceService {

    public VODNoticeServiceServiceLocator() {
    }


    public VODNoticeServiceServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public VODNoticeServiceServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for VODNoticeService
    private java.lang.String VODNoticeService_address = "http://localhost:7001/vodnoticews/services/VODNoticeService";

    public java.lang.String getVODNoticeServiceAddress() {
        return VODNoticeService_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String VODNoticeServiceWSDDServiceName = "VODNoticeService";

    public java.lang.String getVODNoticeServiceWSDDServiceName() {
        return VODNoticeServiceWSDDServiceName;
    }

    public void setVODNoticeServiceWSDDServiceName(java.lang.String name) {
        VODNoticeServiceWSDDServiceName = name;
    }

    public localhost.vodnoticews.services.VODNoticeService.VODNoticeService getVODNoticeService() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(VODNoticeService_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getVODNoticeService(endpoint);
    }

    public localhost.vodnoticews.services.VODNoticeService.VODNoticeService getVODNoticeService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            localhost.vodnoticews.services.VODNoticeService.VODNoticeServiceSoapBindingStub _stub = new localhost.vodnoticews.services.VODNoticeService.VODNoticeServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getVODNoticeServiceWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setVODNoticeServiceEndpointAddress(java.lang.String address) {
        VODNoticeService_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (localhost.vodnoticews.services.VODNoticeService.VODNoticeService.class.isAssignableFrom(serviceEndpointInterface)) {
                localhost.vodnoticews.services.VODNoticeService.VODNoticeServiceSoapBindingStub _stub = new localhost.vodnoticews.services.VODNoticeService.VODNoticeServiceSoapBindingStub(new java.net.URL(VODNoticeService_address), this);
                _stub.setPortName(getVODNoticeServiceWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("VODNoticeService".equals(inputPortName)) {
            return getVODNoticeService();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://localhost:7001/vodnoticews/services/VODNoticeService", "VODNoticeServiceService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://localhost:7001/vodnoticews/services/VODNoticeService", "VODNoticeService"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("VODNoticeService".equals(portName)) {
            setVODNoticeServiceEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
