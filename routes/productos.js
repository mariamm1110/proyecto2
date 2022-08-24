const express = require('express');
const router = express.Router();
const productsController=require('../controllers/productsController');

const multer=require('multer');
const storage=multer.diskStorage({
    destination:function(req,file,cb){
        cb(null,'public/img/imgHome/')
    },
    filename:function(req,file,cb){
        cb(null,file.fieldname+'-'+Date.now()+(file.originalname))
    }
})
const upload=multer({storage:storage})
router.get('/',productsController.index);
router.get('/home',productsController.index);
router.get('/productos/detail/:id',productsController.detail);
router.get('/productos/',productsController.productos);
router.get('/productos/borrar/',productsController.borrar);
router.delete('/productos/borrar/:id',productsController.destroy);
router.get('/productos/agregar',productsController.create);
router.put('/productos/editar/:id',upload.array('pcfiles'),productsController.store);
router.get('/productos/editar/',productsController.editar);
router.post('/productos',upload.array('pcfiles'),productsController.store);
router.get('/productos/editar/:id',productsController.edit);
module.exports=router;