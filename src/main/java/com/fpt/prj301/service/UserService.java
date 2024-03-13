package com.fpt.prj301.service;

import com.fpt.prj301.model.User;
import java.util.List;

public interface UserService {
    
    public List<User> GetAllUser();

    public int CountUser();

    public User LoginUser(User user);
    
    public User GetUserById(int id);

    public String GetEmailById(int id);
    
    public String GetNameById(int id);
    
    public String GetAvatarById(int id);
    
    public String GetMobileById(int id);
    
    public String GetAddressById(int id);
    
    public int InsertAccount(User user);

    public User CheckAccount(String email);

    public int UpdateUser(int id, String email, String name, int mobile, String address);

    public int UpdatePassword(String email, String password);
    
    public int UpdateInformation(String email, String name, String avatar, int phone, int id);
    
    public void UpdateDiscount(int id);
    
}
