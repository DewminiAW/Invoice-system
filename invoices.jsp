<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Invoice - Invoicing System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Header -->
    <header class="main-header">
        <nav class="nav-menu">
            <div class="logo-container">
                <img src="images/1.jpg" alt="Logo">
                <h2>Invoice System</h2>
            </div>
            <ul class="nav-links">
                <li><a href="dashboard.jsp">Dashboard</a></li>
                <li><a href="view-invoices.jsp">Invoices</a></li>
                <li><a href="create-invoice.jsp" class="active">Create Invoice</a></li>
                <li><a href="product.jsp">Products</a></li>
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <main class="container">
        <div class="form-container">
            <h1>Create New Invoice</h1>

            <form id="invoiceForm" onsubmit="return invoiceManager.createInvoice(event)">
                <!-- Invoice Information -->
                <div class="form-group">
                    <label for="invoiceNumber">Invoice Number *</label>
                    <input type="text" class="form-control" id="invoiceNumber" name="invoiceNumber"
                           required pattern="INV-\d{4}"
                           title="Format: INV-XXXX (e.g., INV-0001)">
                </div>

                <div class="form-group">
                    <label for="customerName">Customer Name *</label>
                    <input type="text" class="form-control" id="customerName" name="customerName"
                           required minlength="2">
                </div>

                <div class="form-group">
                    <label for="customerEmail">Customer Email *</label>
                    <input type="email" class="form-control" id="customerEmail" name="customerEmail"
                           required>
                </div>

                <div class="form-row" style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                    <div class="form-group">
                        <label for="date">Invoice Date *</label>
                        <input type="date" class="form-control" id="date" name="date" required>
                    </div>

                    <div class="form-group">
                        <label for="dueDate">Due Date *</label>
                        <input type="date" class="form-control" id="dueDate" name="dueDate" required>
                    </div>
                </div>

                <!-- Invoice Items -->
                <h3>Invoice Items</h3>
                <div id="invoiceItems" class="invoice-items">
                    <!-- Items will be added here dynamically -->
                </div>

                <button type="button" class="btn btn-primary" onclick="productManager.addItemRow()">
                    + Add Item
                </button>

                <!-- Notes -->
                <div class="form-group" style="margin-top: 1rem;">
                    <label for="notes">Notes</label>
                    <textarea class="form-control" id="notes" name="notes" rows="3"></textarea>
                </div>

                <!-- Form Actions -->
                <div style="display: flex; gap: 1rem; justify-content: flex-end; margin-top: 2rem;">
                    <button type="button" class="btn" onclick="window.location.href='view-invoices.jsp'">
                        Cancel
                    </button>
                    <button type="submit" class="btn btn-success">
                        Create Invoice
                    </button>
                </div>
            </form>
        </div>
    </main>

    <script src="js/script.js"></script>
</body>
</html>