<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<style>
    footer {
        position: fixed;
        bottom: 0;
        width: 100%;
        background-color: #222;
        text-align: center;
        transition: bottom 0.3s;
        padding: 10px 0;
        bottom: -60px; /* Initially hidden */
    }
    .visible-footer {
        bottom: 0;
    }
    .hidden-footer {
        bottom: -60px; /* Adjust based on footer height */
    }
</style>
</head>
<body>
    
    <footer id="footer">
        <p>&copy; 2024 E-Commerce Site. All rights reserved.</p>
    </footer>

<script>
    let lastScrollTop = 0;
    const footer = document.getElementById('footer');

    window.addEventListener('scroll', function() {
        let scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        let windowHeight = window.innerHeight;
        let documentHeight = document.documentElement.scrollHeight;

        if (scrollTop === 0) {
            // User is at the top of the page
            footer.classList.remove('visible-footer');
            footer.classList.add('hidden-footer');
        } else if (scrollTop + windowHeight >= documentHeight) {
            // User is at the bottom of the page
            footer.classList.remove('hidden-footer');
            footer.classList.add('visible-footer');
        } else {
            if (scrollTop > lastScrollTop) {
                // Scroll down
                footer.classList.remove('visible-footer');
                footer.classList.add('hidden-footer');
            } else {
                // Scroll up
                footer.classList.remove('hidden-footer');
                footer.classList.add('visible-footer');
            }
        }
        lastScrollTop = scrollTop;
    });
</script>

</body>
</html>
