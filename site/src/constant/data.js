import search from '@/img/menu/search.svg'
import ware from '@/img/menu/ware.svg'
import rcamera from '@/img/menu/rcamera.svg'
import person from '@/img/menu/person.svg'
// import config   from '@/img/menu/config.svg'
import {API_SERVER} from '@/constant/apis'
import {Tag} from 'antd'
import dayjs from 'dayjs';


export const TYPE_LIST = ["设备采购","维修保养","工程安装","技术服务"]

export const json_contact = [
  {
    dataIndex: 'id',
    type: 'string',
    title: '序號',
    width: 60,
    fixed: 'left',
    align: 'center',
    
  },{
    dataIndex: 'status',
    type: 'string',
    title: '狀態',
    width: 80,
    req: true,
    fixed: 'left',
    render: (text, r) => <Tag color={text===0?'#f50':'#87d068'}>{text===0?'未完成':'已完成'}</Tag>
  },{
    dataIndex: 'code',
    type: 'string',
    title: '合同編號',
    key: true,
    width: 150,
    align: 'center',
    fixed: 'left',
    req: false,
  },{
    dataIndex: 'name',
    type: 'string',
    title: '合同名称',
    width: 200,
    align: 'center',
    fixed: 'left',
    req: true,
  },
  {
    dataIndex: 'type',
    type: 'string',
    title: '類型',
    width: 100,
    align: 'center',
    req: false,
  },
  {
    dataIndex: 'custom',
    type: 'string',
    title: '客戶',
    width: 100,
    align: 'center',
    req: true,
  },{
    dataIndex: 'sign_date',
    type: 'string',
    title: '簽訂日期',
    width: 120,
    align: 'center',
    req: true,

    filters: [
      { text: '1月内', value: 'within_1_month' },
      { text: '1-6月', value: '1_to_6_months' },
      { text: '6-12月', value: '6_to_12_months' },
      { text: '1年以上', value: 'over_1_year' },
    ],
    onFilter: (value, record) => {
      const signDate = dayjs(record.sign_date);
      const today = dayjs();
      const diffMonths = today.diff(signDate, 'month');
      switch (value) {
        case 'within_1_month':
          return diffMonths <= 1;
        case '1_to_6_months':
          return diffMonths >= 1 && diffMonths <= 6;
        case '6_to_12_months':
          return diffMonths >= 6 && diffMonths <= 12;
        case 'over_1_year':
          return diffMonths > 12;
        default:
          return true;
      }
    },
  },{
    dataIndex: 'money',
    type: 'string',
    title: '金額(万)',
    width: 120,
    align: 'center',
    req: true,
    filters: [
      { text: '1万以内', value: 'under_10k' },
      { text: '1-10万', value: '10k_to_100k' },
      { text: '10-100万', value: '100k_to_1M' },
      { text: '100万以上', value: 'over_1M' },
    ],
    onFilter: (value, record) => {
      const money = parseFloat(record.money);
      switch (value) {
        case 'under_10k':
          return money < 1;
        case '10k_to_100k':
          return money >= 1 && money < 10;
        case '100k_to_1M':
          return money >= 10 && money < 100;
        case 'over_1M':
          return money >= 100;
        default:
          return true;
      }
    },
  },{
    dataIndex: 'pay_method',
    type: 'string',
    title: '支付方式',
    width: 200,
    req: true,
  },{
    dataIndex: 'war_period',
    type: 'string',
    title: '質保期',
    width: 150,
    req: true,
  },{
    dataIndex: 'exe_person',
    type: 'string',
    title: '執行人員',
    width: 120,
    align: 'center',
    req: true,
  },{
    dataIndex: 'man_person',
    type: 'string',
    title: '管理人員',
    width: 120,
    align: 'center',
    req: true,
  },{
    dataIndex: 'progress',
    type: 'string',
    title: '項目進度',
    width: 200,
    req: true,
  },{
    dataIndex: 'remark',
    type: 'string',
    title: '備註',
    width: 200,
    req: true,
  },
]



export const json_user = [{
      dataIndex: 'id',
      type: 'string',
      title: '編號',
      width: 60,
      fixed: 'left',
      align: 'center',
    },{
      dataIndex: 'dep_id',
      type: 'string',
      title: '所屬部門',
      width: 120,
      fixed: 'left',
      align: 'center',
    },{
      dataIndex: 'usr',
      type: 'string',
      title: '用戶',
      width: 200,
       align: 'center',
    },{
      dataIndex: 'pwd',
      type: 'string',
      title: '密碼',
      width: 200,
      align: 'center',
      render: (text, r) => {
        var lastChar = text[text.length - 1];

        return <span>{`*****${lastChar}`}</span>
      }
      
      
    }
  ]
