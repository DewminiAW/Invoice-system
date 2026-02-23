<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Invoice Management System</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Home Page Specific Styles */
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --success-gradient: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%);
        }

        /* Hero Section */
        .hero-section {
            background: var(--primary-gradient);
            color: white;
            padding: 4rem 2rem;
            margin-top: -1rem;
            position: relative;
            overflow: hidden;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.1" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,154.7C960,171,1056,181,1152,165.3C1248,149,1344,107,1392,85.3L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>');
            background-repeat: no-repeat;
            background-position: bottom;
            background-size: cover;
            opacity: 0.1;
        }

        .hero-content {
            max-width: 1200px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            align-items: center;
        }

        .hero-text h1 {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            line-height: 1.2;
            animation: fadeInUp 1s ease;
        }

        .hero-text p {
            font-size: 1.25rem;
            margin-bottom: 2rem;
            opacity: 0.9;
            animation: fadeInUp 1s ease 0.2s both;
        }

        .hero-buttons {
            display: flex;
            gap: 1rem;
            animation: fadeInUp 1s ease 0.4s both;
        }

        .hero-buttons .btn {
            padding: 1rem 2rem;
            font-size: 1.1rem;
            border-radius: 50px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .hero-buttons .btn-primary {
            background: white;
            color: var(--primary-color);
        }

        .hero-buttons .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.3);
        }

        .hero-buttons .btn-secondary {
            background: transparent;
            color: white;
            border: 2px solid white;
        }

        .hero-buttons .btn-secondary:hover {
            background: white;
            color: var(--primary-color);
        }

        .hero-image {
            animation: float 3s ease-in-out infinite;
        }

        .hero-image img {
            width: 100%;
            max-width: 500px;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
        }

        /* Features Section */
        .features-section {
            padding: 5rem 2rem;
            background: #f8fafc;
        }

        .section-title {
            text-align: center;
            margin-bottom: 3rem;
        }

        .section-title h2 {
            font-size: 2.5rem;
            color: var(--dark-color);
            margin-bottom: 1rem;
        }

        .section-title p {
            font-size: 1.1rem;
            color: #64748b;
            max-width: 600px;
            margin: 0 auto;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .feature-card {
            background: white;
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: var(--primary-gradient);
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }

        .feature-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 1.5rem;
            background: var(--primary-gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: white;
        }

        .feature-card h3 {
            font-size: 1.5rem;
            color: var(--dark-color);
            margin-bottom: 1rem;
        }

        .feature-card p {
            color: #64748b;
            line-height: 1.6;
        }

        /* Stats Section */
        .stats-section {
            background: var(--primary-gradient);
            padding: 4rem 2rem;
            color: white;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
            text-align: center;
        }

        .stat-item {
            padding: 1rem;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 0.5rem;
            animation: countUp 2s ease;
        }

        .stat-label {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        /* How It Works Section */
        .how-it-works {
            padding: 5rem 2rem;
            background: white;
        }

        .steps-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 3rem auto 0;
        }

        .step {
            text-align: center;
            position: relative;
        }

        .step:not(:last-child)::after {
            content: '→';
            position: absolute;
            right: -1rem;
            top: 2rem;
            font-size: 2rem;
            color: var(--primary-color);
            font-weight: bold;
        }

        .step-number {
            width: 50px;
            height: 50px;
            background: var(--primary-gradient);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            font-weight: bold;
            margin: 0 auto 1.5rem;
        }

        .step h4 {
            font-size: 1.3rem;
            color: var(--dark-color);
            margin-bottom: 1rem;
        }

        .step p {
            color: #64748b;
        }

        /* Testimonials Section */
        .testimonials-section {
            padding: 5rem 2rem;
            background: #f8fafc;
        }

        .testimonials-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 3rem auto 0;
        }

        .testimonial-card {
            background: white;
            padding: 2rem;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .testimonial-content {
            font-style: italic;
            color: #64748b;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .testimonial-author {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .author-avatar {
            width: 50px;
            height: 50px;
            background: var(--primary-gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 1.2rem;
        }

        .author-info h5 {
            font-size: 1.1rem;
            color: var(--dark-color);
            margin-bottom: 0.25rem;
        }

        .author-info p {
            color: #64748b;
            font-size: 0.9rem;
        }

        /* CTA Section */
        .cta-section {
            background: var(--primary-gradient);
            padding: 5rem 2rem;
            text-align: center;
            color: white;
        }

        .cta-content {
            max-width: 600px;
            margin: 0 auto;
        }

        .cta-content h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .cta-content p {
            font-size: 1.1rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        .cta-content .btn {
            background: white;
            color: var(--primary-color);
            padding: 1rem 2.5rem;
            font-size: 1.2rem;
            border-radius: 50px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .cta-content .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.3);
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-20px);
            }
        }

        @keyframes countUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 968px) {
            .hero-content {
                grid-template-columns: 1fr;
                text-align: center;
            }

            .hero-buttons {
                justify-content: center;
            }

            .step:not(:last-child)::after {
                display: none;
            }

            .hero-text h1 {
                font-size: 2.5rem;
            }
        }

        @media (max-width: 768px) {
            .hero-section {
                padding: 3rem 1rem;
            }

            .hero-text h1 {
                font-size: 2rem;
            }

            .section-title h2 {
                font-size: 2rem;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .testimonials-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="main-header">
        <nav class="nav-menu">
            <div class="logo-container">
                <img src="images/1.jpg" alt="Logo" onerror="this.src='https://via.placeholder.com/50x50?text=IMS'">
                <h2>InvoiceMS</h2>
            </div>
            <ul class="nav-links">
                <li><a href="home.jsp" class="active">Home</a></li>
                <li><a href="dashboard.jsp">Dashboard</a></li>
                <li><a href="view-invoices.jsp">Invoices</a></li>
                <li><a href="create-invoice.jsp">Create Invoice</a></li>
                <li><a href="product.jsp">Products</a></li>
            </ul>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-content">
            <div class="hero-text">
                <h1>Smart Invoice Management System</h1>
                <p>Streamline your billing process with our powerful invoice management solution. Create, manage, and track invoices with ease.</p>
                <div class="hero-buttons">
                    <a href="create-invoice.jsp" class="btn btn-primary">Get Started</a>
                    <a href="#features" class="btn btn-secondary">Learn More</a>
                </div>
            </div>
            <div class="hero-image">
                <img src="images/2.jpg" alt="Invoice Management" onerror="this.src='https://via.placeholder.com/500x400?text=Invoice+System'">
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="features-section">
        <div class="section-title">
            <h2>Why Choose Our System?</h2>
            <p>Powerful features designed to make invoice management simple and efficient</p>
        </div>

        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">📄</div>
                <h3>Easy Invoice Creation</h3>
                <p>Create professional invoices in minutes with our intuitive interface. Add items, calculate taxes, and customize as needed.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">🚀</div>
                <h3>Real-time Updates</h3>
                <p>AJAX-powered interface ensures smooth, page-load free experience. Get instant feedback on all your actions.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">📊</div>
                <h3>Advanced Analytics</h3>
                <p>Track your business performance with comprehensive dashboards and reports. Monitor paid, pending, and overdue invoices.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">🔒</div>
                <h3>Secure & Reliable</h3>
                <p>Your data is safe with us. Built with Hibernate ORM for robust database management and data integrity.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">📱</div>
                <h3>Mobile Responsive</h3>
                <p>Access your invoices from any device. Our system is fully responsive and works perfectly on mobile, tablet, and desktop.</p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">📎</div>
                <h3>PDF Export</h3>
                <p>Generate professional PDF invoices for your clients. Download, print, or email invoices directly from the system.</p>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section">
        <div class="stats-grid">
            <div class="stat-item">
                <div class="stat-number" id="statInvoices">10,000+</div>
                <div class="stat-label">Invoices Generated</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="statUsers">5,000+</div>
                <div class="stat-label">Happy Users</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="statCompanies">1,000+</div>
                <div class="stat-label">Companies</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="statCountries">50+</div>
                <div class="stat-label">Countries</div>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section class="how-it-works">
        <div class="section-title">
            <h2>How It Works</h2>
            <p>Get started in three simple steps</p>
        </div>

        <div class="steps-container">
            <div class="step">
                <div class="step-number">1</div>
                <h4>Create Your Account</h4>
                <p>Sign up for free and set up your company profile in minutes.</p>
            </div>

            <div class="step">
                <div class="step-number">2</div>
                <h4>Create Your First Invoice</h4>
                <p>Add customer details, items, and generate a professional invoice.</p>
            </div>

            <div class="step">
                <div class="step-number">3</div>
                <h4>Send & Track</h4>
                <p>Send invoices to customers and track payments in real-time.</p>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="testimonials-section">
        <div class="section-title">
            <h2>What Our Users Say</h2>
            <p>Trusted by thousands of businesses worldwide</p>
        </div>

        <div class="testimonials-grid">
            <div class="testimonial-card">
                <div class="testimonial-content">
                    "This invoice system has transformed how we handle billing. It's intuitive, fast, and saves us hours every week."
                </div>
                <div class="testimonial-author">
                    <div class="author-avatar">JD</div>
                    <div class="author-info">
                        <h5>John Doe</h5>
                        <p>CEO, TechStart Inc.</p>
                    </div>
                </div>
            </div>

            <div class="testimonial-card">
                <div class="testimonial-content">
                    "The AJAX features make it feel like a desktop application. No page reloads, everything works smoothly."
                </div>
                <div class="testimonial-author">
                    <div class="author-avatar">JS</div>
                    <div class="author-info">
                        <h5>Jane Smith</h5>
                        <p>Freelance Designer</p>
                    </div>
                </div>
            </div>

            <div class="testimonial-card">
                <div class="testimonial-content">
                    "Excellent reporting features. I can track all my invoices and payments in one place. Highly recommended!"
                </div>
                <div class="testimonial-author">
                    <div class="author-avatar">MW</div>
                    <div class="author-info">
                        <h5>Mark Wilson</h5>
                        <p>Small Business Owner</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="cta-content">
            <h2>Ready to Get Started?</h2>
            <p>Join thousands of satisfied users and streamline your invoice management today</p>
            <a href="create-invoice.jsp" class="btn">Create Your First Invoice</a>
        </div>
    </section>

    <!-- Footer -->
    <footer style="background: var(--dark-color); color: white; padding: 3rem 2rem 1rem;">
        <div style="max-width: 1200px; margin: 0 auto; display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 2rem;">
            <div>
                <h3 style="color: white; margin-bottom: 1rem;">InvoiceMS</h3>
                <p style="color: #9ca3af;">Professional invoice management system for modern businesses.</p>
            </div>
            <div>
                <h4 style="color: white; margin-bottom: 1rem;">Quick Links</h4>
                <ul style="list-style: none;">
                    <li style="margin-bottom: 0.5rem;"><a href="home.jsp" style="color: #9ca3af; text-decoration: none;">Home</a></li>
                    <li style="margin-bottom: 0.5rem;"><a href="dashboard.jsp" style="color: #9ca3af; text-decoration: none;">Dashboard</a></li>
                    <li style="margin-bottom: 0.5rem;"><a href="view-invoices.jsp" style="color: #9ca3af; text-decoration: none;">Invoices</a></li>
                    <li style="margin-bottom: 0.5rem;"><a href="product.jsp" style="color: #9ca3af; text-decoration: none;">Products</a></li>
                </ul>
            </div>
            <div>
                <h4 style="color: white; margin-bottom: 1rem;">Contact</h4>
                <p style="color: #9ca3af;">Email: info@invoicems.com</p>
                <p style="color: #9ca3af;">Phone: +1 234 567 890</p>
            </div>
        </div>
        <div style="text-align: center; margin-top: 2rem; padding-top: 2rem; border-top: 1px solid #374151; color: #9ca3af;">
            <p>&copy; 2024 Invoice Management System. All rights reserved.</p>
        </div>
    </footer>

    <script src="js/script.js"></script>
    <script>
        // Animate stats numbers on page load
        document.addEventListener('DOMContentLoaded', function() {
            // You can add dynamic stats here if needed
            console.log('Home page loaded');
        });

        // Smooth scroll for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });
    </script>
</body>
</html>