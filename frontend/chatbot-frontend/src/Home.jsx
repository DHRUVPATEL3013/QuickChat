// import { Link } from "react-router-dom";

// function Home(){
//     return(
//      <>
   
//         <h1>this is the chat application</h1>
//         <nav>

//      <Link to="/signup">Sign up</Link>
//         <Link to="/login">Log in</Link>
//         </nav>
   
//          </>
//     )
// }
// export default Home
import { Link } from "react-router-dom";
import "./Home.css";

function Home() {
  return (
    <div className="home-container">
      {/* Hero Section */}
      <header className="hero-section">
        <nav className="navbar">
          <div className="logo">
            <span className="logo-icon">💬</span>
            <h1>QuickChat</h1>
          </div>
          <div className="nav-links">
            <Link to="/login" className="nav-link">Login</Link>
            <Link to="/signup" className="nav-btn">Sign Up Free</Link>
          </div>
        </nav>
        
        <div className="hero-content">
          <div className="hero-text">
            <h1 className="hero-title">
              Connect. Chat. <span className="highlight">Collaborate.</span>
            </h1>
            <p className="hero-subtitle">
              Experience lightning-fast messaging with end-to-end encryption. 
              Built for modern conversations.
            </p>
            <div className="hero-buttons">
              <Link to="/signup" className="btn-primary">
                Start Messaging Free
                <svg className="btn-icon" viewBox="0 0 24 24" fill="none">
                  <path d="M5 12H19M19 12L12 5M19 12L12 19" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
                </svg>
              </Link>
              <Link to="/login" className="btn-secondary">
                Existing User? Login
              </Link>
            </div>
            <div className="stats">
              <div className="stat">
                <h3>10K+</h3>
                <p>Active Users</p>
              </div>
              <div className="stat">
                <h3>99.9%</h3>
                <p>Uptime</p>
              </div>
              <div className="stat">
                <h3>24/7</h3>
                <p>Support</p>
              </div>
            </div>
          </div>
          <div className="hero-image">
            <div className="chat-preview">
              <div className="chat-header-preview">
                <div className="chat-avatar">JS</div>
                <div>
                  <h4>John Smith</h4>
                  <p>Online • Last seen just now</p>
                </div>
              </div>
              <div className="chat-messages-preview">
                <div className="message-preview sent">Hey, are we meeting tomorrow?</div>
                <div className="message-preview received">Yes! 3 PM at the cafe.</div>
                <div className="message-preview sent">Perfect! See you then ✓✓</div>
              </div>
              <div className="chat-input-preview">
                <input type="text" placeholder="Type a message..." readOnly />
                <button className="send-btn-preview">➤</button>
              </div>
            </div>
          </div>
        </div>
      </header>

      {/* Features Section */}
      <section className="features-section">
        <h2 className="section-title">Why Choose QuickChat?</h2>
        <p className="section-subtitle">Everything you need for seamless communication</p>
        
        <div className="features-grid">
          <div className="feature-card">
            <div className="feature-icon">🔒</div>
            <h3>End-to-End Encryption</h3>
            <p>Your conversations are private. We use military-grade encryption to protect your messages.</p>
          </div>
          
          <div className="feature-card">
            <div className="feature-icon">⚡</div>
            <h3>Lightning Fast</h3>
            <p>Experience real-time messaging with minimal latency. Messages delivered in milliseconds.</p>
          </div>
          
          <div className="feature-card">
            <div className="feature-icon">🌐</div>
            <h3>Cross-Platform</h3>
            <p>Access your chats from any device. Web, mobile, desktop — all synchronized.</p>
          </div>
          
          <div className="feature-card">
            <div className="feature-icon">📁</div>
            <h3>File Sharing</h3>
            <p>Share images, documents, and files up to 100MB directly in your conversations.</p>
          </div>
          
          <div className="feature-card">
            <div className="feature-icon">👥</div>
            <h3>Group Chats</h3>
            <p>Create groups with unlimited members. Perfect for teams, friends, and communities.</p>
          </div>
          
          <div className="feature-card">
            <div className="feature-icon">🎨</div>
            <h3>Custom Themes</h3>
            <p>Personalize your chat experience with dark mode, colors, and custom backgrounds.</p>
          </div>
        </div>
      </section>

      {/* How It Works */}
      <section className="how-it-works">
        <h2 className="section-title">Get Started in 3 Simple Steps</h2>
        
        <div className="steps-container">
          <div className="step">
            <div className="step-number">1</div>
            <h3>Create Account</h3>
            <p>Sign up with your phone number. No email required.</p>
          </div>
          
          <div className="step-line"></div>
          
          <div className="step">
            <div className="step-number">2</div>
            <h3>Add Contacts</h3>
            <p>Find friends by phone number or sync your contacts.</p>
          </div>
          
          <div className="step-line"></div>
          
          <div className="step">
            <div className="step-number">3</div>
            <h3>Start Chatting</h3>
            <p>Send messages, share files, and enjoy seamless conversations.</p>
          </div>
        </div>
      </section>

      {/* Testimonials */}
      <section className="testimonials">
        <h2 className="section-title">Trusted by Thousands</h2>
        
        <div className="testimonial-cards">
          <div className="testimonial-card">
            <div className="testimonial-content">
              <p>"QuickChat transformed our team communication. It's fast, reliable, and super intuitive."</p>
            </div>
            <div className="testimonial-author">
              <img src="https://i.pravatar.cc/150?img=1" alt="Sarah Chen" className="author-avatar" />
              <div>
                <h4>Sarah Chen</h4>
                <p>Product Manager, TechCorp</p>
              </div>
            </div>
          </div>
          
          <div className="testimonial-card">
            <div className="testimonial-content">
              <p>"The encryption features give me peace of mind. Best messaging app I've used in years."</p>
            </div>
            <div className="testimonial-author">
              <img src="https://i.pravatar.cc/150?img=2" alt="Alex Johnson" className="author-avatar" />
              <div>
                <h4>Alex Johnson</h4>
                <p>Security Analyst</p>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* CTA Section */}
      <section className="cta-section">
        <h2>Ready to Experience Better Messaging?</h2>
        <p>Join thousands of users who trust QuickChat for their daily conversations.</p>
        <div className="cta-buttons">
          <Link to="/signup" className="btn-primary btn-large">
            Get Started Free
          </Link>
          <Link to="/login" className="btn-secondary btn-large">
            Login to Account
          </Link>
        </div>
      </section>

      {/* Footer */}
      <footer className="footer">
        <div className="footer-content">
          <div className="footer-logo">
            <span className="logo-icon">💬</span>
            <h2>QuickChat</h2>
            <p>Fast. Secure. Reliable.</p>
          </div>
          
          <div className="footer-links">
            <div className="footer-column">
              <h4>Product</h4>
              <a href="#features">Features</a>
              <a href="#pricing">Pricing</a>
              <a href="#download">Download</a>
            </div>
            
            <div className="footer-column">
              <h4>Company</h4>
              <a href="#about">About</a>
              <a href="#blog">Blog</a>
              <a href="#careers">Careers</a>
            </div>
            
            <div className="footer-column">
              <h4>Support</h4>
              <a href="#help">Help Center</a>
              <a href="#contact">Contact</a>
              <a href="#privacy">Privacy Policy</a>
            </div>
          </div>
        </div>
        
        <div className="footer-bottom">
          <p>© 2024 QuickChat. All rights reserved.</p>
          <p>Built with ❤️ for seamless communication</p>
        </div>
      </footer>
    </div>
  );
}

export default Home;