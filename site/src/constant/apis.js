var mode = process.env.NODE_ENV
let API_SERVER = 'http://localhost'



if (mode === 'development') {
  // API_SERVER = 'http://47.114.124.209:9000'
  // API_SERVER = 'http://localhost:8080'
  API_SERVER = 'http://47.99.143.102:9001'
}

if (mode === 'production') {
  // API_SERVER = 'http://47.114.124.209:9000'
  API_SERVER = 'http://47.99.143.102:9001'
}

export { API_SERVER }
