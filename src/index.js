import express from 'express'
import { PORT } from './config/config.js'
import usuariosRoutes from './routes/usuario.routes.js'
import publicacionRouter from './routes/public.routes.js'
import rolesRoutes from './routes/roles.routes.js'
import categoriaRoutes from './routes/categorias.routes.js'

const app = express()
app.use(express.json())


app.use(categoriaRoutes)
app.use(rolesRoutes)
app.use(publicacionRouter)
app.use(usuariosRoutes)
app.listen(PORT, () => console.log('Server running on : http://localhost:'+ PORT))