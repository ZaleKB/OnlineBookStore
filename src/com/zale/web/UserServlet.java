package com.zale.web;

import com.google.gson.Gson;
import com.zale.pojo.User;
import com.zale.service.UserService;
import com.zale.service.impl.UserServiceImpl;
import com.zale.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class UserServlet extends BaseServlet {

    private UserService userService = new UserServiceImpl();

    /**
     * ajax checking
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void ajaxExistsUsername (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");

        boolean existsUsername = userService.existsUsername(username);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("existsUsername", existsUsername);

        Gson gson = new Gson();
        String json = gson.toJson(resultMap);

        //transform to Json to front-end used by ajax
        resp.getWriter().write(json);
    }

    /**
     * logout function
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1、destroy session
        req.getSession().invalidate();
        // 2、redirect to front page
        resp.sendRedirect(req.getContextPath());
    }

    /**
     * Deal with login function
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void login (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        // invoke userService.login()
        User loginUser = userService.login(new User(null, username, password, null));
        // if null, then fail
        if (loginUser == null) {
            // save information to request domain
            req.setAttribute("msg", "Username or Password incorrect !");
            req.setAttribute("username", username);
            // jump to login page  dispatcher share the same request information
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
        }
        else {

            // save user information to Session domain
            req.getSession().setAttribute("user", loginUser);
            req.getRequestDispatcher("/pages/user/login_success.jsp").forward(req, resp);
        }

    }

    protected void register (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String token = (String) req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);


        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String code = req.getParameter("code");

        User user = WebUtils.copyParamToBean(req.getParameterMap(), new User());

        // check if verification code correct
        if (token!=null && token.equalsIgnoreCase(code)) {

            if (userService.existsUsername(username)) {

                // save echo to request
                req.setAttribute("msg", "Username Already Exists !!");
                req.setAttribute("username", username);
                req.setAttribute("email", email);

                req.getRequestDispatcher("/pages/user/register.jsp").forward(req, resp);
            } else {
                //username usable
                userService.registerUser(user);
                //userService.registerUser(new User(null, username, password, email));
                req.getSession().setAttribute("user", user);

                req.getRequestDispatcher("/pages/user/register_success.jsp").forward(req, resp);
            }
        } else {

            req.setAttribute("msg", "Verification Code Incorrect !!");
            req.setAttribute("username", username);
            req.setAttribute("email", email);

            req.getRequestDispatcher("/pages/user/register.jsp").forward(req, resp);
        }
    }

}
