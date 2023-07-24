import React from 'react';

const App = () => {
  return (
    <div className="container">
      <a href="/" className="main-button">Stris Study</a>
      <div className="section">
        <a href="/beginner" className="section-button">Beginner</a>
        <a href="/techniques" className="section-button">Techniques</a>
        <a href="/practice" className="section-button">Practice (Work in Progress)</a>
      </div>
      <footer className="footer">
        <a href="/contact">Contact Us</a>
      </footer>
    </div>
  );
};

export default App;
