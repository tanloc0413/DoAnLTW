package vn.edu.hcmuaf.db;

import java.io.IOException;
import java.util.Properties;

public class ConfigProperties {
    private static Properties prop=new Properties();
    static {
        try {
            prop.load(ConfigProperties.class.getClassLoader().getResourceAsStream("Config.properties"));

        }catch (IOException e){
            throw new RuntimeException(e);
        }
    }

    public static String dir= prop.getProperty("file.dir");
}
