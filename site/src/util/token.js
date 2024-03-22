const TOKEN_KEY = 'HOSO_SYS_TOKEN'
const USER_KEY  = 'HOSO_SYS_USER'



export const removeLocalUser = () => {
  window.localStorage.removeItem(USER_KEY)
}

export const loadLocalUser = () => {
  let usr = JSON.parse(window.localStorage.getItem(USER_KEY))
  let token = window.localStorage.getItem(TOKEN_KEY)
  return { usr, token }
}

export const saveLocalUser = (data,token) => {
  window.localStorage.setItem(TOKEN_KEY,token)
  window.localStorage.setItem(USER_KEY, JSON.stringify(data))
}