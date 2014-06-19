package com.weixin.sdk;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;

public class ResourceManager {

    private static final String RESOURCE_FILENAME = "resource.properties";

    private static Properties props = new Properties();

    static {
        try {
            props.load(new InputStreamReader(Thread.currentThread().getContextClassLoader()
                    .getResourceAsStream(RESOURCE_FILENAME), "UTF-8"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getValue(String key) {
        return props.getProperty(key);
    }
}
