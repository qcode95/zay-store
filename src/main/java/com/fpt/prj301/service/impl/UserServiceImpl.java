package com.fpt.prj301.service.impl;

import com.fpt.prj301.model.User;
import com.fpt.prj301.repository.UserRepository;
import com.fpt.prj301.service.UserService;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserServiceImpl implements UserService {
    
    private final UserRepository userRepo = new UserRepository();

    @Override
    public List<User> GetAllUser() {
        List<User> list = new ArrayList<>();
        try {
            list = this.userRepo.getAllUser();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }

    @Override
    public int CountUser() {
        int count = 0;
        try {
            count = this.userRepo.countUser();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return count;
    }

    @Override
    public User LoginUser(User user) {
        User userLogin = null;
        try {
            userLogin = this.userRepo.loginUser(user);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return userLogin;
    }

    @Override
    public User GetUserById(int id) {
        User user = null;
        try {
            user = this.userRepo.getUserById(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return user;
    }

    @Override
    public String GetEmailById(int id) {
        String email = null;
        try {
            email = this.userRepo.getEmailById(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return email;
    }

    @Override
    public String GetNameById(int id) {
        String name = null;
        try {
            name = this.userRepo.getNameById(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return name;
    }

    @Override
    public String GetAvatarById(int id) {
        String avatar = null;
        try {
            avatar = this.userRepo.getAvatarById(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return avatar;
    }

    @Override
    public String GetMobileById(int id) {
        String mobile = null;
        try {
            mobile = this.userRepo.getMobileById(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return mobile;
    }

    @Override
    public String GetAddressById(int id) {
        String address = null;
        try {
            address = this.userRepo.getAddressById(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return address;
    }

    @Override
    public int InsertAccount(User user) {
        int insert = 0;
        try {
            insert = this.userRepo.insertAccount(user);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return insert;
    }

    @Override
    public User CheckAccount(String email) {
        User user = null;
        try {
            user = this.userRepo.checkAccount(email);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return user;
    }

    @Override
    public int UpdateUser(int id, String email, String name, int mobile, String address) {
        int update = 0;
        try {
            update = this.userRepo.UpdateUser(id, email, name, mobile, address);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return update;
    }

    @Override
    public int UpdatePassword(String email, String password) {
        int update = 0;
        try {
            update = this.userRepo.UpdatePassword(email, password);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return update;
    }

    @Override
    public int UpdateInformation(String email, String name, String avatar, int phone, int id) {
        int update = 0;
        try {
            update = this.userRepo.UpdateInformation(email, name, avatar, phone, id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return update;
    }
    
    @Override
    public void UpdateDiscount(int id) {
        try {
            this.userRepo.UpdateDiscount(id);
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
