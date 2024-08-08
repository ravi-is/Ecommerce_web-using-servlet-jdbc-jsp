package pack1;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/AdminServlet")
@MultipartConfig
public class AdminServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "rootHost#123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String price = request.getParameter("price");
        String discount = request.getParameter("discount");
        Part filePart = request.getPart("image");
        String fileName = filePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "images" + File.separator + fileName;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "INSERT INTO products (title, price, discount, image) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, title);
            statement.setString(2, price);
            statement.setString(3, discount);
            statement.setString(4, "images/" + fileName);
            String uploadPath1 = "D:\\ecplice\\Mini_Project\\src\\main\\webapp\\images\\" + fileName;

            filePart.write(uploadPath1);
            statement.executeUpdate();
            connection.close();

            request.setAttribute("successMessage", "Product added successfully!");
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Product addition failed. Please try again.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
