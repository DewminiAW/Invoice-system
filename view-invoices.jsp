<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Invoices - Invoicing System</title>
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
                <li><a href="dashboard.jsp">Dashboard</a></li>
                <li><a href="view-invoices.jsp" class="active">Invoices</a></li>
                <li><a href="create-invoice.jsp">Create Invoice</a></li>
                <li><a href="product.jsp">Products</a></li>
            </ul>
        </nav>
    </header>

    <main class="container">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
            <h1>Invoices</h1>
            <a href="create-invoice.jsp" class="btn btn-primary">+ New Invoice</a>
        </div>

        <!-- Search and Filter -->
        <div class="search-bar">
            <input type="text" class="search-input" id="searchInvoices"
                   placeholder="Search by invoice number or customer name...">

            <select class="filter-select" id="statusFilter">
                <option value="all">All Status</option>
                <option value="paid">Paid</option>
                <option value="pending">Pending</option>
                <option value="overdue">Overdue</option>
            </select>

            <input type="date" class="filter-select" id="dateFrom" placeholder="From Date">
            <input type="date" class="filter-select" id="dateTo" placeholder="To Date">

            <button class="btn" onclick="invoiceManager.filterInvoices()">Apply Filters</button>
        </div>

        <!-- Invoices Table -->
        <div class="table-container">
            <table class="data-table" id="invoice-table">
                <thead>
                    <tr>
                        <th>Invoice #</th>
                        <th>Customer</th>
                        <th>Date</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="6" style="text-align: center;">Loading invoices...</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </main>

    <!-- Invoice Details Modal -->
    <div class="modal" id="invoiceModal">
        <div class="modal-content">
            <!-- Content will be loaded dynamically -->
        </div>
    </div>

    <script src="js/script.js"></script>
</body>
</html>