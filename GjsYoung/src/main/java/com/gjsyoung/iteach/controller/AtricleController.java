package com.gjsyoung.iteach.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gjsyoung.iteach.domain.Author;
import com.gjsyoung.iteach.domain.User;
import com.gjsyoung.iteach.mapper.ArticleMapper;
import com.gjsyoung.iteach.mapper.AuthorMapper;
import com.gjsyoung.iteach.mapper.UserMapper;
import com.gjsyoung.iteach.service.ArticleService;
import com.gjsyoung.iteach.utils.CommonUtils;
import com.gjsyoung.iteach.utils.RedisCache;
import com.gjsyoung.iteach.vo.ArticleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author cairuojin
 * @create 2018-09-09 21:34
 * 文章controller
 */
@Controller
public class AtricleController {

    @Autowired
    CommonUtils commonUtils;

    @Autowired
    ArticleService articleService;

    @Autowired
    UserMapper userMapper;

    @Autowired
    ArticleMapper articleMapper;

    @Autowired
    RedisCache redisCache;

    @Autowired
    AuthorMapper authorMapper;

    /**
     * 跳转到作者页面
     * @param authorId
     * @return
     */
    @RequestMapping("/author/{id}")
    public ModelAndView author(@PathVariable("id") int authorId){
        Author author = authorMapper.selectByAuthorId(authorId);
        if(author == null)
            return commonUtils.throwException("找不到该作者资料呢，请您重新确认！");
        PageHelper.startPage(0,3);
        List<ArticleVo> article = articleMapper.selectByAuthorId(authorId);     //todo 随机搜索作者的文章
        ModelAndView nav = new ModelAndView();
        nav.setViewName("articleAuthor");
        nav.addObject("author",author);
        nav.addObject("article",article);
        return nav;
    }

    /**
     * 跳转到文章页面
     * @param page
     * @param session
     * @return
     */
    @RequestMapping("/atricle")
    public ModelAndView atricle(Integer page, HttpSession session){
        Map map = articleService.findArticle(page);//分页找寻文章列表信息
        List<User> authors = userMapper.selectAuthorsLimit(5);      //作家列表
        List<ArticleVo> articles = (List<ArticleVo>) map.get("articles");//文章列表
        PageInfo pageInfo = (PageInfo) map.get("pageInfo");     //分页信息
        ModelAndView nav = new ModelAndView();
        nav.addObject("articles",articles);
        nav.addObject("authors",authors);
        nav.addObject("totalPage",pageInfo.getPages());
        nav.addObject("random",commonUtils.getRandomInt(5));
        nav.addObject("page",page);
        nav.setViewName("article");
        session.setAttribute("pageHeader",3);//头
        return nav;
    }

    /**
     * 搜索文章
     * @param value
     * @param type
     * @return
     */
    @RequestMapping("/articlesearch")
    public ModelAndView ArticleSearch(String value, Integer type){
        List<ArticleVo> datas = null;
        if(type == 0){  //搜索内容
            datas = articleService.selectContentLike(value);
        }
        else if(type ==1){  //搜索作者
            datas = articleService.selectAnthorLike(value);
        }else {
            commonUtils.throwException("您输入的信息有误");
        }

        List<User> authors = userMapper.selectAuthorsLimit(5);      //作家列表
        ModelAndView nav = new ModelAndView();
        nav.addObject("articles",datas);
        nav.addObject("authors",authors);
        nav.addObject("searchHistory",value);
        nav.addObject("searchType",type);
        nav.addObject("random",commonUtils.getRandomInt(5));
        nav.setViewName("article");
        return nav;
    }

    /**
     * 跳转到文章细节
     * @param articleId
     * @return
     */
    @RequestMapping("/articleDetail/{id}")
    public ModelAndView articleDetail(@PathVariable("id") int articleId){
        //保留历史记录到cookies
//        Cookie[] cookies = request.getCookies();
//        Cookie HistoryCookie = null;
//        for(Cookie cookie : cookies){
//            if(cookie.getName() == "ArticleHistory")
//                HistoryCookie = cookie;
//        }
//        if(HistoryCookie == null)
//        {
//            HistoryCookie = new Cookie("ArticleHistory",articleId+"");
//            HistoryCookie.setMaxAge(60 * 60 * 24 * 7);// 设置为一周
//            HistoryCookie.setPath("/articleDetail");
//            response.addCookie(HistoryCookie);
//        }else {
//            String history = HistoryCookie.getValue();
//            String[] historys = history.split("-");
//            if(historys.length == 5){        //保留5个
//                history = history.substring(history.indexOf("-")) + "-" + articleId;
//            }else {
//                history += "-" + articleId;
//            }
//        }
        //todo 文章浏览次数

        Map data = articleMapper.queryDetailById(articleId);
        ModelAndView nav = new ModelAndView();
        nav.addObject("data",data);
        nav.addObject("ChatHistory",redisCache.getObject("ChatHistory"));
        nav.setViewName("articleDetail");
        return nav;

    }



    /**
     * lzy
     * 跳转到编辑页
     * @return
     */
    @RequestMapping("/toEditor")
    public String toEditor() {
        return "articleEditor";
    }



    /**
     * lzy
     * 上传图片
     * @param request
     * @param mf
     * @return
     */
    @RequestMapping("/uploadImage")
    @ResponseBody
    public Map<String, String> uploadImage(HttpServletRequest request, @RequestParam(value = "myFileName") MultipartFile mf) {
        String realPath = request.getSession().getServletContext().getRealPath("upload");

        //获取源文件
        String filename = mf.getOriginalFilename();
        String[] names = filename.split("\\.");//
        String tempNum = (int) (Math.random() * 100000) + "";
        String uploadFileName = tempNum + System.currentTimeMillis() + "." + names[names.length - 1];
        File targetFile = new File(realPath, uploadFileName);//目标文件

        //开始从源文件拷贝到目标文件

        //传图片一步到位
        try {
            mf.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Map<String, String> map = new HashMap<String,String>();
        map.put("data", "http://localhost:8080/upload/" + uploadFileName);//这里应该是项目路径
        return map;//将图片地址返回
    }

}