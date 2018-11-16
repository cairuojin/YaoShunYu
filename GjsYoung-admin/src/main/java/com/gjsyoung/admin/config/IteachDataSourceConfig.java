package com.gjsyoung.admin.config;

import com.github.pagehelper.PageHelper;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

import javax.sql.DataSource;

@Configuration
@MapperScan(basePackages = {"com.gjsyoung.admin.mapper.iteach"}, sqlSessionTemplateRef = "iteachSqlSessionTemplate")
public class IteachDataSourceConfig {

    @Autowired
    PageHelper pageHelper;

    @Bean
    @ConfigurationProperties(prefix = "spring.iteach.datasource")
    public DataSource iteachDataSource(){
        return DataSourceBuilder.create().build();
    }

    @Bean
    public SqlSessionFactory iteachSqlSessionFactory(@Qualifier("iteachDataSource") DataSource dataSource){
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();

        //注册分页插件
        Interceptor[] plugins =  new Interceptor[]{pageHelper};
        bean.setPlugins(plugins);

        try{
            bean.setMapperLocations(resolver.getResources("classpath:mapper/iteach/*.xml"));
            return bean.getObject();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    @Bean
    public SqlSessionTemplate iteachSqlSessionTemplate(@Qualifier("iteachSqlSessionFactory") SqlSessionFactory sqlSessionFactory) throws Exception {
        SqlSessionTemplate template = new SqlSessionTemplate(sqlSessionFactory);// 使用上面配置的Factory
            return template;
    }
}
