package com.fpt.prj301.controller.user;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.fpt.prj301.model.User;
import com.fpt.prj301.service.UserService;
import com.fpt.prj301.service.impl.UserServiceImpl;

@MultipartConfig()
public class EditInformationServlet extends HttpServlet {

    private static final long serialVersionUID = 1352218684266654554L;

    private UserService userService;

    @Override
    public void init() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        User user = (User) request.getSession().getAttribute("account");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int phone = Integer.parseInt(request.getParameter("phone"));
        int id = user.getId();
        String avatarUpdate = user.getAvatar();
        
        Part avatar = request.getPart("avatar");

        if (avatar.getSize() > 0) {
            // Upload file
            String folderUpload = "/files";
            String pathUploadFolder = request.getServletContext().getRealPath(folderUpload);
            String fileName = Paths.get(avatar.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Paths.get(pathUploadFolder))) {
                Files.createDirectories(Paths.get(pathUploadFolder));
            }
            String urlImage = pathUploadFolder + "/" + fileName;
            avatar.write(urlImage);

            avatarUpdate = folderUpload + "/" + fileName;
        }
        int updated = userService.UpdateInformation(email, name, avatarUpdate, phone, id);
        if (updated > 0) {
            request.setAttribute("successMsg", "Your information changed. Please Log Out to see your new information !");
            request.getRequestDispatcher("./views/profile/Profile.jsp").forward(request, response);
        } else {
            request.setAttribute("failedMsg", "Your information can not be changed !");
            request.getRequestDispatcher("./views/profile/Profile.jsp").forward(request, response);
        }

    }

}
