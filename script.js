// Global state management
const state = {
    invoices: [],
    products: [],
    currentInvoice: null,
    filters: {
        search: '',
        status: 'all',
        dateFrom: '',
        dateTo: ''
    }
};

// API endpoints (AJAX calls)
const API = {
    // Invoice endpoints
    invoices: {
        getAll: '/api/invoices',
        getById: (id) => `/api/invoices/${id}`,
        create: '/api/invoices',
        update: (id) => `/api/invoices/${id}`,
        delete: (id) => `/api/invoices/${id}`,
        search: '/api/invoices/search'
    },

    // Product endpoints
    products: {
        getAll: '/api/products',
        getById: (id) => `/api/products/${id}`
    }
};

// Utility functions
const utils = {
    formatCurrency: (amount) => {
        return new Intl.NumberFormat('en-US', {
            style: 'currency',
            currency: 'USD'
        }).format(amount);
    },

    formatDate: (date) => {
        return new Date(date).toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'short',
            day: 'numeric'
        });
    },

    showAlert: (message, type = 'success') => {
        const alertDiv = document.createElement('div');
        alertDiv.className = `alert alert-${type}`;
        alertDiv.innerHTML = `
            <span>${message}</span>
            <button onclick="this.parentElement.remove()">&times;</button>
        `;

        const container = document.querySelector('.container');
        container.insertBefore(alertDiv, container.firstChild);

        // Auto remove after 5 seconds
        setTimeout(() => alertDiv.remove(), 5000);
    },

    showLoading: (element) => {
        element.innerHTML = '<div class="spinner"></div>';
    },

    hideLoading: (element) => {
        const spinner = element.querySelector('.spinner');
        if (spinner) spinner.remove();
    }
};

// AJAX Request Handler
const ajax = {
    get: async (url) => {
        try {
            const response = await fetch(url, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            return await response.json();
        } catch (error) {
            console.error('GET request failed:', error);
            utils.showAlert('Failed to fetch data', 'error');
            throw error;
        }
    },

    post: async (url, data) => {
        try {
            const response = await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            return await response.json();
        } catch (error) {
            console.error('POST request failed:', error);
            utils.showAlert('Failed to save data', 'error');
            throw error;
        }
    },

    put: async (url, data) => {
        try {
            const response = await fetch(url, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            });

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            return await response.json();
        } catch (error) {
            console.error('PUT request failed:', error);
            utils.showAlert('Failed to update data', 'error');
            throw error;
        }
    },

    delete: async (url) => {
        try {
            const response = await fetch(url, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                }
            });

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            return await response.json();
        } catch (error) {
            console.error('DELETE request failed:', error);
            utils.showAlert('Failed to delete data', 'error');
            throw error;
        }
    }
};

// Invoice Management Functions
const invoiceManager = {
    // Load all invoices
    loadInvoices: async () => {
        const tableBody = document.querySelector('#invoice-table tbody');
        if (!tableBody) return;

        utils.showLoading(tableBody);

        try {
            const invoices = await ajax.get(API.invoices.getAll);
            state.invoices = invoices;
            invoiceManager.renderInvoices(invoices);
        } catch (error) {
            console.error('Failed to load invoices:', error);
        } finally {
            utils.hideLoading(tableBody);
        }
    },

    // Render invoices in table
    renderInvoices: (invoices) => {
        const tableBody = document.querySelector('#invoice-table tbody');
        if (!tableBody) return;

        if (invoices.length === 0) {
            tableBody.innerHTML = `
                <tr>
                    <td colspan="7" style="text-align: center; padding: 2rem;">
                        No invoices found
                    </td>
                </tr>
            `;
            return;
        }

        tableBody.innerHTML = invoices.map(invoice => `
            <tr>
                <td>${invoice.invoiceNumber}</td>
                <td>${invoice.customerName}</td>
                <td>${utils.formatDate(invoice.date)}</td>
                <td>${utils.formatCurrency(invoice.total)}</td>
                <td>
                    <span class="status-badge status-${invoice.status.toLowerCase()}">
                        ${invoice.status}
                    </span>
                </td>
                <td>
                    <div class="action-buttons">
                        <button class="btn-icon btn-view" onclick="invoiceManager.viewInvoice(${invoice.id})">
                            👁️
                        </button>
                        <button class="btn-icon btn-edit" onclick="invoiceManager.editInvoice(${invoice.id})">
                            ✏️
                        </button>
                        <button class="btn-icon btn-delete" onclick="invoiceManager.deleteInvoice(${invoice.id})">
                            🗑️
                        </button>
                    </div>
                </td>
            </tr>
        `).join('');
    },

    // Create new invoice
    createInvoice: async (event) => {
        event.preventDefault();

        const form = event.target;
        const formData = new FormData(form);

        const invoiceData = {
            invoiceNumber: formData.get('invoiceNumber'),
            customerName: formData.get('customerName'),
            customerEmail: formData.get('customerEmail'),
            date: formData.get('date'),
            dueDate: formData.get('dueDate'),
            items: invoiceManager.getInvoiceItems(),
            notes: formData.get('notes'),
            status: 'pending'
        };

        // Calculate total
        invoiceData.total = invoiceData.items.reduce((sum, item) =>
            sum + (item.quantity * item.unitPrice), 0
        );

        try {
            const result = await ajax.post(API.invoices.create, invoiceData);
            utils.showAlert('Invoice created successfully!', 'success');

            // Redirect to invoices list after 1 second
            setTimeout(() => {
                window.location.href = 'view-invoices.jsp';
            }, 1000);
        } catch (error) {
            console.error('Failed to create invoice:', error);
            utils.showAlert('Failed to create invoice', 'error');
        }
    },

    // Get invoice items from form
    getInvoiceItems: () => {
        const items = [];
        const itemRows = document.querySelectorAll('.item-row');

        itemRows.forEach(row => {
            const description = row.querySelector('.item-description')?.value;
            const quantity = parseFloat(row.querySelector('.item-quantity')?.value);
            const unitPrice = parseFloat(row.querySelector('.item-price')?.value);

            if (description && quantity && unitPrice) {
                items.push({
                    description,
                    quantity,
                    unitPrice,
                    total: quantity * unitPrice
                });
            }
        });

        return items;
    },

    // View invoice details
    viewInvoice: async (id) => {
        try {
            const invoice = await ajax.get(API.invoices.getById(id));

            // Open modal with invoice details
            const modal = document.getElementById('invoiceModal');
            const modalContent = modal.querySelector('.modal-content');

            modalContent.innerHTML = `
                <h2>Invoice #${invoice.invoiceNumber}</h2>
                <div class="invoice-details">
                    <p><strong>Customer:</strong> ${invoice.customerName}</p>
                    <p><strong>Email:</strong> ${invoice.customerEmail}</p>
                    <p><strong>Date:</strong> ${utils.formatDate(invoice.date)}</p>
                    <p><strong>Due Date:</strong> ${utils.formatDate(invoice.dueDate)}</p>
                    <p><strong>Status:</strong>
                        <span class="status-badge status-${invoice.status.toLowerCase()}">
                            ${invoice.status}
                        </span>
                    </p>

                    <h3>Items</h3>
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Description</th>
                                <th>Quantity</th>
                                <th>Unit Price</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            ${invoice.items.map(item => `
                                <tr>
                                    <td>${item.description}</td>
                                    <td>${item.quantity}</td>
                                    <td>${utils.formatCurrency(item.unitPrice)}</td>
                                    <td>${utils.formatCurrency(item.total)}</td>
                                </tr>
                            `).join('')}
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="3" style="text-align: right;"><strong>Total:</strong></td>
                                <td><strong>${utils.formatCurrency(invoice.total)}</strong></td>
                            </tr>
                        </tfoot>
                    </table>

                    <p><strong>Notes:</strong> ${invoice.notes || 'No notes'}</p>
                </div>
                <div style="margin-top: 1rem; text-align: right;">
                    <button class="btn btn-primary" onclick="invoiceManager.printInvoice(${invoice.id})">
                        Print PDF
                    </button>
                    <button class="btn" onclick="invoiceManager.closeModal()">Close</button>
                </div>
            `;

            modal.classList.add('active');
        } catch (error) {
            console.error('Failed to load invoice:', error);
            utils.showAlert('Failed to load invoice details', 'error');
        }
    },

    // Edit invoice
    editInvoice: (id) => {
        window.location.href = `edit-invoice.jsp?id=${id}`;
    },

    // Delete invoice
    deleteInvoice: async (id) => {
        if (!confirm('Are you sure you want to delete this invoice?')) {
            return;
        }

        try {
            await ajax.delete(API.invoices.delete(id));
            utils.showAlert('Invoice deleted successfully!', 'success');

            // Reload invoices
            invoiceManager.loadInvoices();
        } catch (error) {
            console.error('Failed to delete invoice:', error);
            utils.showAlert('Failed to delete invoice', 'error');
        }
    },

    // Search invoices
    searchInvoices: async (searchTerm) => {
        try {
            const results = await ajax.get(`${API.invoices.search}?q=${searchTerm}`);
            invoiceManager.renderInvoices(results);
        } catch (error) {
            console.error('Search failed:', error);
        }
    },

    // Filter invoices
    filterInvoices: () => {
        const filtered = state.invoices.filter(invoice => {
            // Apply search filter
            if (state.filters.search) {
                const searchLower = state.filters.search.toLowerCase();
                const matchesSearch =
                    invoice.invoiceNumber.toLowerCase().includes(searchLower) ||
                    invoice.customerName.toLowerCase().includes(searchLower);

                if (!matchesSearch) return false;
            }

            // Apply status filter
            if (state.filters.status !== 'all') {
                if (invoice.status.toLowerCase() !== state.filters.status.toLowerCase()) {
                    return false;
                }
            }

            // Apply date filters
            if (state.filters.dateFrom) {
                if (new Date(invoice.date) < new Date(state.filters.dateFrom)) {
                    return false;
                }
            }

            if (state.filters.dateTo) {
                if (new Date(invoice.date) > new Date(state.filters.dateTo)) {
                    return false;
                }
            }

            return true;
        });

        invoiceManager.renderInvoices(filtered);
    },

    // Print invoice as PDF
    printInvoice: (id) => {
        window.open(`/api/invoices/${id}/pdf`, '_blank');
    },

    // Close modal
    closeModal: () => {
        const modal = document.getElementById('invoiceModal');
        modal.classList.remove('active');
    }
};

// Product Management Functions
const productManager = {
    // Load products for dropdown
    loadProducts: async (selectElement) => {
        try {
            const products = await ajax.get(API.products.getAll);

            selectElement.innerHTML = '<option value="">Select a product</option>' +
                products.map(product =>
                    `<option value="${product.id}" data-price="${product.price}">
                        ${product.name} - ${utils.formatCurrency(product.price)}
                    </option>`
                ).join('');
        } catch (error) {
            console.error('Failed to load products:', error);
        }
    },

    // Add item row to invoice
    addItemRow: () => {
        const container = document.getElementById('invoiceItems');
        const rowCount = container.children.length + 1;

        const row = document.createElement('div');
        row.className = 'item-row';
        row.innerHTML = `
            <select class="form-control product-select" onchange="productManager.onProductSelect(this)">
                <option value="">Select product</option>
            </select>
            <input type="number" class="form-control item-quantity" placeholder="Qty" min="1" value="1" onchange="invoiceManager.calculateItemTotal(this)">
            <input type="number" class="form-control item-price" placeholder="Price" step="0.01" min="0">
            <input type="number" class="form-control item-total" placeholder="Total" readonly>
            <button type="button" class="btn-danger" onclick="this.parentElement.remove()">×</button>
        `;

        container.appendChild(row);
        productManager.loadProducts(row.querySelector('.product-select'));
    },

    // Handle product selection
    onProductSelect: (select) => {
        const selectedOption = select.options[select.selectedIndex];
        const price = selectedOption.dataset.price;

        if (price) {
            const row = select.closest('.item-row');
            const priceInput = row.querySelector('.item-price');
            priceInput.value = price;

            // Calculate total
            const quantity = row.querySelector('.item-quantity').value;
            const totalInput = row.querySelector('.item-total');
            totalInput.value = (quantity * price).toFixed(2);
        }
    }
};

// Dashboard Functions
const dashboardManager = {
    loadStats: async () => {
        try {
            const stats = await ajax.get('/api/dashboard/stats');

            // Update dashboard stats
            document.getElementById('totalInvoices').textContent = stats.totalInvoices;
            document.getElementById('totalRevenue').textContent = utils.formatCurrency(stats.totalRevenue);
            document.getElementById('pendingInvoices').textContent = stats.pendingInvoices;
            document.getElementById('overdueInvoices').textContent = stats.overdueInvoices;
        } catch (error) {
            console.error('Failed to load dashboard stats:', error);
        }
    },

    loadRecentInvoices: async () => {
        const container = document.getElementById('recentInvoices');
        if (!container) return;

        try {
            const invoices = await ajax.get('/api/invoices/recent');

            container.innerHTML = invoices.map(invoice => `
                <div class="recent-invoice-item">
                    <div>
                        <strong>#${invoice.invoiceNumber}</strong>
                        <p>${invoice.customerName}</p>
                    </div>
                    <div>
                        <span class="status-badge status-${invoice.status.toLowerCase()}">
                            ${invoice.status}
                        </span>
                        <strong>${utils.formatCurrency(invoice.total)}</strong>
                    </div>
                </div>
            `).join('');
        } catch (error) {
            console.error('Failed to load recent invoices:', error);
        }
    }
};

// Event Listeners
document.addEventListener('DOMContentLoaded', () => {
    // Set current year in footer
    const yearElement = document.getElementById('currentYear');
    if (yearElement) {
        yearElement.textContent = new Date().getFullYear();
    }

    // Initialize based on current page
    const currentPage = window.location.pathname;

    if (currentPage.includes('dashboard')) {
        dashboardManager.loadStats();
        dashboardManager.loadRecentInvoices();
    }

    if (currentPage.includes('view-invoices')) {
        invoiceManager.loadInvoices();

        // Search input handler
        const searchInput = document.getElementById('searchInvoices');
        if (searchInput) {
            let searchTimeout;
            searchInput.addEventListener('input', (e) => {
                clearTimeout(searchTimeout);
                searchTimeout = setTimeout(() => {
                    state.filters.search = e.target.value;
                    invoiceManager.filterInvoices();
                }, 300);
            });
        }

        // Filter handlers
        const statusFilter = document.getElementById('statusFilter');
        if (statusFilter) {
            statusFilter.addEventListener('change', (e) => {
                state.filters.status = e.target.value;
                invoiceManager.filterInvoices();
            });
        }
    }

    if (currentPage.includes('create-invoice')) {
        // Initialize date pickers
        const today = new Date().toISOString().split('T')[0];
        const dateInput = document.getElementById('date');
        if (dateInput) {
            dateInput.value = today;
        }

        // Add first item row
        productManager.addItemRow();
    }
});

// Export functions for global use
window.invoiceManager = invoiceManager;
window.productManager = productManager;
window.dashboardManager = dashboardManager;
window.utils = utils;
// API endpoints (AJAX calls)
const API = {
    // Invoice endpoints
    invoices: {
        getAll: '/InvoiceSystem/api/invoices',
        getById: (id) => `/InvoiceSystem/api/invoices/${id}`,
        create: '/InvoiceSystem/api/invoices',
        update: (id) => `/InvoiceSystem/api/invoices/${id}`,
        delete: (id) => `/InvoiceSystem/api/invoices/${id}`,
        search: '/InvoiceSystem/api/invoices/search',
        recent: '/InvoiceSystem/api/invoices/recent',
        stats: '/InvoiceSystem/api/invoices/stats'
    },

    // Product endpoints
    products: {
        getAll: '/InvoiceSystem/api/products',
        getById: (id) => `/InvoiceSystem/api/products/${id}`
    }
};