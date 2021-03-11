package com.zale.utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcUtils {
    private static DruidDataSource dataSource;
    private static ThreadLocal<Connection> conns = new ThreadLocal<>();

    static {
        try {
            Properties properties = new Properties();
            //read properties file
            InputStream inputStream = JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
            // load file from stream
            properties.load(inputStream);
            // create connection pool
            dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * fetch Connection from database connection pool
     * @return fail when return null<br/> success when return any value
     */
    public static Connection getConnection(){
        Connection conn = conns.get();
        if (conn == null) {
            try {
                conn = dataSource.getConnection();
                conns.set(conn); // save to ThreadLocal for later jdbc uses
                conn.setAutoCommit(false); // set to manually management
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return conn;
    }


    /**
     * commit transaction, close and release connection
     */
    public static void commitAndClose(){
        Connection connection = conns.get();
        if (connection != null) {
            try {
                connection.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        // Has to be executed, cause Tomcat use thread pool tech in the bottom）
        conns.remove();
    }

    /**
     * rollback transaction, close and release connection
     */
    public static void rollbackAndClose(){
        Connection connection = conns.get();
        if (connection != null) {
            try {
                connection.rollback();//rollback
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        // Has to be executed, cause Tomcat use thread pool tech in the bottom
        conns.remove();
    }

}
