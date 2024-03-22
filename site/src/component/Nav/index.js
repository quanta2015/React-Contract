import React, { useState } from 'react';
import { Outlet } from 'react-router-dom'
import { useNavigate } from 'react-router-dom'
import { inject,observer,MobXProviderContext } from 'mobx-react'
import {Menu} from 'antd'
import { AppstoreOutlined, MailOutlined, SettingOutlined } from '@ant-design/icons';

import s from './index.module.less';

const getItem =(label, key, icon, children, type)=> {
  return {
    key,
    icon,
    children,
    label,
    type,
  };
}

const items = [
  getItem('基本信息管理', '1', <MailOutlined />, [
    getItem('合同管理', 'part'), 
    getItem('用戶管理', 'user'), 
  ]),
 // getItem('部品管理', '2', <AppstoreOutlined />, [
 //    getItem('在庫管理', 'stock'),
 //    getItem('出入庫管理', 'stockio'),
 //  ]),
]

const Nav = () => {
  const navigate = useNavigate();
  const { store } = React.useContext(MobXProviderContext)
  const rootSubmenuKeys = ['1', '2'];
  const [openKeys, setOpenKeys] = useState(['1','2']);
  

  // const onOpenChange = (keys) => {
  //   const latestOpenKey = keys.find((key) => openKeys.indexOf(key) === -1);
  //   if (latestOpenKey && rootSubmenuKeys.indexOf(latestOpenKey) === -1) {
  //     setOpenKeys(keys);
  //   } else {
  //     setOpenKeys(latestOpenKey ? [latestOpenKey] : []);
  //   }
  // };


  const onClick = ({ item, key, keyPath, domEvent }) => {
    navigate(key)
  };


  return (
    <div className={s.nav}>
      <Menu
        // onClick={onClick}
      // theme={'dark'}
        openKeys={openKeys}
        mode="inline"
        items={items}
        style={{height:'100%'}}
        defaultSelectedKeys={['/part']} 
        onClick={onClick}
        // onOpenChange={onOpenChange}
      />
    </div>
  )
 
}

export default inject('store')(observer(Nav))
