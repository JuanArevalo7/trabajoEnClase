const express=require('express');
const mongoose=require('mongoose');
const bodyParser=require('body-parser');
const cors=require('cors');
const itemRoutes=require('./routes/productoRoutes')

const app=express();
const PORT=3000

//Middleware

app.use(bodyParser.json())
app.use(cors())

//(CONEXION A MONGO DB USANDO MONGOOSE
mongoose.conect('mongodb://localhost:27017/miapp',{
    useNewUrlParser:true,
    useUnifiedTopologt:true,
})
.then(()=>console,log("MongoDb conectado"))
.catch(err=>cibsike.err(err))

// rutas
app.use('api/items',itemRoutes)
app.listen(PORT,()=>){
    console.log(`servidor conectado en http://localhost:${3000}`)
}