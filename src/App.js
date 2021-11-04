import logo from './logo.svg';
import './App.css';
import { useEffect, useRef, useState } from 'react';

function App() {
  const [helloData, setHelloData] = useState({
    loading: false,
    author: null,
    book: null
  });
  
  console.log("1");
  useEffect(() => {
  setHelloData({ loading: true });
   fetch('http://localhost:8080/')
  .then(response => {
    console.log("respose ", response);
  return response.json();})
  .then(data => setHelloData({ loading: false, book: data.book, author: data.author }))
  .catch(err => {
    console.error("unable to fetch data!", err);
  });
  
  },[setHelloData]);
  return (
    <div className="App">
      <div>Author: {helloData.author}</div>
      <br/>
      <div>Book: {helloData.book}</div>  
    </div>
  );
}

export default App;
