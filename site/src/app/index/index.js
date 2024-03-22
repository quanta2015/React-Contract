import React,{useEffect} from 'react'
import { inject, observer, MobXProviderContext } from 'mobx-react'
import { Form, Input, Button, message } from 'antd'
import { UserOutlined, LockOutlined } from '@ant-design/icons';
import * as urls from '@/constant/urls'
import {loadLocalUser} from '@/util/token'
import { useNavigate } from 'react-router-dom'

import s from './index.module.less'


const Nav = () => {
  const { store } = React.useContext(MobXProviderContext);
  const navigate = useNavigate();


  return (
    <div className={s.nav}>
      <div className={s.wrap}>

       
      </div>

      
    </div>
  )

}

export default observer(Nav)