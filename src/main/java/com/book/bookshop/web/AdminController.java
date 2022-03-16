package com.book.bookshop.web;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.book.bookshop.entity.*;
import com.book.bookshop.entity.enums.Category;
import com.book.bookshop.entity.enums.Suit;
import com.book.bookshop.service.AdminService;
import com.book.bookshop.service.BookService;
import com.book.bookshop.service.UserService;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.logging.Logger;

/**
 * @Author:yizhongwei
 * @Date:3/8 15:08
 * 管理员控制层
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    //    Logger logger = LoggerFactory.getLogger(Object.class);
//    Logger l = Logger.getLogger(AdminController.class)
    @Autowired
    private AdminService adminService;
    @Autowired
    private BookService bookService;

    @Autowired
    private UserService userService;
    //管理员登录
    @ResponseBody
    @PostMapping("/login")
    public String login(Admin admin, HttpSession session,String code) {
        return adminService.loginCheck(admin, session,code);
    }

    //去后台管理首页
    @RequestMapping("/toBookAdmin")
    public String toAllBooks(Model model, HttpSession session) {
        return "admin/bookAdmin";
    }

    //【分页】【全部书籍】【后台】
    @RequestMapping("/getBookListByPage")
    public String getOrderListData(HttpSession session, Model model, Integer page, Integer pageSize) {
        Page pages = new Page<Book>(page, pageSize);
        IPage<Book> iPage = bookService.page(pages, new QueryWrapper<>());
        List<Book> bookList = iPage.getRecords();
        for (Book book : bookList) {
            if (book.getCategory().toString().equals("SELECTTED")) book.setCate("精选图书");
            if (book.getCategory().toString().equals("RECOMMEND")) book.setCate("推荐图书");
            if (book.getCategory().toString().equals("BARGAGIN")) book.setCate("特价图书");
        }
        model.addAttribute("bookList", bookList);
        model.addAttribute("pre", page - 1);
        model.addAttribute("next", page + 1);
        model.addAttribute("cur", page);
        model.addAttribute("pages", iPage.getPages());
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("total",iPage.getTotal());
        return "admin/allBooksData";
    }


    //删除图书
    @ResponseBody
    @RequestMapping("/deleteBook")
    public String deleteBook(Integer bookId) {
        boolean b = bookService.removeById(bookId);
        if (b)
            return "success";
        else return "fail";

    }

    @RequestMapping("/toAddBook")
    public String toAddBook() {
        return "admin/addBook";
    }


    //添加商品
    @RequestMapping("/addBook")
    public String toAddBook(Book book, MultipartFile bookPic) throws IOException {

        if (book.getCate().equals("精选图书")) book.setCategory(Category.SELECTTED);
        if (book.getCate().equals("推荐图书")) book.setCategory(Category.RECOMMEND);
        if (book.getCate().equals("特价图书")) book.setCategory(Category.BARGAGIN);
        book.setPublishDate(new Date());
        book.setAuthorLoc("中国");
        book.setSuit(Suit.YES);
        String bookPicName = bookPic.getOriginalFilename();
        book.setImgUrl(bookPicName);
        String filePath = "D:/images/";
        File dest = new File(filePath + bookPicName);
        bookPic.transferTo(dest);
        bookService.save(book);
        return "admin/bookAdmin";
    }

    //跳转至更新图书页面
    @RequestMapping("/toUpdateBook")
    public String toUpdateBook(Model model, @RequestParam("bookId") Integer id,HttpSession session) {
        Book book = bookService.getById(id);
        book.setOldPrice(book.getNewPrice());
        session.setAttribute("oldPrice",book.getOldPrice());
        model.addAttribute("book", book);
        System.out.println(book);
        return "admin/updateBook";
    }

    //更新图书
    @RequestMapping("/updateBook")
    public String updateBook(Book book, MultipartFile bookPic,HttpSession session) throws IOException {
        System.out.println(book);
        System.out.println(bookPic.getOriginalFilename());
        String bookPicName = bookPic.getOriginalFilename();
        book.setImgUrl(bookPicName);
        String filePath = "D:/images/";
        File dest = new File(filePath + bookPicName);
        book.setOldPrice((double)session.getAttribute("oldPrice"));
        bookPic.transferTo(dest);
        bookService.updateById(book);
        return "admin/bookAdmin";
    }

    //多选删除图书
    @RequestMapping("/deleteBooks")
    @ResponseBody
    public String deleteBooks(String ids){
        boolean flag = bookService.removeByIds(Arrays.asList(ids.split(",")));
        if (flag)
            return "success";
        else return "fail";

    }
    @RequestMapping("/toAllUsers")
    public String toAllUsers(Model model){
        List<User> userList = userService.list();
        model.addAttribute("userList",userList);
        return "admin/allUsers";
    }
    @RequestMapping("/forbidUser")
    @ResponseBody
    public String forbidUser(Integer userId){
        User user = userService.getById(userId);
        user.setState(2);
        if (userService.saveOrUpdate(user)){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("/unforbidUser")
    @ResponseBody
    public String unforbidUser(Integer userId){
        User user = userService.getById(userId);
        user.setState(1);
        if (userService.saveOrUpdate(user)){
            return "success";
        }else {
            return "fail";
        }
    }

    @RequestMapping("/deleteUsers")
    @ResponseBody
    public String deleteUsers(String ids){
        List<User> users = (List<User>) userService.listByIds(Arrays.asList(ids.split(",")));
        for (User user:users){
            user.setState(2);
        }
        if (userService.saveOrUpdateBatch(users)){
            return "success";
        }else {
            return "fail";
        }
    }

}
