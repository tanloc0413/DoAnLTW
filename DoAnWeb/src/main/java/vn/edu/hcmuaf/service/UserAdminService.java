package vn.edu.hcmuaf.service;


import vn.edu.hcmuaf.dao.UserDao;
import vn.edu.hcmuaf.db.JDBIConnector;
import vn.edu.hcmuaf.model.User;

import java.util.List;
import java.util.stream.Collectors;

public class UserAdminService {
    private static UserAdminService instance;

    public static UserAdminService getInstance(){
        if (instance==null) instance = new UserAdminService();
        return instance;
    }

    public User checkLogin(String phone, String pass){
        User userAdminbyemail = UserDao.getUserPhone(phone);
        if (userAdminbyemail !=null && userAdminbyemail.getPhone().equals(phone) && userAdminbyemail.getPassword().equals(pass))
                return userAdminbyemail;
        return null;
    }

    public static void main(String[] args) {

        User u = UserAdminService.getInstance().checkLogin("thinh", "123");
        System.out.println(u);
    }
}
