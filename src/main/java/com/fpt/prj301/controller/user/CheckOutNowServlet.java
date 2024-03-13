package com.fpt.prj301.controller.user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fpt.prj301.model.Bill;
import com.fpt.prj301.model.Order;
import com.fpt.prj301.model.OrderDetail;
import com.fpt.prj301.model.Product;
import com.fpt.prj301.model.Transaction;
import com.fpt.prj301.model.User;
import com.fpt.prj301.service.BillService;
import com.fpt.prj301.service.OrderDetailService;
import com.fpt.prj301.service.OrderService;
import com.fpt.prj301.service.ProductService;
import com.fpt.prj301.service.TransactionService;
import com.fpt.prj301.service.UserService;
import com.fpt.prj301.service.impl.BillServiceImpl;
import com.fpt.prj301.service.impl.OrderDetailServiceImpl;
import com.fpt.prj301.service.impl.OrderServiceImpl;
import com.fpt.prj301.service.impl.ProductServiceImpl;
import com.fpt.prj301.service.impl.TransactionServiceImpl;
import com.fpt.prj301.service.impl.UserServiceImpl;

public class CheckOutNowServlet extends HttpServlet {

    private static final long serialVersionUID = 3275378119174689846L;

    private ProductService productService;
    private OrderService orderService;
    private OrderDetailService orderDetailService;
    private TransactionService transactionService;
    private BillService billService;
    private UserService userService;

    @Override
    public void init() {
        productService = new ProductServiceImpl();
        orderService = new OrderServiceImpl();
        transactionService = new TransactionServiceImpl();
        orderDetailService = new OrderDetailServiceImpl();
        billService = new BillServiceImpl();
        userService = new UserServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Base entity
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        Date date = new Date();
        User user = (User) request.getSession().getAttribute("account");

        // Product's entity
        int productId = Integer.parseInt(request.getParameter("id"));
        int total = Integer.parseInt(request.getParameter("total"));
        int size = Integer.parseInt(request.getParameter("size"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Bill Entity
        String firstName = request.getParameter("first-name");
        String lastName = request.getParameter("last-name");
        String name = firstName + " " + lastName;

        String province = request.getParameter("province");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String street = request.getParameter("street");
        String address = street + ", " + ward + ", " + district + ", " + province;

        int postCode = Integer.parseInt(request.getParameter("post-code"));
        int mobile = Integer.parseInt(request.getParameter("phone"));
        String email = request.getParameter("email");

        int delivery = Integer.parseInt(request.getParameter("delivery"));
        int code = Integer.parseInt(request.getParameter("code"));

        if (delivery != 1 && delivery != 2) {
            delivery = 1;
        }
        
        if(code == 1){
            userService.UpdateDiscount(user.getId());
        }

        // Insert
        if (user != null) {
            Order order = new Order();
            order.setOrderId(orderService.GetOrderIdInserted());
            order.setUid(user.getId());
            order.setDate(formatter.format(date));
            order.setAmount(total);
            order.setStatus("Pending");
            order.setDeliveryId(delivery);
            order.setDiscountId(code);

            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrderId(orderService.GetOrderIdInserted());
            orderDetail.setProductId(productId);
            orderDetail.setQuantity(quantity);
            orderDetail.setAmount(productService.GetPriceProductById(productId) * quantity);
            orderDetail.setSize(size);

            Transaction transaction = new Transaction();
            transaction.setUid(user.getId());
            transaction.setOid(orderService.GetOrderIdInserted());
            transaction.setAmount(total);
            transaction.setDate(formatter.format(date));

            Bill bill = new Bill();
            bill.setOid(order.getOrderId());
            bill.setName(name);
            bill.setEmail(email);
            bill.setMobile(mobile);
            bill.setAddress(address);
            bill.setPostCode(postCode);

            int billInsert = billService.InsertBill(bill);
            int orderInsert = orderService.InsertOrder(order);
            int orderDetailInsert = orderDetailService.InsertOrderDetail(orderDetail);
            int transactionInsert = transactionService.InsertTransaction(transaction);

            Product product = productService.GetProductById(productId);
            int pQuantity = product.getQuantity();
            int productUpdate = productService.UpdateNewQuantity(productId, (pQuantity - quantity));

            if (orderInsert == 0 || orderDetailInsert == 0 || transactionInsert == 0 || productUpdate == 0 || billInsert == 0) {
                request.setAttribute("msg", "Order failed !!");
                request.getRequestDispatcher("./views/product-single/ProductSingle.jsp").forward(request, response);
            } else {
                response.sendRedirect("./order-user");
            }
        } else {
            response.sendRedirect("./login");
        }
    }
}
