	package com.guanglumedia.common.springmvc.jackson;
	import org.codehaus.jackson.map.DeserializationConfig;
	import org.codehaus.jackson.map.ObjectMapper;
	import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
	import org.springframework.beans.factory.FactoryBean;

	public class ObjectMapperFactoryBean implements FactoryBean<ObjectMapper>{
		public ObjectMapper getObject()throws Exception{
			ObjectMapper mapper = new ObjectMapper();
			mapper.getSerializationConfig().setSerializationInclusion(Inclusion.NON_NULL);
			mapper.getDeserializationConfig().set(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
			return mapper;
		}

		public Class<ObjectMapper> getObjectType(){
			return ObjectMapper.class;
		}

		public boolean isSingleton(){
			return true;
		}
	}