package com.zale.utils;

import org.apache.commons.beanutils.BeanUtils;

import java.util.Map;

public class WebUtils {
    /**
     * Inject attribute from Map to JavaBean
     * @param value
     * @param bean
     * @param <T>
     * @return JavaBean subject
     */
    public static <T> T copyParamToBean(Map value, T bean) {
        try {
            BeanUtils.populate(bean, value);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }

    /**
     * transform String to Int
     * @param str
     * @param defaultValue
     * @return
     */
    public static int parseInt(String str, int defaultValue) {
        try {
            return Integer.parseInt(str);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return defaultValue;
    }


}
