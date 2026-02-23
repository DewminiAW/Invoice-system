package org.invoiceSystem.dto;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.invoiceSystem.entity.Invoice;
import org.invoiceSystem.util.HibernateUtil;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.time.LocalDate;
import java.util.List;

public class InvoiceDto {

    // Create or Update
    public void saveOrUpdate(Invoice invoice) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.saveOrUpdate(invoice);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    // Read by ID
    public Invoice getById(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Invoice.class, id);
        }
    }

    // Read all
    public List<Invoice> getAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            CriteriaBuilder cb = session.getCriteriaBuilder();
            CriteriaQuery<Invoice> cr = cb.createQuery(Invoice.class);
            Root<Invoice> root = cr.from(Invoice.class);
            cr.select(root);
            Query<Invoice> query = session.createQuery(cr);
            return query.getResultList();
        }
    }

    // Delete
    public void delete(Long id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Invoice invoice = session.get(Invoice.class, id);
            if (invoice != null) {
                session.delete(invoice);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    // Get by status
    public List<Invoice> getByStatus(Invoice.InvoiceStatus status) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Invoice> query = session.createQuery(
                    "FROM Invoice WHERE status = :status", Invoice.class);
            query.setParameter("status", status);
            return query.getResultList();
        }
    }

    // Get by customer
    public List<Invoice> getByCustomerId(Long customerId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Invoice> query = session.createQuery(
                    "FROM Invoice WHERE customer.id = :customerId", Invoice.class);
            query.setParameter("customerId", customerId);
            return query.getResultList();
        }
    }

    // Get by date range
    public List<Invoice> getByDateRange(LocalDate startDate, LocalDate endDate) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Invoice> query = session.createQuery(
                    "FROM Invoice WHERE invoiceDate BETWEEN :start AND :end", Invoice.class);
            query.setParameter("start", startDate);
            query.setParameter("end", endDate);
            return query.getResultList();
        }
    }

    // Search by invoice number or customer name
    public List<Invoice> search(String keyword) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Invoice> query = session.createQuery(
                    "FROM Invoice WHERE invoiceNumber LIKE :keyword OR customer.name LIKE :keyword",
                    Invoice.class);
            query.setParameter("keyword", "%" + keyword + "%");
            return query.getResultList();
        }
    }

    // Get dashboard statistics
    public DashboardStats getDashboardStats() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            DashboardStats stats = new DashboardStats();

            // Total invoices
            Query<Long> totalQuery = session.createQuery(
                    "SELECT COUNT(*) FROM Invoice", Long.class);
            stats.totalInvoices = totalQuery.uniqueResult();

            // Total revenue
            Query<Double> revenueQuery = session.createQuery(
                    "SELECT SUM(total) FROM Invoice WHERE status = 'PAID'", Double.class);
            stats.totalRevenue = revenueQuery.uniqueResult() != null ? revenueQuery.uniqueResult() : 0.0;

            // Pending invoices
            Query<Long> pendingQuery = session.createQuery(
                    "SELECT COUNT(*) FROM Invoice WHERE status = 'PENDING'", Long.class);
            stats.pendingInvoices = pendingQuery.uniqueResult();

            // Overdue invoices
            Query<Long> overdueQuery = session.createQuery(
                    "SELECT COUNT(*) FROM Invoice WHERE status = 'OVERDUE'", Long.class);
            stats.overdueInvoices = overdueQuery.uniqueResult();

            return stats;
        }
    }

    // Inner class for dashboard stats
    public static class DashboardStats {
        public Long totalInvoices;
        public Double totalRevenue;
        public Long pendingInvoices;
        public Long overdueInvoices;
    }
}
