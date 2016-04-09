/**
 * VODNoticeService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package localhost.vodnoticews.services.VODNoticeService;

public interface VODNoticeService extends java.rmi.Remote {
    public VODNoticeService.ParaOut downloadFinishNotice(java.lang.String id) throws java.rmi.RemoteException;
    public VODNoticeService.ParaOut programDeleteNotice(java.lang.String id) throws java.rmi.RemoteException;
    
    public class ParaOut  implements java.io.Serializable {
        private java.lang.String description;

        private boolean success;

        public ParaOut() {
        }

        public ParaOut(
               java.lang.String description,
               boolean success) {
               this.description = description;
               this.success = success;
        }


        /**
         * Gets the description value for this ParaOut.
         * 
         * @return description
         */
        public java.lang.String getDescription() {
            return description;
        }


        /**
         * Sets the description value for this ParaOut.
         * 
         * @param description
         */
        public void setDescription(java.lang.String description) {
            this.description = description;
        }


        /**
         * Gets the success value for this ParaOut.
         * 
         * @return success
         */
        public boolean isSuccess() {
            return success;
        }


        /**
         * Sets the success value for this ParaOut.
         * 
         * @param success
         */
        public void setSuccess(boolean success) {
            this.success = success;
        }

        private java.lang.Object __equalsCalc = null;
        public synchronized boolean equals(java.lang.Object obj) {
            if (!(obj instanceof ParaOut)) return false;
            ParaOut other = (ParaOut) obj;
            if (obj == null) return false;
            if (this == obj) return true;
            if (__equalsCalc != null) {
                return (__equalsCalc == obj);
            }
            __equalsCalc = obj;
            boolean _equals;
            _equals = true && 
                ((this.description==null && other.getDescription()==null) || 
                 (this.description!=null &&
                  this.description.equals(other.getDescription()))) &&
                this.success == other.isSuccess();
            __equalsCalc = null;
            return _equals;
        }

        private boolean __hashCodeCalc = false;
        public synchronized int hashCode() {
            if (__hashCodeCalc) {
                return 0;
            }
            __hashCodeCalc = true;
            int _hashCode = 1;
            if (getDescription() != null) {
                _hashCode += getDescription().hashCode();
            }
            _hashCode += (isSuccess() ? Boolean.TRUE : Boolean.FALSE).hashCode();
            __hashCodeCalc = false;
            return _hashCode;
        }

        // Type metadata   元数据类型
        private static org.apache.axis.description.TypeDesc typeDesc =
            new org.apache.axis.description.TypeDesc(ParaOut.class, true);

        static {
            typeDesc.setXmlType(new javax.xml.namespace.QName("urn:VODNoticeService", "ParaOut"));
            org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
            elemField.setFieldName("description");
            elemField.setXmlName(new javax.xml.namespace.QName("", "description"));
            elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
            elemField.setNillable(true);
            typeDesc.addFieldDesc(elemField);
            elemField = new org.apache.axis.description.ElementDesc();
            elemField.setFieldName("success");
            elemField.setXmlName(new javax.xml.namespace.QName("", "success"));
            elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "boolean"));
            elemField.setNillable(false);
            typeDesc.addFieldDesc(elemField);
        }

        /**
         * Return type metadata object
         * 返回类型元数据对象
         */
        public static org.apache.axis.description.TypeDesc getTypeDesc() {
            return typeDesc;
        }

        /**
         * Get Custom Serializer
         * 获取自定义序列
         */
        public static org.apache.axis.encoding.Serializer getSerializer(
               java.lang.String mechType, 
               java.lang.Class _javaType,  
               javax.xml.namespace.QName _xmlType) {
            return 
              new  org.apache.axis.encoding.ser.BeanSerializer(
                _javaType, _xmlType, typeDesc);
        }

        /**
         * Get Custom Deserializer
         * 获取自定义解串器
         */
        public static org.apache.axis.encoding.Deserializer getDeserializer(
               java.lang.String mechType, 
               java.lang.Class _javaType,  
               javax.xml.namespace.QName _xmlType) {
            return 
              new  org.apache.axis.encoding.ser.BeanDeserializer(
                _javaType, _xmlType, typeDesc);
        }

    }

}
