<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - Invoice Management System</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Index Page Specific Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow-x: hidden;
        }

        /* Animated Background */
        .animated-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
        }

        .animated-bg .shape {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 20s infinite;
        }

        .shape-1 {
            width: 500px;
            height: 500px;
            top: -250px;
            right: -100px;
            animation-delay: 0s;
        }

        .shape-2 {
            width: 400px;
            height: 400px;
            bottom: -200px;
            left: -100px;
            animation-delay: 5s;
        }

        .shape-3 {
            width: 300px;
            height: 300px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            animation-delay: 10s;
        }

        @keyframes float {
            0%, 100% {
                transform: translate(0, 0) rotate(0deg);
            }
            25% {
                transform: translate(100px, 100px) rotate(90deg);
            }
            50% {
                transform: translate(200px, 0) rotate(180deg);
            }
            75% {
                transform: translate(100px, -100px) rotate(270deg);
            }
        }

        /* Main Container */
        .welcome-container {
            position: relative;
            z-index: 2;
            width: 100%;
            max-width: 1200px;
            padding: 2rem;
            margin: 2rem;
        }

        /* Glass Morphism Card */
        .glass-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 30px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            overflow: hidden;
            animation: slideUp 1s ease;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Header Section */
        .welcome-header {
            background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%);
            padding: 3rem 2rem;
            text-align: center;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .welcome-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.2) 0%, transparent 70%);
            animation: rotate 20s linear infinite;
        }

        @keyframes rotate {
            from {
                transform: rotate(0deg);
            }
            to {
                transform: rotate(360deg);
            }
        }

        .welcome-header h1 {
            font-size: 3.5rem;
            font-weight: 800;
            margin-bottom: 1rem;
            position: relative;
            z-index: 1;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }

        .welcome-header p {
            font-size: 1.2rem;
            opacity: 0.95;
            position: relative;
            z-index: 1;
            max-width: 600px;
            margin: 0 auto;
        }

        /* Logo Section */
        .logo-section {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin: -3rem auto 2rem;
            position: relative;
            z-index: 3;
        }

        .logo-circle {
            width: 100px;
            height: 100px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            transition: all 0.3s ease;
            animation: bounceIn 0.5s ease;
        }

        .logo-circle:nth-child(2) {
            animation-delay: 0.2s;
        }

        .logo-circle:nth-child(3) {
            animation-delay: 0.4s;
        }

        @keyframes bounceIn {
            0% {
                opacity: 0;
                transform: scale(0.3);
            }
            50% {
                opacity: 1;
                transform: scale(1.05);
            }
            70% {
                transform: scale(0.9);
            }
            100% {
                transform: scale(1);
            }
        }

        .logo-circle:hover {
            transform: translateY(-10px) scale(1.1);
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
        }

        .logo-circle img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
        }

        .logo-placeholder {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            font-weight: bold;
        }

        /* Content Section */
        .welcome-content {
            padding: 3rem 2rem;
        }

        .welcome-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
        }

        .info-card {
            text-align: center;
            padding: 2rem;
            border-radius: 20px;
            background: #f8fafc;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .info-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, #4f46e5, #7c3aed);
            transform: translateX(-100%);
            transition: transform 0.3s ease;
        }

        .info-card:hover::before {
            transform: translateX(0);
        }

        .info-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }

        .info-icon {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            color: white;
            font-size: 1.8rem;
            box-shadow: 0 10px 20px rgba(79, 70, 229, 0.3);
        }

        .info-card h3 {
            font-size: 1.5rem;
            color: #1f2937;
            margin-bottom: 1rem;
        }

        .info-card p {
            color: #6b7280;
            line-height: 1.6;
        }

        /* Features List */
        .features-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1rem;
            margin: 2rem 0;
        }

        .feature-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            background: #f8fafc;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .feature-item:hover {
            background: #4f46e5;
            color: white;
            transform: translateX(5px);
        }

        .feature-item:hover .feature-text {
            color: white;
        }

        .feature-check {
            width: 24px;
            height: 24px;
            background: #10b981;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.8rem;
        }

        .feature-text {
            color: #4b5563;
            font-weight: 500;
        }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 3rem;
            flex-wrap: wrap;
        }

        .btn-index {
            padding: 1rem 2.5rem;
            border: none;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .btn-primary-index {
            background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%);
            color: white;
        }

        .btn-primary-index:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 15px rgba(79, 70, 229, 0.4);
        }

        .btn-secondary-index {
            background: white;
            color: #4f46e5;
            border: 2px solid #4f46e5;
        }

        .btn-secondary-index:hover {
            background: #4f46e5;
            color: white;
            transform: translateY(-2px);
        }

        .btn-outline-index {
            background: transparent;
            color: white;
            border: 2px solid white;
        }

        .btn-outline-index:hover {
            background: white;
            color: #4f46e5;
        }

        /* Stats Bar */
        .stats-bar {
            display: flex;
            justify-content: space-around;
            margin: 3rem 0;
            padding: 2rem 0;
            border-top: 2px solid #e5e7eb;
            border-bottom: 2px solid #e5e7eb;
        }

        .stat-item-index {
            text-align: center;
        }

        .stat-number-index {
            font-size: 2rem;
            font-weight: 800;
            color: #4f46e5;
            margin-bottom: 0.5rem;
        }

        .stat-label-index {
            color: #6b7280;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Footer */
        .welcome-footer {
            background: linear-gradient(135deg, #1f2937 0%, #111827 100%);
            color: white;
            padding: 2rem;
            text-align: center;
        }

        .footer-links {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-bottom: 1rem;
            flex-wrap: wrap;
        }

        .footer-links a {
            color: #9ca3af;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: white;
        }

        .copyright {
            color: #9ca3af;
            font-size: 0.9rem;
        }

        /* Loading Animation */
        .loading-bar {
            width: 0%;
            height: 3px;
            background: linear-gradient(90deg, #4f46e5, #7c3aed);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 9999;
            transition: width 0.3s ease;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .welcome-header h1 {
                font-size: 2.5rem;
            }

            .logo-section {
                flex-wrap: wrap;
            }

            .stats-bar {
                flex-direction: column;
                gap: 2rem;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn-index {
                width: 100%;
                text-align: center;
                justify-content: center;
            }

            .features-list {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .welcome-container {
                padding: 1rem;
                margin: 1rem;
            }

            .welcome-header h1 {
                font-size: 2rem;
            }

            .welcome-header p {
                font-size: 1rem;
            }

            .info-card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Loading Bar -->
    <div class="loading-bar" id="loadingBar"></div>

    <!-- Animated Background -->
    <div class="animated-bg">
        <div class="shape shape-1"></div>
        <div class="shape shape-2"></div>
        <div class="shape shape-3"></div>
    </div>

    <!-- Welcome Container -->
    <div class="welcome-container">
        <div class="glass-card">
            <!-- Header -->
            <div class="welcome-header">
                <h1>Welcome to InvoiceMS</h1>
                <p>Your Complete Invoice Management Solution</p>
            </div>

            <!-- Logo Section -->
            <div class="logo-section">
                <div class="logo-circle">
                    <img src="images/1.jpg" alt="Logo 1" onerror="this.src='https://via.placeholder.com/80x80?text=IMS'">
                </div>
                <div class="logo-circle">
                    <div class="logo-placeholder">📄</div>
                </div>
                <div class="logo-circle">
                    <img src="images/2.jpg" alt="Logo 2" onerror="this.src='https://via.placeholder.com/80x80?text=BILL'">
                </div>
            </div>

            <!-- Content -->
            <div class="welcome-content">
                <!-- Welcome Grid -->
                <div class="welcome-grid">
                    <div class="info-card">
                        <div class="info-icon">📊</div>
                        <h3>Smart Dashboard</h3>
                        <p>Get real-time insights into your business finances with our intuitive dashboard.</p>
                    </div>

                    <div class="info-card">
                        <div class="info-icon">⚡</div>
                        <h3>Fast & Efficient</h3>
                        <p>Create and manage invoices quickly with our AJAX-powered interface.</p>
                    </div>

                    <div class="info-card">
                        <div class="info-icon">🔒</div>
                        <h3>Secure & Reliable</h3>
                        <p>Your data is protected with enterprise-grade security and Hibernate ORM.</p>
                    </div>
                </div>

                <!-- Features List -->
                <h3 style="text-align: center; margin-bottom: 1.5rem; color: #1f2937;">Everything You Need</h3>
                <div class="features-list">
                    <div class="feature-item">
                        <span class="feature-check">✓</span>
                        <span class="feature-text">Create Professional Invoices</span>
                    </div>
                    <div class="feature-item">
                        <span class="feature-check">✓</span>
                        <span class="feature-text">Manage Products & Inventory</span>
                    </div>
                    <div class="feature-item">
                        <span class="feature-check">✓</span>
                        <span class="feature-text">Track Payments & Status</span>
                    </div>
                    <div class="feature-item">
                        <span class="feature-check">✓</span>
                        <span class="feature-text">Generate PDF Reports</span>
                    </div>
                    <div class="feature-item">
                        <span class="feature-check">✓</span>
                        <span class="feature-text">Customer Management</span>
                    </div>
                    <div class="feature-item">
                        <span class="feature-check">✓</span>
                        <span class="feature-text">Real-time Updates with AJAX</span>
                    </div>
                </div>

                <!-- Stats Bar -->
                <div class="stats-bar">
                    <div class="stat-item-index">
                        <div class="stat-number-index">10K+</div>
                        <div class="stat-label-index">Invoices</div>
                    </div>
                    <div class="stat-item-index">
                        <div class="stat-number-index">5K+</div>
                        <div class="stat-label-index">Users</div>
                    </div>
                    <div class="stat-item-index">
                        <div class="stat-number-index">1K+</div>
                        <div class="stat-label-index">Companies</div>
                    </div>
                    <div class="stat-item-index">
                        <div class="stat-number-index">50+</div>
                        <div class="stat-label-index">Countries</div>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="action-buttons">
                    <a href="home.jsp" class="btn-index btn-primary-index">
                        <span>🏠</span>
                        Go to Home
                    </a>
                    <a href="dashboard.jsp" class="btn-index btn-secondary-index">
                        <span>📊</span>
                        Dashboard
                    </a>
                    <a href="create-invoice.jsp" class="btn-index btn-primary-index">
                        <span>➕</span>
                        Create Invoice
                    </a>
                    <a href="view-invoices.jsp" class="btn-index btn-secondary-index">
                        <span>📋</span>
                        View Invoices
                    </a>
                </div>
            </div>

            <!-- Footer -->
            <div class="welcome-footer">
                <div class="footer-links">
                    <a href="home.jsp">Home</a>
                    <a href="dashboard.jsp">Dashboard</a>
                    <a href="view-invoices.jsp">Invoices</a>
                    <a href="product.jsp">Products</a>
                </div>
                <div class="copyright">
                    &copy; 2024 Invoice Management System. All rights reserved. | Version 1.0.0
                </div>
            </div>
        </div>
    </div>

    <script>
        // Loading bar animation
        window.addEventListener('load', function() {
            const loadingBar = document.getElementById('loadingBar');
            loadingBar.style.width = '100%';

            setTimeout(function() {
                loadingBar.style.opacity = '0';
            }, 500);
        });

        // Smooth page transitions
        document.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', function(e) {
                const loadingBar = document.getElementById('loadingBar');
                loadingBar.style.width = '0%';
                loadingBar.style.opacity = '1';

                setTimeout(function() {
                    loadingBar.style.width = '30%';
                }, 100);
            });
        });

        // Animated counter for stats
        function animateCounter(element, start, end, duration) {
            let startTimestamp = null;
            const step = (timestamp) => {
                if (!startTimestamp) startTimestamp = timestamp;
                const progress = Math.min((timestamp - startTimestamp) / duration, 1);
                element.textContent = Math.floor(progress * (end - start) + start) +
                    (element.textContent.includes('K') ? 'K+' : '');
                if (progress < 1) {
                    window.requestAnimationFrame(step);
                }
            };
            window.requestAnimationFrame(step);
        }

        // Intersection Observer for stats animation
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const stats = document.querySelectorAll('.stat-number-index');
                    stats.forEach(stat => {
                        const value = stat.textContent;
                        if (value.includes('K')) {
                            const num = parseInt(value) * 1000;
                            animateCounter(stat, 0, num, 2000);
                        }
                    });
                    observer.unobserve(entry.target);
                }
            });
        });

        observer.observe(document.querySelector('.stats-bar'));

        // Mouse move parallax effect for shapes
        document.addEventListener('mousemove', (e) => {
            const shapes = document.querySelectorAll('.shape');
            const mouseX = e.clientX / window.innerWidth;
            const mouseY = e.clientY / window.innerHeight;

            shapes.forEach((shape, index) => {
                const speed = (index + 1) * 20;
                const x = (mouseX - 0.5) * speed;
                const y = (mouseY - 0.5) * speed;
                shape.style.transform = `translate(${x}px, ${y}px)`;
            });
        });
    </script>
</body>
</html>