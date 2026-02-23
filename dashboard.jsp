<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Invoicing System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header class="main-header">
        <nav class="nav-menu">
            <div class="logo-container">
                <img src="images/1.jpg" alt="Logo">
                <h2>Invoice System</h2>
            </div>
            <ul class="nav-links">
                <li><a href="dashboard.jsp" class="active">Dashboard</a></li>
                <li><a href="view-invoices.jsp">Invoices</a></li>
                <li><a href="create-invoice.jsp">Create Invoice</a></li>
                <li><a href="product.jsp">Products</a></li>
            </ul>
        </nav>
    </header>

    <main class="container">
        <h1>Dashboard</h1>

        <!-- Statistics Cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon">📊</div>
                <div class="stat-info">
                    <h3 id="totalInvoices">0</h3>
                    <p>Total Invoices</p>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon">💰</div>
                <div class="stat-info">
                    <h3 id="totalRevenue">$0</h3>
                    <p>Total Revenue</p>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon">⏳</div>
                <div class="stat-info">
                    <h3 id="pendingInvoices">0</h3>
                    <p>Pending Invoices</p>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon">⚠️</div>
                <div class="stat-info">
                    <h3 id="overdueInvoices">0</h3>
                    <p>Overdue Invoices</p>
                </div>
            </div>
        </div>

        <!-- Recent Invoices -->
        <div style="margin-top: 2rem;">
            <h2>Recent Invoices</h2>
            <div class="table-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Invoice #</th>
                            <th>Customer</th>
                            <th>Date</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="recentInvoices">
                        <tr>
                            <td colspan="6" style="text-align: center;">Loading recent invoices...</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <script src="js/script.js"></script>
</body>
</html>