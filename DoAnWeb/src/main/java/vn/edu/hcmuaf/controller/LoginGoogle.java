package vn.edu.hcmuaf.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name = "Login", value = "/LoginGoogle")
public class LoginGoogle extends HttpServlet {
    private static final String CLIENT_ID = "YOUR_GOOGLE_CLIENT_ID";
    private static final String REDIRECT_URI = "http://localhost:8080/yourapp/callback"; // URL Callback của bạn
    private static final String SCOPE = "https://www.googleapis.com/auth/userinfo.profile";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String authorizationUrl = "https://accounts.google.com/o/oauth2/auth?response_type=code&client_id="
                + CLIENT_ID
                + "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8")
                + "&scope=" + URLEncoder.encode(SCOPE, "UTF-8");
        response.sendRedirect(authorizationUrl);
    }
}
