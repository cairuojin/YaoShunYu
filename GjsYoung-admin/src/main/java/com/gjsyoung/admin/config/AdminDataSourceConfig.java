package com.gjsyoung.admin.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

import javax.sql.DataSource;

/**
 * 配置两个数据源，该数据源扫描admin下的mapper
 */
@Configuration
@MapperScan(basePackages = {"com.gjsyoung.admin.mapper.admin"}, sqlSessionTemplateRef = "AdminSqlSessionTemplate")  //包为...下的类使用该接口，使用名称为...的sqlSeessionTemplate
public class AdminDataSourceConfig {

    @Bean           //默认情况下，bean名称和方法名相同。即此时生成了adminDataSource bean
    @ConfigurationProperties(prefix = "spring.admin.datasource")   //使用前缀为...的配置
    public DataSource adminDataSource(){
        return DataSourceBuilder.create().build();  //手动创建数据源
    }

    @Bean             //手动注入数据源为adminDataSource的datasource，此跟另外一个配置共创建了两个DataSource bean 通过该注解区分
    public SqlSessionFactory adminSqlSessionFactory(@Qualifier("adminDataSource") DataSource dataSource){
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        //添加XML目录
        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        try{
            bean.setMapperLocations(resolver.getResources("classpath:mapper/admin/*.xml"));   //可以区分mapper.xml文件夹
            return bean.getObject();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    @Bean
    public SqlSessionTemplate AdminSqlSessionTemplate(@Qualifier("adminSqlSessionFactory") SqlSessionFactory sqlSessionFactory) throws Exception {
        SqlSessionTemplate template = new SqlSessionTemplate(sqlSessionFactory);// 使用上面配置的Factory
            return template;
    }
}
