package org.invoiceSystem.dto;

public class InvoiceItem {



    private Long id;
    private ProductDto product;
    private String description;
    private Integer quantity;
    private Double unitPrice;
    private Double total;

    // Default constructor
    public InvoiceItem() {
    }

    // Constructor with fields
    public InvoiceItem(Long id, ProductDto product, String description,
                          Integer quantity, Double unitPrice, Double total) {
        this.id = id;
        this.product = product;
        this.description = description;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.total = total;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public ProductDto getProduct() {
        return product;
    }

    public void setProduct(ProductDto product) {
        this.product = product;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }
}