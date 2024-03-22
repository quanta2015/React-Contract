var ExcelJS = require('exceljs');


// module.exports.clone=(obj)=> {
//   let copy = Array.isArray(obj) ? [] : {};
//   for (let key in obj) {
//       let value = obj[key];
//       copy[key] = (typeof value === 'object' && value !== null) ? clone(value) : value;
//   }
//   return copy;
// } 


module.exports.clone = (e) => {
  return JSON.parse(JSON.stringify(e))
}



module.exports.isN = (e) => {
  return ((e === null) || (e === '') || (e === undefined)) ? true : false
}


module.exports.formatJSON = (list,key) => {
  return list.map(o => {
    let json = JSON.parse(o[key]);
    // Object.keys(json).forEach(item => {
    //   o[item] = json[item];
    // });
    // delete o[key]; 
    o[key]=json
    return o; 
  });
}



module.exports.arrayToExcel=async(data, filePath)=> {
  const OFFSET = 2
  const workbook = new ExcelJS.Workbook();  
  const sheet = workbook.addWorksheet('PART');

  // 添加标题行（基于对象的第一个元素的键）
  sheet.addRow(Object.keys(data[0]));

  // 添加数据行
  data.forEach(item => {
    item.info = JSON.parse(item.info).map(obj => `${obj.key}: ${obj.val}`).join('; ');
    item.sup_info = JSON.parse(item.sup_info).phone; // 仅作为示例
    sheet.addRow(Object.values(item));
  });

  sheet.columns.forEach(column => {
    let maxLength = 0;
    column.eachCell({ includeEmpty: true }, cell => {
      let columnLength = cell.value ? cell.value.toString().length : 10;
      if (columnLength > maxLength) {
        maxLength = columnLength;
      }
    });
    column.width = maxLength < 10 ? 10 : maxLength+OFFSET;
  });
  await workbook.xlsx.writeFile(filePath);
}