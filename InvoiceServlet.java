package controller;

import model.Invoice;
import model.Product;
import utill.hibernateutil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query; // මෙය අලුතින් එකතු කරන්න

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/InvoiceServlet")
public class InvoiceServlet extends HttpServlet {

    // Dashboard සහ Dropdown සඳහා දත්ත ලබා ගැනීම (GET Method)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        response.setContentType("application/json"); // JSON ලෙස දත්ත යැවීමට

        try (Session session = hibernateutil.getSessionFactory().openSession()) {
            if ("dashboardStats".equals(action)) {
                // Total Products count එක ලබා ගැනීම
                Long pCount = (Long) session.createQuery("SELECT count(p) FROM Product p").uniqueResult();

                // Total Sales sum එක ලබා ගැනීම
                Double totalSales = (Double) session.createQuery("SELECT sum(i.amount) FROM Invoice i").uniqueResult();
                if (totalSales == null) totalSales = 0.0;

                // සරල JSON එකක් ලෙස පිළිතුර යැවීම
                String json = "{\"totalProducts\":" + pCount + ", \"totalSales\":" + totalSales + "}";
                response.getWriter().write(json);

            } else if ("listProducts".equals(action)) {
                // Product Dropdown එක සඳහා සියලුම භාණ්ඩ ලබා ගැනීම
                List<Product> products = session.createQuery("from Product", Product.class).list();

                // මෙහිදී සරලව Product නම් සහ මිල ගණන් JSON ලෙස සකසා යැවිය හැක
                // (සටහන: Gson වැනි Library එකක් නැතිව සරලව String එකක් ලෙස)
                StringBuilder sb = new StringBuilder("[");
                for (int i = 0; i < products.size(); i++) {
                    Product p = products.get(i);
                    sb.append(String.format("{\"id\":%d, \"name\":\"%s\", \"price\":%.2f}",
                            p.getId(), p.getName(), p.getUnitPrice()));
                    if (i < products.size() - 1) sb.append(",");
                }
                sb.append("]");
                response.getWriter().write(sb.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // දත්ත Save කිරීම (පවතින POST Method එක)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // doPost එක ඇතුළත saveProduct සඳහා මෙය එකතු කරන්න
        if ("saveProduct".equals(action)) {
            try (Session session = hibernateutil.getSessionFactory().openSession()) {
                Transaction t = session.beginTransaction();

                Product p = new Product();
                p.setName(request.getParameter("name"));
                p.setUnitPrice(Double.parseDouble(request.getParameter("price")));
                p.setQty(Integer.parseInt(request.getParameter("qty")));

                session.save(p);
                t.commit();
                response.getWriter().write("Success");
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("Error");
            }
        }
    }
}// doPost එක ඇතුළත saveProduct සඳහා මෙය එකතු කරන්න
