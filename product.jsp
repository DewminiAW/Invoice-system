<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - Invoicing System</title>
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
                <li><a href="view-invoices.jsp">Invoices</a></li>
                <li><a href="create-invoice.jsp">Create Invoice</a></li>
                <li><a href="product.jsp" class="active">Products</a></li>
            </ul>
        </nav>
    </header>

    <main class="container">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
            <h1>Products</h1>
            <button class="btn btn-primary" onclick="productManager.showAddProductForm()">
                + Add Product
            </button>
        </div>

        <!-- Products Table -->
        <div class="table-container">
            <table class="data-table" id="products-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Product Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="products-list">
                    <tr>
                        <td colspan="6" style="text-align: center;">Loading products...</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </main>

    <!-- Add Product Modal -->
    <div class="modal" id="productModal">
        <div class="modal-content">
            <h2>Add New Product</h2>
            <form id="productForm" onsubmit="return productManager.saveProduct(event)">
                <div class="form-group">
                    <label for="productName">Product Name *</label>
                    <input type="text" class="form-control" id="productName" required>
                </div>

                <div class="form-group">
                    <label for="productDescription">Description</label>
                    <textarea class="form-control" id="productDescription" rows="3"></textarea>
                </div>

                <div class="form-group">
                    <label for="productPrice">Price *</label>
                    <input type="number" class="form-control" id="productPrice" step="0.01" min="0" required>
                </div>

                <div class="form-group">
                    <label for="productStock">Stock Quantity *</label>
                    <input type="number" class="form-control" id="productStock" min="0" required>
                </div>

                <div style="display: flex; gap: 1rem; justify-content: flex-end; margin-top: 1rem;">
                    <button type="button" class="btn" onclick="productManager.closeModal()">Cancel</button>
                    <button type="submit" class="btn btn-success">Save Product</button>
                </div>
            </form>
        </div>
    </div>

    <script src="js/script.js"></script>
</body>
</html>