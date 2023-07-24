require('dotenv').config();

const http = require('http')
const odbc = require('odbc')
const url = require('url')
const fs = require('fs');
const path = require('path');



async function connectAndCall (req, res, data) {
  // const connectionString = 'DRIVER={SQL Server};SERVER=(WQ-HP\SQLEXPRESS);DATABASE=account;UID=wing;PWD=w;';
  // const cnx = await odbc.connect(connectionString);

  const cnx = await odbc.connect('DSN=account')

  const currentDate = new Date()
  const year = currentDate.getFullYear()
  const month = String(currentDate.getMonth() + 1).padStart(2, '0')
  const day = String(currentDate.getDate()).padStart(2, '0')
  const formatedDate = `${year}-${month}-${day}`

  try {
    if (req.method === 'POST' && req.url == '/add') {
      sql = `INSERT INTO account (site, url, login, pwd, comment, template) VALUES ('${data.site}', '${data.url}', '${data.login}', '${data.pwd}', '${data.comment}', 1)`
      await cnx.query(sql);

      const sqlId = await cnx.query(`SELECT @@IDENTITY as id`);
      itemId = sqlId[0].id;

      getItem = 'True';
    } else if (req.method === 'POST' && req.url == '/update') {
      sql = `UPDATE account SET site='${data.site}', url='${data.url}', login='${data.login}', pwd='${data.pwd}', comment='${data.comment}', dateModif='${formatedDate}' WHERE Id=${data.id}`
      await cnx.query(sql);

      itemId = data.id;
      getItem = 'True';
    } else if (req.method === 'POST' && req.url == '/delete') {
      sql = `UPDATE account SET template=${data.deltype}, dateModif='${formatedDate}', dateCheck=null WHERE Id=${data.id}`
      await cnx.query(sql);
      itemId = data.id;
      getItem = 'True';
    } else if (req.method === 'POST' && req.url == '/check') {
      sql = `UPDATE account SET dateCheck='${formatedDate}' WHERE Id=${data.id}`
      await cnx.query(sql);
      itemId = data.id;
      getItem = 'True';
    } else if (req.method === 'GET' && req.url == '/item') {
      const parsedUrl = url.parse(req.url, true);
      itemId = parsedUrl.query.id;
      getItem = 'True';
    } else if (req.method === 'GET' && req.url == '/items') {
      sql = `SELECT id, site, url, login, pwd, comment, dateModif, dateCheck, template FROM account WHERE template<>3 ORDER BY id DESC`
      getItem = 'False';
    }

    if (getItem == 'True') {
      sql = `SELECT id, site, url, login, pwd, comment, dateModif, dateCheck, template FROM account WHERE id=${itemId}`
    }

    const rows = await cnx.query(sql);
    const jsonData = JSON.stringify(rows);

    res.setHeader('Content-Type', 'application/json')
    res.statusCode = 200;
    res.end(jsonData);
  } catch (error) {
    console.error(error);
  } finally {
    cnx.close();
  }
}

const port = process.env.PORT;





const folderPath = 'C:\\Users\\WingQiqi\\Desktop\\doublons';
const folders = [];

function allElements (folderPath) {
  fs.readdirSync(folderPath).forEach(file => {
    const filePath = path.join(folderPath, file);
    const isDirectory = fs.statSync(filePath).isDirectory();
    folders.push(filePath);

    if (isDirectory) {
        const folderPath = filePath;
        allElements (folderPath)
    }  
  })
};


allElements (folderPath);
console.log(folders);

// fs.readdirSync(folderPath).forEach(file => {
//   const filePath = path.join(folderPath, file);
//   const isDirectory = fs.statSync(filePath).isDirectory();


//   if (isDirectory) 
//         { isSub='(Niv1 - Oui)';
//           const folderPath = filePath;
 
//             fs.readdirSync(folderPath).forEach(file => {
//               const filePath = path.join(folderPath, file);
//               const isDirectory = fs.statSync(filePath).isDirectory();
//               if (isDirectory) 
//                 { isSub='(Niv2 - Oui)';  }
//                 else 
//                 { isSub='(Niv2 - Non)' }
              
//               // folders.push(filePath +' '+isSub+' Niv 2' )  ;        
//                folders.push(filePath)  
//             });

      

//       }
//       else 
//         { isSub='(Niv1 - Non)' }
  
//   // folders.push(filePath+' '+isSub);
//   folders.push(filePath);
  
// });





const server = http.createServer(async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    res.statusCode = 200;
    res.end();
  } else if (req.method === 'GET') {
    await connectAndCall(req, res, null);
  } else if (req.method === 'POST') {
    req.on('data', async data => {
      await connectAndCall(req, res, JSON.parse(data));
    })
    req.on('end', () => {});
  }
})










server.listen(port, () => {
  console.log('listening... on ' + port);
})
