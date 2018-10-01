package com.gjsyoung.iteach.controller;

import com.gjsyoung.iteach.domain.Author;
import com.gjsyoung.iteach.domain.AuthorApply;
import com.gjsyoung.iteach.domain.User;
import com.gjsyoung.iteach.mapper.AuthorApplyMapper;
import com.gjsyoung.iteach.mapper.AuthorMapper;
import com.gjsyoung.iteach.mapper.UserMapper;
import com.gjsyoung.iteach.utils.CommonUtils;
import com.gjsyoung.iteach.utils.EmailUtil;
import com.gjsyoung.iteach.vo.GjsYoungException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.Id;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;


/**
 * create by cairuojin on 2018/09/05
 * 个人中心controller
 */
@Controller
public class PersonalController {

    private static final Logger logger = LoggerFactory.getLogger(PersonalController.class);

    @Autowired
    CommonUtils commonUtils;

    @Autowired
    EmailUtil emailUtil;

    @Autowired
    UserMapper userMapper;

    @Autowired
    AuthorMapper authorMapper;

    @Autowired
    AuthorApplyMapper authorApplyMapper;

    /**
     * 用户登录
     * @param out
     * @param request
     * @param session
     * @throws Exception
     */
    @RequestMapping("/login")
    public void login(PrintWriter out, HttpServletRequest request, HttpSession session) throws Exception {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userMapper.selectByUsername(username);
        if(user != null && password.equals(user.getPassword()))
        {
            session.setAttribute("user", user);
            out.print(true);
        } else {
            out.print(false);
        }
    }

    /**
     * 注册用户
     * @param user
     * @return
     */
    @RequestMapping("/register")
    public ModelAndView register(User user){
        logger.debug("注册用户：" + user);
        user.setStatus(0);  //未激活
        user.setLastupdatetime(new Date());
        user.setCreatetime(new Date());
        user.setAge(0);
        user.setSex(0);
        Random random = new Random();
        int i = random.nextInt(9);
        user.setImage("images/portrait/default" + i +".jpg");
        String uuid = commonUtils.getUUID();
        user.setCode(uuid);
        userMapper.insert(user);
        //发送激活邮件
        String emailMsg = "恭喜您注册成功，请点击下面的连接进行激活账户"
                + "<a href='http://cairuojin.club/activeUser?activeCode="+ uuid +"'><br>"	//连接
                + "http://cairuojin.club/activeUser?activeCode="+ uuid +"</a> <br>开始您的尧舜禹之旅";
        try {
            emailUtil.sendMail(user.getEmail(),emailMsg);
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException e) {
            e.printStackTrace();
        }
        ModelAndView nav = new ModelAndView("redirect:/registerSucceed");
        return nav;
    }

    /**
     * 激活用户
     * @param activeCode    激活码
     * @return
     * @throws Exception
     */
    @RequestMapping("/activeUser")
    public ModelAndView activeUser(String activeCode) throws Exception {
        logger.debug("用户激活：" + activeCode);
        User user = userMapper.selectByActiveCode(activeCode);
        if(user == null){
            return commonUtils.throwException("啊哦，找不到您的账号呢，请重新确认一下！");
        }
        if(user.getStatus() != 0){
            return commonUtils.throwException("啊哦，您的账号已经激活过了哦，快去登录吧！");
        }
        user.setStatus(1);
        user.setLastupdatetime(new Date());
        userMapper.updateByPrimaryKey(user);
        return  new ModelAndView("registerActive");
    }

    /**
     * 更新用户个人信息
     * @param user
     * @param session
     * @return
     */
    @RequestMapping("/updateMessage")
    @ResponseBody
    public String updateMessage(User user, HttpSession session){
        Object obj = session.getAttribute("user");
        if(obj == null)
            return "您还没有登录哦！";
        user.setId(((User)obj).getId());
        userMapper.updateByPrimaryKeySelective(user);
        User user1 = userMapper.selectByPrimaryKey(user.getId());   //更新资料
        session.setAttribute("user", user1);
        return "OK";
    }

    /**
     * 更新图片
     * @param file
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/updateImage")
    @ResponseBody
    public String updateImage(MultipartFile file, HttpServletRequest request) throws IOException {
        if(file == null)
            return "找不到您上传的文件哦！";
        else{
            Object obj = request.getSession().getAttribute("user");
            if(obj == null)
                return "您还没有登录哦！";
            User user = (User) obj;
            String fileName = file.getOriginalFilename();
            String type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
            if(type == null){
                return "您上传的类型有误！";
            }else{
                if(("GIF".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase()))){
                    String path = request.getSession().getServletContext().getRealPath("/WEB-INF/classes/static/images/portrait");
                    String trueFileName=String.valueOf(System.currentTimeMillis()) + fileName;
                    path = path + File.separator + trueFileName;
                    file.transferTo(new File(path));
                    user.setImage("images/portrait/" + trueFileName);
                    userMapper.updateByPrimaryKeySelective(user);
                    request.getSession().setAttribute("user",user);
                } else {
                    return "您上传的类型有误！";
                }
            }
        }
        return "OK";
    }

    /**
     * 修改密码
     * @param request
     * @param username
     * @param oldPassword
     * @param newPassword
     * @return
     */
    @RequestMapping("/updatePassword")
    @ResponseBody
    public String updatePassword(HttpServletRequest request, String username, String oldPassword, String newPassword){
        Object obj = request.getSession().getAttribute("user");
        if(obj == null)
            return "您还没有登录哦！";
        User user = (User) obj;
        if(!user.getUsername().equals(username)){
            return "您当前状态有误，请重新登录";
        }
        if(!user.getPassword().equals(oldPassword)){
            return "您输入的密码有误！";
        }
        user.setPassword(newPassword);
        userMapper.updateByPrimaryKeySelective(user);
        request.getSession().removeAttribute("user");
        return "OK" ;
    }

    /**
     * 作者申请
     * @param request
     * @param realName
     * @param IDcardNum
     * @param authorIntroduction
     * @return
     */
    @RequestMapping("/applyAuthor")
    @ResponseBody
    public String applyAuthor(HttpServletRequest request, String realName, String IDcardNum, String authorIntroduction){
        Object obj = request.getSession().getAttribute("user");
        if(obj == null)
            return "您还没有登录哦！";
        User user = (User) obj;
        Integer id = user.getId();
        AuthorApply authorApply = new AuthorApply();
        authorApply.setUserid(id);
        authorApply.setRealname(realName);
        authorApply.setIdcardnum(IDcardNum);
        authorApply.setLastupdatetime(new Date());
        authorApply.setCreatetime(new Date());
        authorApply.setStatus(0);
        authorApply.setAuthorintroduction(authorIntroduction);
        authorApplyMapper.insert(authorApply);
        return "OK" ;
    }





    /**
     * 异步校验用户名是否存在
     * @param out
     * @param request
     */
    @RequestMapping("/checkExistUsername")
    public void checkExistUsername(PrintWriter out, HttpServletRequest request){
        String username = request.getParameter("username");
        User user = userMapper.selectByUsername(username);
        if(user != null)
            out.print(false);    //已存在
        else
            out.print(true);
    }

    /**
     * 异步校验是否为作者名
     * @param out
     * @param request
     */
    @RequestMapping("/checkExistAuthor")
    public void checkExistAuthor(PrintWriter out, HttpServletRequest request){
        String nickname = request.getParameter("nickname");
        Author author = authorMapper.selectByNickname(nickname);
        if(author != null)
            out.print(false);    //已存在
        else
            out.print(true);
    }

    /**
     * 注销用户
     * @param session
     * @return
     */
    @RequestMapping("/cancellation")
    public ModelAndView cancellation(HttpSession session){
        session.removeAttribute("user");
        return new ModelAndView("redirect:/index");
    }

    /**
     * 跳转到个人中心
     * @param session
     * @return
     */
    @RequestMapping("/personal")
    public ModelAndView personal(HttpSession session){          //todo 前端jsp对状态3的判断
        Object obj = session.getAttribute("user");
        if(obj == null){
            return commonUtils.throwException("您还没有登录哦！");
        }
        ModelAndView mv = new ModelAndView("personal");
        User user = (User)obj;
        Integer id = user.getId();
        AuthorApply authorApply = authorApplyMapper.selectByPrimaryKey(id);
        if(authorApply != null)
            mv.addObject("authorApply",authorApply);
        else {
            mv.addObject("authorApply","no");
        }
        int randomInt = commonUtils.getRandomInt(5);
        mv.addObject("random",randomInt);
        session.setAttribute("pageHeader",6);//头
        return mv;
    }



    @RequestMapping("/toLogin")
    public ModelAndView toLogin(){
        int randomInt = commonUtils.getRandomInt(5);    //生成随机数
        ModelAndView mv = new ModelAndView("login");
        mv.addObject("random",randomInt);
        return mv;
    }
    @RequestMapping("/toRegister")
    public ModelAndView toRegister(){
        int randomInt = commonUtils.getRandomInt(5);
        ModelAndView mv = new ModelAndView("register");
        mv.addObject("random",randomInt);
        return mv;
    }
    @RequestMapping("/registerSucceed")
    public ModelAndView registerSueeccd(){
        return new ModelAndView("registerSucceed");
    }

}
